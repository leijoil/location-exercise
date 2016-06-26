'use strict'

var gulp = require('gulp')
var argv = require('yargs').argv
var main = require('./main')

gulp.task('get-matches', function (done) {
  var country = argv.country
  var geo = argv.geo
  var gender = argv.gender || ''
  var preferences = argv.preferences || ''

  if (typeof country !== 'undefined' && typeof geo !== 'undefined') {
    console.log('OK')
  } else {
    console.log('Missing parameters!')
    done()
  }
})
