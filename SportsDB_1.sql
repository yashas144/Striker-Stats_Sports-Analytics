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


select * from TeamInfo;


SET SQL_SAFE_UPDATES = 0;
delete from Users;

INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (1, 'user1', 'pass1@2025', 'Roberto', 'Martínez', 'Manager', 'user1@example.com', '+10000000001');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (2, 'user2', 'pass2@2025', 'Lionel', 'Scaloni', 'Manager', 'user2@example.com', '+10000000002');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (3, 'user3', 'pass3@2025', 'Dorival', 'Júnior', 'Manager', 'user3@example.com', '+10000000003');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (4, 'user4', 'pass4@2025', 'Didier', 'Deschamps', 'Manager', 'user4@example.com', '+10000000004');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (5, 'user5', 'pass5@2025', 'Michał', 'Probierz', 'Manager', 'user5@example.com', '+10000000005');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (6, 'user6', 'pass6@2025', 'Gareth', 'Southgate', 'Manager', 'user6@example.com', '+10000000006');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (7, 'user7', 'pass7@2025', 'Ståle', 'Solbakken', 'Manager', 'user7@example.com', '+10000000007');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (8, 'user8', 'pass8@2025', 'Rui', 'Vitória', 'Manager', 'user8@example.com', '+10000000008');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (9, 'user9', 'pass9@2025', 'Domenico', 'Tedesco', 'Manager', 'user9@example.com', '+10000000009');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (10, 'user10', 'pass10@2025', 'Zlatko', 'Dalić', 'Manager', 'user10@example.com', '+10000000010');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (11, 'user11', 'pass11@2025', 'Luis', 'de la Fuente', 'Manager', 'user11@example.com', '+10000000011');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (12, 'user12', 'pass12@2025', 'Julian', 'Nagelsmann', 'Manager', 'user12@example.com', '+10000000012');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (13, 'user13', 'pass13@2025', 'Ronald', 'Koeman', 'Manager', 'user13@example.com', '+10000000013');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (14, 'user14', 'pass14@2025', 'Mauro', 'Biello', 'Manager', 'user14@example.com', '+10000000014');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (15, 'user15', 'pass15@2025', 'Walid', 'Regragui', 'Manager', 'user15@example.com', '+10000000015');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (16, 'user16', 'pass16@2025', 'Luciano', 'Spalletti', 'Manager', 'user16@example.com', '+10000000016');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (17, 'user17', 'pass17@2025', 'Gregg', 'Berhalter', 'Manager', 'user17@example.com', '+10000000017');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (18, 'user18', 'pass18@2025', 'Marcelo', 'Bielsa', 'Manager', 'user18@example.com', '+10000000018');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (19, 'user19', 'pass19@2025', 'Janne', 'Andersson', 'Manager', 'user19@example.com', '+10000000019');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (20, 'user20', 'pass20@2025', 'Thibaut', 'Petit', 'Manager', 'user20@example.com', '+10000000020');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (21, 'user21', 'pass21@2025', 'Jean', 'Martin', 'Manager', 'user21@example.com', '+10000000021');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (22, 'user22', 'pass22@2025', 'Jürgen', 'Klinsmann', 'Manager', 'user22@example.com', '+10000000022');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (23, 'user23', 'pass23@2025', 'Kasper', 'Hjulmand', 'Manager', 'user23@example.com', '+10000000023');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (24, 'user24', 'pass24@2025', 'Dragan', 'Stojković', 'Manager', 'user24@example.com', '+10000000024');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (25, 'user25', 'pass25@2025', 'Jaime', 'Lozano', 'Manager', 'user25@example.com', '+10000000025');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (26, 'user26', 'pass26@2025', 'Luis', 'Fernando', 'Manager', 'user26@example.com', '+10000000026');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (27, 'user27', 'pass27@2025', 'Hajime', 'Moriyasu', 'Manager', 'user27@example.com', '+10000000027');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (28, 'user28', 'pass28@2025', 'Amir', 'Ghalenoei', 'Manager', 'user28@example.com', '+10000000028');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (29, 'user29', 'pass29@2025', 'Markku', 'Kanerva', 'Manager', 'user29@example.com', '+10000000029');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (30, 'user30', 'pass30@2025', 'Matjaž', 'Kek', 'Manager', 'user30@example.com', '+10000000030');
INSERT INTO Users (UserID, UserName, UserPassword, UserFirstName, UserLastName, UserRole, Email, Mobile)
VALUES (31, 'user31', 'pass31@2025', 'Sylvinho', 'Barbosa', 'Manager', 'user31@example.com', '+10000000031');

select * from Users;

UPDATE TeamInfo SET ManagerID = 1 WHERE TeamID = 1;   -- Roberto Martínez (Portugal FC)
UPDATE TeamInfo SET ManagerID = 2 WHERE TeamID = 2;   -- Lionel Scaloni (Argentina FC)
UPDATE TeamInfo SET ManagerID = 3 WHERE TeamID = 3;   -- Dorival Júnior (Brazil FC)
UPDATE TeamInfo SET ManagerID = 4 WHERE TeamID = 4;   -- Didier Deschamps (France FC)
UPDATE TeamInfo SET ManagerID = 5 WHERE TeamID = 5;   -- Michał Probierz (Poland FC)
UPDATE TeamInfo SET ManagerID = 6 WHERE TeamID = 6;   -- Gareth Southgate (England FC)
UPDATE TeamInfo SET ManagerID = 7 WHERE TeamID = 7;   -- Ståle Solbakken (Norway FC)
UPDATE TeamInfo SET ManagerID = 8 WHERE TeamID = 8;   -- Rui Vitória (Egypt FC)
UPDATE TeamInfo SET ManagerID = 9 WHERE TeamID = 9;   -- Domenico Tedesco (Belgium FC)
UPDATE TeamInfo SET ManagerID = 10 WHERE TeamID = 10; -- Zlatko Dalić (Croatia FC)
UPDATE TeamInfo SET ManagerID = 11 WHERE TeamID = 11; -- Luis de la Fuente (Spain FC)
UPDATE TeamInfo SET ManagerID = 12 WHERE TeamID = 12; -- Julian Nagelsmann (Germany FC)
UPDATE TeamInfo SET ManagerID = 13 WHERE TeamID = 13; -- Ronald Koeman (Netherlands FC)
UPDATE TeamInfo SET ManagerID = 14 WHERE TeamID = 14; -- Mauro Biello (Canada FC)
UPDATE TeamInfo SET ManagerID = 15 WHERE TeamID = 15; -- Walid Regragui (Morocco FC)
UPDATE TeamInfo SET ManagerID = 16 WHERE TeamID = 16; -- Luciano Spalletti (Italy FC)
UPDATE TeamInfo SET ManagerID = 17 WHERE TeamID = 17; -- Gregg Berhalter (USA FC)
UPDATE TeamInfo SET ManagerID = 18 WHERE TeamID = 18; -- Marcelo Bielsa (Uruguay FC)
UPDATE TeamInfo SET ManagerID = 19 WHERE TeamID = 19; -- Janne Andersson (Sweden FC)
UPDATE TeamInfo SET ManagerID = 20 WHERE TeamID = 20; -- Thibaut Petit (Belgium B FC)
UPDATE TeamInfo SET ManagerID = 21 WHERE TeamID = 21; -- Jean Martin (France B FC)
UPDATE TeamInfo SET ManagerID = 22 WHERE TeamID = 22; -- Jürgen Klinsmann (South Korea FC)
UPDATE TeamInfo SET ManagerID = 23 WHERE TeamID = 23; -- Kasper Hjulmand (Denmark FC)
UPDATE TeamInfo SET ManagerID = 24 WHERE TeamID = 24; -- Dragan Stojković (Serbia FC)
UPDATE TeamInfo SET ManagerID = 25 WHERE TeamID = 25; -- Jaime Lozano (Mexico FC)
UPDATE TeamInfo SET ManagerID = 26 WHERE TeamID = 26; -- Luis Fernando (Costa Rica FC)
UPDATE TeamInfo SET ManagerID = 27 WHERE TeamID = 27; -- Hajime Moriyasu (Japan FC)
UPDATE TeamInfo SET ManagerID = 28 WHERE TeamID = 28; -- Amir Ghalenoei (Iran FC)
UPDATE TeamInfo SET ManagerID = 29 WHERE TeamID = 29; -- Markku Kanerva (Finland FC)
UPDATE TeamInfo SET ManagerID = 30 WHERE TeamID = 30; -- Matjaž Kek (Slovenia FC)
UPDATE TeamInfo SET ManagerID = 31 WHERE TeamID = 31; -- Sylvinho Barbosa (Albania FC)

select * from TeamInfo;

INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (1, 1, 1);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (2, 2, 2);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (3, 3, 3);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (4, 4, 4);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (5, 5, 5);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (6, 6, 6);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (7, 7, 7);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (8, 8, 8);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (9, 9, 9);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (10, 10, 10);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (11, 11, 11);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (12, 12, 12);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (13, 13, 13);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (14, 14, 14);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (15, 15, 15);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (16, 16, 16);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (17, 17, 17);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (18, 18, 18);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (19, 19, 19);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (20, 20, 20);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (21, 21, 21);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (22, 1, 22);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (23, 2, 23);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (24, 3, 24);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (25, 4, 25);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (26, 5, 26);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (27, 6, 27);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (28, 7, 28);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (29, 8, 29);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (30, 9, 30);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (31, 10, 31);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (32, 11, 32);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (33, 12, 33);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (34, 13, 34);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (35, 14, 35);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (36, 15, 36);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (37, 16, 37);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (38, 17, 38);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (39, 18, 39);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (40, 19, 40);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (41, 20, 41);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (42, 21, 42);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (43, 1, 43);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (44, 2, 44);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (45, 3, 45);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (46, 4, 46);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (47, 5, 47);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (48, 6, 48);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (49, 7, 49);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (50, 8, 50);

-- New players (PlayerID 51–60) → TeamID 22–31
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (51, 22, 51);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (52, 23, 52);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (53, 24, 53);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (54, 25, 54);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (55, 26, 55);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (56, 27, 56);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (57, 28, 57);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (58, 29, 58);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (59, 30, 59);
INSERT INTO TeamPlayers (ID, TeamID, PlayerID) VALUES (60, 31, 60);

select * from TeamPlayers;