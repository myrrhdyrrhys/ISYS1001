-- Create statement for Countries table (those that participated in the 2020 Olympic games)
CREATE TABLE Countries(
    countryName VARCHAR(35) NOT NULL,   -- Country names are character strings of variable length ("Democratic Republic of Timor-Leste" is 34 char long)
    numGold INT(2) DEFAULT 0,           -- Number of Gold medals the country won
    numSilver INT(2) DEFAULT 0,         -- Number of Silver medals the country won
    numBronze INT(2) DEFAULT 0,         -- Number of Bronze medals the country won
    numMedals INT(2) DEFAULT 0,         -- Total number of medals
    ranking INT(2) DEFAULT NULL,        -- Overall ranking against other countries when medals are pointed
    PRIMARY KEY(countryName)
);

-- Create statement for Discipline table (ie. the various sports/activities the Olympic games offer)
CREATE TABLE Disciplines(
    disciplineName VARCHAR(25) NOT NULL,    -- Discipline names are character strings of variable length ("Cycling Mountain Bike" is 21 char long)
    femaleParticipants INT(4) DEFAULT 0,    -- Number of female participants in the discipline category
    maleParticipants INT(4) DEFAULT 0,      -- Number of male participants in the discipline category
    totalParticipants INT(4) DEFAULT 0,     -- Total number of participants in the discipline category (SUM of female/maleParticipants)
    PRIMARY KEY(disciplineName)
);

-- Create statement for Events table (subclass of Discipline) (i.e. "Mixed Team" Archery)
CREATE TABLE Events(
    eventName VARCHAR(35) NOT NULL,         -- Event names are character strings of variable length ("Women's 4 x 200m Freestyle Relay" is 32 char long)
    disciplineName VARCHAR(25) NOT NULL,    -- Reference to the Discipline of which the Event belongs
    PRIMARY KEY(eventName, disciplineName),
    FOREIGN KEY(disciplineName) REFERENCES Disciplines(disciplineName) ON DELETE CASCADE
);

-- Create statement for Coaches table (those that taught the Athletes that participated in the given Disciplines for the given Country)
CREATE TABLE Coaches(
    coachName VARCHAR(35) NOT NULL,         -- Coach names are character strings of variable length ("MACKINTOSH Euan Michael Gordon" is 30 char long)
    countryName VARCHAR(35) NOT NULL,       -- Reference to the Country the Coach hails from
    disciplineName VARCHAR(25) NOT NULL,    -- Reference to the Discipline the Coach specialises in teaching
    eventName VARCHAR(35) DEFAULT NULL,     -- Optional reference to the Event in particular the Coach may teach 
    PRIMARY KEY(coachName),
    FOREIGN KEY(countryName) REFERENCES Countries(countryName) ON DELETE CASCADE,
    FOREIGN KEY(disciplineName) REFERENCES Disciplines(disciplineName) ON DELETE CASCADE,
    FOREIGN KEY(eventName) REFERENCES Events(eventName) ON DELETE CASCADE
);

-- Create statement for Athletes table (those actually competing in the Disciplines)
CREATE TABLE Athletes(
    athleteName VARCHAR(40) NOT NULL,       -- Athlete names are character strings of variable length ("SALAH ORABI ABDELGAWWAD Abdelrahman" is 35 char long)
    gender VARCHAR(6),                      -- Athlete may either be Male or Female
    dob DATE,                               -- Athlete's Date of Birth in the format YYYY-MM-DD
    countryName VARCHAR(35) NOT NULL,       -- Reference to the Country the Athlete hails from
    disciplineName VARCHAR(25) NOT NULL,    -- Reference to the Discipline the Athlete participated in at the games
    PRIMARY KEY(athleteName),
    FOREIGN KEY(countryName) REFERENCES Countries(countryName) ON DELETE CASCADE,
    FOREIGN KEY(disciplineName) REFERENCES Disciplines(disciplineName) ON DELETE CASCADE
);

-- Create statement for Results table (who won what medals for what countries)
CREATE TABLE Results(
    medalType VARCHAR(12) NOT NULL,         -- Gold/Silver/Bronze Medal
    medalDate DATE NOT NULL,                -- The date the medal was given out
    athleteName VARCHAR(40) NOT NULL,       -- Name of the Athlete who earned the medal
    countryName VARCHAR(35) NOT NULL,       -- Name of the Country the Athlete represented (could alse just be obtained with countryName from Athlete table in query)
    disciplineName VARCHAR(25) NOT NULL,    -- Name of Discipline the Athlete competed in
    PRIMARY KEY(medalType, medalDate, athleteName),     -- Assumed that no Athlete won two of the same type of medal on the same day
    FOREIGN KEY(athleteName) REFERENCES Athletes(athleteName) ON DELETE CASCADE,
    FOREIGN KEY(countryName) REFERENCES Countries(countryName) ON DELETE CASCADE,
    FOREIGN KEY(disciplineName) REFERENCES Disciplines(disciplineName) ON DELETE CASCADE
);
