-- Import statement for "Countries" table's information, read in from the "Medals.xlsx" provided, which was exported to a .csv file
LOAD DATA LOCAL INFILE 'Medals.csv'
INTO TABLE Countries 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ranking, countryName, numGold, numSilver, numBronze, numMedals);

-- Insertion of Countries that didn't earn any medals at the games, and hence aren't in the Medals list
INSERT INTO Countries(countryName) VALUES('Afghanistan');
INSERT INTO Countries(countryName) VALUES('Albania');
INSERT INTO Countries(countryName) VALUES('Algeria');
INSERT INTO Countries(countryName) VALUES('American Samoa');
INSERT INTO Countries(countryName) VALUES('Andorra');
INSERT INTO Countries(countryName) VALUES('Angola');
INSERT INTO Countries(countryName) VALUES('Antigua and Barbuda');
INSERT INTO Countries(countryName) VALUES('Aruba');
INSERT INTO Countries(countryName) VALUES('Bangladesh');
INSERT INTO Countries(countryName) VALUES('Barbados');
INSERT INTO Countries(countryName) VALUES('Belize');
INSERT INTO Countries(countryName) VALUES('Benin');
INSERT INTO Countries(countryName) VALUES('Bhutan');
INSERT INTO Countries(countryName) VALUES('Bolivia');
INSERT INTO Countries(countryName) VALUES('Bosnia and Herzegovina');
INSERT INTO Countries(countryName) VALUES('Brunei Darussalam');
INSERT INTO Countries(countryName) VALUES('Burundi');
INSERT INTO Countries(countryName) VALUES('Cambodia');
INSERT INTO Countries(countryName) VALUES('Cameroon');
INSERT INTO Countries(countryName) VALUES('Cape Verde');
INSERT INTO Countries(countryName) VALUES('Cayman Islands');
INSERT INTO Countries(countryName) VALUES('Central African Republic');
INSERT INTO Countries(countryName) VALUES('Chad');
INSERT INTO Countries(countryName) VALUES('Chile');
INSERT INTO Countries(countryName) VALUES('Congo');
INSERT INTO Countries(countryName) VALUES('Cook Islands');
INSERT INTO Countries(countryName) VALUES('Costa Rica');
INSERT INTO Countries(countryName) VALUES('Cyprus');
INSERT INTO Countries(countryName) VALUES('Democratic Republic of the Congo');
INSERT INTO Countries(countryName) VALUES('Democratic Republic of Timor-Leste');
INSERT INTO Countries(countryName) VALUES('Dijibouti');
INSERT INTO Countries(countryName) VALUES('Dominica');
INSERT INTO Countries(countryName) VALUES('El Salvador');
INSERT INTO Countries(countryName) VALUES('Equatorial Guinea');
INSERT INTO Countries(countryName) VALUES('Eritrea');
INSERT INTO Countries(countryName) VALUES('Eswatini');
INSERT INTO Countries(countryName) VALUES('Federated States of Micronesia');
INSERT INTO Countries(countryName) VALUES('Gabon');
INSERT INTO Countries(countryName) VALUES('Gambia');
INSERT INTO Countries(countryName) VALUES('Guam');
INSERT INTO Countries(countryName) VALUES('Guatemala');
INSERT INTO Countries(countryName) VALUES('Guinea');
INSERT INTO Countries(countryName) VALUES('Guinea-Bissau');
INSERT INTO Countries(countryName) VALUES('Guyana');
INSERT INTO Countries(countryName) VALUES('Haiti');
INSERT INTO Countries(countryName) VALUES('Honduras');
INSERT INTO Countries(countryName) VALUES('Iceland');
INSERT INTO Countries(countryName) VALUES('Iraq');
INSERT INTO Countries(countryName) VALUES('Kiribati');
INSERT INTO Countries(countryName) VALUES('Lao People''s Democratic Republic');
INSERT INTO Countries(countryName) VALUES('Lebanon');
INSERT INTO Countries(countryName) VALUES('Lesotho');
INSERT INTO Countries(countryName) VALUES('Liberia');
INSERT INTO Countries(countryName) VALUES('Libya');
INSERT INTO Countries(countryName) VALUES('Liechtenstein');
INSERT INTO Countries(countryName) VALUES('Luxembourg');
INSERT INTO Countries(countryName) VALUES('Madagascar');
INSERT INTO Countries(countryName) VALUES('Malawi');
INSERT INTO Countries(countryName) VALUES('Maldives');
INSERT INTO Countries(countryName) VALUES('Mali');
INSERT INTO Countries(countryName) VALUES('Malta');
INSERT INTO Countries(countryName) VALUES('Marshall Islands');
INSERT INTO Countries(countryName) VALUES('Mauritania');
INSERT INTO Countries(countryName) VALUES('Mauritius');
INSERT INTO Countries(countryName) VALUES('Monaco');
INSERT INTO Countries(countryName) VALUES('Montenegro');
INSERT INTO Countries(countryName) VALUES('Mozambique');
INSERT INTO Countries(countryName) VALUES('Myanmar');
INSERT INTO Countries(countryName) VALUES('Nauru');
INSERT INTO Countries(countryName) VALUES('Nepal');
INSERT INTO Countries(countryName) VALUES('Nicaragua');
INSERT INTO Countries(countryName) VALUES('Niger');
INSERT INTO Countries(countryName) VALUES('Oman');
INSERT INTO Countries(countryName) VALUES('Pakistan');
INSERT INTO Countries(countryName) VALUES('Palau');
INSERT INTO Countries(countryName) VALUES('Palestine');
INSERT INTO Countries(countryName) VALUES('Panama');
INSERT INTO Countries(countryName) VALUES('Papua New Guinea');
INSERT INTO Countries(countryName) VALUES('Paraguay');
INSERT INTO Countries(countryName) VALUES('Peru');
INSERT INTO Countries(countryName) VALUES('Refugee Olympic Team');
INSERT INTO Countries(countryName) VALUES('Rwanda');
INSERT INTO Countries(countryName) VALUES('Saint Kitts and Nevis');
INSERT INTO Countries(countryName) VALUES('Saint Lucia');
INSERT INTO Countries(countryName) VALUES('Samoa');
INSERT INTO Countries(countryName) VALUES('Sao Tome and Principe');
INSERT INTO Countries(countryName) VALUES('Senegal');
INSERT INTO Countries(countryName) VALUES('Seychelles');
INSERT INTO Countries(countryName) VALUES('Sierra Leone');
INSERT INTO Countries(countryName) VALUES('Singapore');
INSERT INTO Countries(countryName) VALUES('Solomon Islands');
INSERT INTO Countries(countryName) VALUES('Somalia');
INSERT INTO Countries(countryName) VALUES('South Sudan');
INSERT INTO Countries(countryName) VALUES('Sri Lanka');
INSERT INTO Countries(countryName) VALUES('St Vincent and the Grenadines');
INSERT INTO Countries(countryName) VALUES('Sudan');
INSERT INTO Countries(countryName) VALUES('Suriname');
INSERT INTO Countries(countryName) VALUES('Tajikistan');
INSERT INTO Countries(countryName) VALUES('Togo');
INSERT INTO Countries(countryName) VALUES('Tonga');
INSERT INTO Countries(countryName) VALUES('Trinidad and Tobago');
INSERT INTO Countries(countryName) VALUES('Tuvalu');
INSERT INTO Countries(countryName) VALUES('United Arab Emirates');
INSERT INTO Countries(countryName) VALUES('United Republic of Tanzania');
INSERT INTO Countries(countryName) VALUES('Uruguay');
INSERT INTO Countries(countryName) VALUES('Vanuatu');
INSERT INTO Countries(countryName) VALUES('Vietnam');
INSERT INTO Countries(countryName) VALUES('Virgin Islands, British');
INSERT INTO Countries(countryName) VALUES('Virgin Islands, US');
INSERT INTO Countries(countryName) VALUES('Yemen');
INSERT INTO Countries(countryName) VALUES('Zambia');
INSERT INTO Countries(countryName) VALUES('Zimbabwe');

-- Import statement for "Discipline" table's information, read in from the "EntriesGender.xlsx" provided, which was exported to a .csv file
LOAD DATA LOCAL INFILE 'EntriesGender.csv'
INTO TABLE Disciplines 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(disciplineName, femaleParticipants, maleParticipants, totalParticipants);

-- Import statement for "Event" table's information, read in from the "EntriesGender.xlsx" provided, which was exported to a .csv file
\. import_events.sql

-- Import statement for "Coaches" table's information, read in from the "Coaches.xlsx" provided, which was exported to a .csv file
\. import_coaches.sql

-- Import statement for "Athletes" table's information, read in from the "Athletes.csv" provided from the second dataset
\. import_athletes.sql

-- Import statement for "Results" table's information, read in from the "Results.csv" provided from the "medals.csv" of the second dataset
\. import_results.sql
