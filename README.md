# location-exercise

* Detailed instructions and specification for the exercise: `./doc/location-exercise.pdf`

## Prerequisites

* PostgreSQL-database

## Database

* Postgres connection string can be configured in config.js file.
* sql-directory contains table creation clauses and some test data.

## Running

* `npm install --global gulp-cli`
* `npm install`
* `gulp get-matches --country=nl --geo=52.433200,4.959812`
* More example gulp-commands can be found in sql/test_data.sql

## Country-based distances

* Distances can be changed in config.js file.
