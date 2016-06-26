'use strict'

var q = require('Q')
var fs = require('fs')
var config = require('./config')
var pg = require('pg')
var conString = config.conString
var client = new pg.Client(conString)
var buffer = fs.readFileSync('./query.sql')
var query = buffer.toString()

function whereHelper (field, params) {
  if (params.length === 0) {
    return ''
  }
  var prefsWHERE = ' AND ' + field + ' LIKE '
  for (var p in params) {
    prefsWHERE += '\'%' + params[p] + '%\''
    if (p < params.length - 1) {
      prefsWHERE += ' AND ' + field + ' LIKE '
    }
  }
  return prefsWHERE
}

function printableRows (rows) {
  var str = []
  for (var i = 0; i < rows.length; ++i) {
    var row = rows[i]
    str.push('- id: ' + row.id + ' - name: ' + row.name.trim() + ' - gender: ' + row.gender + ' - preferences: ' + row.preferences.trim() + ' - distance: ' + row.distance)
  }
  return str
}

function getMatches (country, geo, gender, preferences) {
  var dfd = q.defer()
  var prefsSQL = ''

  if (preferences) {
    prefsSQL = whereHelper('preferences', preferences.trim().split(','))
  }

  gender = gender || '%'
  preferences = '%' + preferences + '%' || '%'
  var paramLatitude = geo.split(',')[0]
  var paramLongitude = geo.split(',')[1]
  var maxDistance

  maxDistance = config.distance[country]

  query = query.replace(/:country/g, country)
    .replace(/:paramLatitude/g, paramLatitude)
    .replace(/:paramLongitude/g, paramLongitude)
    .replace(/:gender/g, gender)
    .replace(/:preferensesSQL/g, prefsSQL)
    .replace(/:maxDistance/g, maxDistance)

  client.connect(function (err) {
    if (err) {
      console.error('could not connect to postgres', err)
      dfd.reject(err)
    }
    client.query(query, function (err, result) {
      if (err) {
        dfd.reject(err)
        console.error('error running query', err)
      }
      client.end()
      if (result && result.rows && result.rows.length > 0) {
        dfd.resolve(printableRows(result.rows))
      } else {
        dfd.resolve(['No matches found.'])
      }
    })
  })
  return dfd.promise
}

exports.getMatches = getMatches
