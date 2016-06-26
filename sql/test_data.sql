TRUNCATE cleaner;

/*

a. Germany: 10 km
b. Austria: 20 km
c. Switzerland: 17.5 km
d. Netherlands: 9 km

de, at, ch, nl

*/

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('NWU13z1PbC32Dg3KroTt', 'David', 'de', '52.534185', '13.556614', 'M', 'fridge,laundry');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('t1acouwiEflejouproep', 'Maria', 'de', '52.506609', '13.366413', 'F', 'fridge,windows,ironing,oven');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('xl3ToExiUqoeSwOEstl6', 'Hans', 'de', '52.5126466', '13.4154251', 'M', 'laundry,fridge,windows,oven');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('6Iun0amLehiutrOusLub', 'Marta', 'de', '52.462913', '13.416195', 'F', 'oven,fridge,laundry');

/*
gulp get-matches --country=de --geo=52.5126466,13.4154251 --gender=F --preferences=windows,oven     | Maria
gulp get-matches --country=de --geo=52.5126466,13.4154251                                           | Hans, Maria, Marta, David
gulp get-matches --country=de --geo=52.5126466,13.4154251 --gender=M                                | Hans, David
gulp get-matches --country=de --geo=52.5242640,13.4035780 --preferences=oven                        | Hans, Maria, Marta
gulp get-matches --country=de --geo=52.5126466,13.4154251 --gender=F --preferences=oven,laundry     | Marta
gulp get-matches --country=de --geo=52.5126466,13.4154251 --gender=F --preferences=ironing,laundry  | No matches found.
gulp get-matches --country=de --geo=52.6270200,13.2424740                                           | No matches found.
*/

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('brO4WrIaSPiEWrleBroe', 'Julia', 'at', '48.210033', '16.363449', 'F', 'fridge,windows,laundry,ironing,oven,bathroom');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('to9rlaR5awrIefle2oud', 'Lukas', 'at', '48.114537', '16.404133', 'M', 'windows,oven');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('fro1phluhiu4hoeRlAg8', 'Vanessa', 'at', '48.103763', '16.500263', 'F', 'laundry,ironing,oven,dishes');

/*
gulp get-matches --country=at --geo=48.174328,16.381817                                    | Julia, Lukas, Vanessa
gulp get-matches --country=at --geo=48.184401,16.405849                                    | Julia, Lukas, Vanessa
gulp get-matches --country=at --geo=48.174328,16.381817 --gender=F                         | Julia, Vanessa
gulp get-matches --country=at --geo=48.174328,16.381817 --gender=M                         | Lukas
gulp get-matches --country=at --geo=48.174328,16.381817 --preferences=windows,oven         | Julia, Lukas
*/

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('FroA5LaglejlEtLesiEs', 'Simon', 'ch', '46.519962', '6.633597', 'M', 'oven');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('g6eWroatRou9iuyoufr8', 'Kevin', 'ch', '46.536547', '6.658487', 'M', 'dishes,fridge,bathroom,windows,laundry,ironing,oven');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('T2O8SLaTHo0prla9rOab', 'Laura', 'ch', '46.516587', '6.608448', 'F', 'ironing,fridge,windows,laundry,oven');

/*
gulp get-matches --country=ch --geo=46.510680,6.634197 --gender=F                                                      | Laura
gulp get-matches --country=ch --geo=46.516395,6.639358                                                                 | Simon, Laura, Kevin
gulp get-matches --country=ch --geo=46.586474,6.432323                                                                 | Laura, Simon
gulp get-matches --country=ch --geo=46.699377,6.871262                                                                 | No matches found.
gulp get-matches --country=ch --geo=46.527690,6.599951 --preferences=bathroom                                          | Kevin
gulp get-matches --country=ch --geo=46.527690,6.599951 --preferences=bathroom,dishes,oven,laundry,fridge --gender=M    | Kevin
*/

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('53EZleklEn8usoutiEtr', 'Max', 'nl', '52.370216', '4.895168', 'M', 'oven,laundry,windows,fridge');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('thoutrIAn2uCHLum1ach', 'Emma', 'nl', '52.393830', '4.990368', 'F', 'bathroom');

INSERT INTO cleaner (id, name, country_code, latitude, longitude, gender, preferences)
VALUES ('9pLudriacIawLE1hoUvl', 'Stan', 'nl', '52.685540', '5.065556', 'M', 'bathroom,laundry,oven,fridge,ironing');

/*
gulp get-matches --country=nl --geo=52.3650172,4.8375675 --gender=F --preferences=fridge,ironing    | No matches found.
gulp get-matches --country=nl --geo=52.367215,4.802914                                              | Max
gulp get-matches --country=nl --geo=52.433200,4.959812                                              | Emma, Max
gulp get-matches --country=nl --geo=52.433200,4.959812 --gender=F                                   | Emma
gulp get-matches --country=nl --geo=52.433200,4.959812 --preferences=bathroom                       | Emma
gulp get-matches --country=nl --geo=52.433200,4.959812 --preferences=bathroom,ironing               | No matches found.
*/
