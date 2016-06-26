/*

id: 20 chars, primary key
name: 255 chars
country_code: 2 chars
latitude: number
longitude: number
gender: 1 char
preferences: 255 chars, comma separated list: fridge, windows, laundry, ironing, oven

*/

CREATE TABLE cleaner(
   id             char(20) PRIMARY KEY,
   name           char(255),
   country_code   char(2),
   latitude       numeric,
   longitude      numeric,
   gender         char(1),
   preferences    char(255)
);
