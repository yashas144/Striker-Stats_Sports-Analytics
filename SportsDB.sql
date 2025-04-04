CREATE TABLE Users (
UserID   INTEGER AUTO_INCREMENT PRIMARY KEY,
UserName TEXT NOT NULL,
UserPassword  TEXT NOT NULL,
UserFirstName TEXT NOT NULL,
UserLastName TEXT, 
UserRole TEXT,
Email TEXT,
Mobile TEXT
);

CREATE TABLE TeamInfo (
TeamID   INTEGER AUTO_INCREMENT PRIMARY KEY,
TeamName TEXT NOT NULL,
Country  TEXT NOT NULL,
NumOfMatchesPlayed INTEGER NOT NULL,
MatchesWon INTEGER, 
MatchesLost INTEGER,
MatchesTie INTEGER,
TotalGoalsScored INTEGER,
ManagerID INTEGER,
CONSTRAINT FK_ManagerID FOREIGN KEY (ManagerID)
    REFERENCES Users(UserID)
);

CREATE TABLE MatchInfo (
MatchID  INTEGER AUTO_INCREMENT PRIMARY KEY,
MatchName TEXT NOT NULL,
Venue TEXT NOT NULL,
MatchDate DATE 
);

CREATE TABLE MatchHistory (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
MatchID  INTEGER, 
TeamID INTEGER,
PlayedAgainst INTEGER,
MatchResult TEXT,
CONSTRAINT FK_MatchID FOREIGN KEY (MatchID)
    REFERENCES MatchInfo(MatchID),
    CONSTRAINT FK_TeamID FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID),
       CONSTRAINT FK_PlayedAgainst FOREIGN KEY (PlayedAgainst)
    REFERENCES TeamInfo(TeamID)
);

CREATE TABLE PlayerInfo (
PlayerID INTEGER AUTO_INCREMENT PRIMARY KEY,
PlayerName  TEXT, 
Age INTEGER,
DOB Date,
Gender TEXT,
TotalGoalsScored INTEGER
);

CREATE TABLE TeamPlayers (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
TeamID INTEGER,
PlayerID  INTEGER, 
 CONSTRAINT FK_TeamID_TeamPlayers FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID),
 CONSTRAINT FK_PlayerID_TeamPlayers FOREIGN KEY (PlayerID)
    REFERENCES PlayerInfo(PlayerID)
);


CREATE TABLE TeamAwards (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
TeamID INTEGER,
MatchID INTEGER,
PlayerID  INTEGER,
AwardName TEXT,
DateofAward DATE,
 CONSTRAINT FK_MatchID_TeamAwards FOREIGN KEY (MatchID)
    REFERENCES MatchInfo(MatchID),
 CONSTRAINT FK_PlayerID_TeamAwards FOREIGN KEY (PlayerID)
    REFERENCES PlayerInfo(PlayerID),
CONSTRAINT FK_TeamID_TeamAwards FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID)

);

CREATE TABLE PlayerAwards (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
MatchID INTEGER,
PlayerID  INTEGER,
TeamID INTEGER,
AwardName TEXT,
DateofAward DATE,
 CONSTRAINT FK_MatchID_PlayerAwards FOREIGN KEY (MatchID)
    REFERENCES MatchInfo(MatchID),
 CONSTRAINT FK_PlayerID_PlayerAwards FOREIGN KEY (PlayerID)
    REFERENCES PlayerInfo(PlayerID),
 CONSTRAINT FK_TeamID_PlayerAwards FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID)

);


CREATE TABLE TeamHistory (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
MatchID INTEGER,
TeamID INTEGER,
PlayedAgainst INTEGER,
MatchDate DATE,
MatchResult TEXT,
GoalsScored INTEGER,
 CONSTRAINT FK_MatchID_TeamHistory FOREIGN KEY (MatchID)
    REFERENCES MatchInfo(MatchID),
 CONSTRAINT FK_PlayedAgainst_TeamHistory FOREIGN KEY (PlayedAgainst)
    REFERENCES TeamInfo(TeamID),
 CONSTRAINT FK_TeamID_TeamHistory FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID)

);


CREATE TABLE PlayerHistory (
ID INTEGER AUTO_INCREMENT PRIMARY KEY,
PlayerID INTEGER,
MatchID INTEGER,
TeamID INTEGER,
PlayedAgainst INTEGER,
MatchDate DATE,
MatchResult TEXT,
GoalsScored INTEGER,
 CONSTRAINT FK_MatchID_PlayerHistory FOREIGN KEY (MatchID)
    REFERENCES MatchInfo(MatchID),
 CONSTRAINT FK_PlayedAgainst_PlayerHistory FOREIGN KEY (PlayedAgainst)
    REFERENCES TeamInfo(TeamID),
 CONSTRAINT FK_TeamID_PlayerHistory FOREIGN KEY (TeamID)
    REFERENCES TeamInfo(TeamID),
 CONSTRAINT FK_PlayerID_PlayerHistory FOREIGN KEY (PlayerID)
    REFERENCES PlayerInfo(PlayerID)

);

INSERT INTO PlayerInfo (PlayerID, PlayerName, Age, DOB, Gender, TotalGoalsScored) VALUES
(1, 'Cristiano Ronaldo', 39, '1985-02-05', 'Male', 128),         -- as of March 2025
(2, 'Lionel Messi', 37, '1987-06-24', 'Male', 106),
(3, 'Neymar Jr', 33, '1992-02-05', 'Male', 79),
(4, 'Kylian Mbappé', 26, '1998-12-20', 'Male', 46),
(5, 'Robert Lewandowski', 36, '1988-08-21', 'Male', 82),
(6, 'Harry Kane', 31, '1993-07-28', 'Male', 63),
(7, 'Erling Haaland', 24, '2000-07-21', 'Male', 31),
(8, 'Mohamed Salah', 32, '1992-06-15', 'Male', 55),
(9, 'Kevin De Bruyne', 33, '1991-06-28', 'Male', 27),
(10, 'Luka Modrić', 39, '1985-09-09', 'Male', 25),
(11, 'Sergio Ramos', 38, '1986-03-30', 'Male', 23),
(12, 'Virgil van Dijk', 33, '1991-07-08', 'Male', 9),
(13, 'Karim Benzema', 37, '1987-12-19', 'Male', 37),
(14, 'Antoine Griezmann', 34, '1991-03-21', 'Male', 44),
(15, 'Toni Kroos', 35, '1990-01-04', 'Male', 17),
(16, 'Eden Hazard', 34, '1991-01-07', 'Male', 33),
(17, 'Raheem Sterling', 30, '1995-12-08', 'Male', 20),
(18, 'Paulo Dybala', 31, '1993-11-15', 'Male', 9),
(19, 'Zlatan Ibrahimović', 43, '1981-10-03', 'Male', 62),
(20, 'Manuel Neuer', 39, '1986-03-27', 'Male', 0),  -- Goalkeeper
(21, 'Bukayo Saka', 23, '2001-09-05', 'Male', 12),
(22, 'Phil Foden', 24, '2000-05-28', 'Male', 10),
(23, 'Jude Bellingham', 21, '2003-06-29', 'Male', 10),
(24, 'João Félix', 25, '1999-11-10', 'Male', 7),
(25, 'Kai Havertz', 25, '1999-06-11', 'Male', 13),
(26, 'Mason Mount', 26, '1999-01-10', 'Male', 7),
(27, 'Pedri', 22, '2002-11-25', 'Male', 5),
(28, 'Gavi', 20, '2004-08-05', 'Male', 3),
(29, 'Rodri', 28, '1997-06-22', 'Male', 7),
(30, 'Declan Rice', 26, '1999-01-14', 'Male', 4),
(31, 'Joshua Kimmich', 30, '1995-02-08', 'Male', 6),
(32, 'Federico Valverde', 26, '1998-07-22', 'Male', 5),
(33, 'Aurélien Tchouaméni', 25, '2000-01-27', 'Male', 2),
(34, 'Alphonso Davies', 24, '2000-11-02', 'Male', 12),
(35, 'Achraf Hakimi', 26, '1998-11-04', 'Male', 9),
(36, 'Theo Hernández', 27, '1997-10-06', 'Male', 7),
(37, 'Trent Alexander-Arnold', 26, '1998-10-07', 'Male', 4),
(38, 'Reece James', 25, '1999-12-08', 'Male', 3),
(39, 'Rúben Dias', 27, '1997-05-14', 'Male', 2),
(40, 'Marquinhos', 30, '1994-05-14', 'Male', 7),
(41, 'Aymeric Laporte', 30, '1994-05-27', 'Male', 3),
(42, 'Alisson Becker', 32, '1992-10-02', 'Male', 0),
(43, 'Thibaut Courtois', 32, '1992-05-11', 'Male', 0),
(44, 'Gianluigi Donnarumma', 26, '1999-02-25', 'Male', 0),
(45, 'Marc-André ter Stegen', 33, '1992-04-30', 'Male', 0),
(46, 'Ederson Moraes', 31, '1993-08-17', 'Male', 0),
(47, 'Lautaro Martínez', 27, '1997-08-22', 'Male', 22),
(48, 'Olivier Giroud', 38, '1986-09-30', 'Male', 57),
(49, 'Álvaro Morata', 32, '1992-10-23', 'Male', 34),
(50, 'Christian Pulisic', 26, '1998-09-18', 'Male', 28);

INSERT INTO PlayerInfo (PlayerID, PlayerName, Age, DOB, Gender, TotalGoalsScored) VALUES 
(51, 'Heung-Min Son', 32, '1992-07-08', 'Male', 41),
(52, 'Christian Eriksen', 33, '1992-02-14', 'Male', 39),
(53, 'Luka Jović', 27, '1997-12-23', 'Male', 15),
(54, 'Hirving Lozano', 29, '1995-07-30', 'Male', 18),
(55, 'Keylor Navas', 38, '1986-12-15', 'Male', 0),
(56, 'Takumi Minamino', 30, '1995-01-16', 'Male', 19),
(57, 'Sardar Azmoun', 30, '1995-01-01', 'Male', 44),
(58, 'Teemu Pukki', 35, '1990-03-29', 'Male', 38),
(59, 'Jan Oblak', 32, '1992-01-07', 'Male', 0),
(60, 'Ermir Lenjani', 35, '1989-08-05', 'Male', 5);

select * from playerinfo;



