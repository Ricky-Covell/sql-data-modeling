-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


                -- TABLES


CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL  
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER NOT NULL REFERENCES teams,
    team_2_id INTEGER NOT NULL REFERENCES teams,
    location TEXT NOT NULL,
    season_id INTEGER NOT NULL REFERENCES seasons
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    match_id INTEGER NOT NULL REFERENCES games
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams,
    match_id INTEGER NOT NULL REFERENCES games,
    result TEXT NOT NULL
);


                -- VALUES


INSERT INTO teams
    (name, city)
VALUES
('Feet', 'Atlanta'),
('Legs', 'Boston');

INSERT INTO players
    (name, team_id)
VALUES
('Footman', 1),
('Big Toe', 1),
('Speedrun', 2),
('Knee Boss', 2);

INSERT INTO referees
    (name)
VALUES
('Stopman');

INSERT INTO seasons
    (start_date, end_date)
VALUES
('09-01-2001', '12-31-2001');    

INSERT INTO games
    (team_1_id, team_2_id, location, season_id)
VALUES
(1, 2, 'The Murderdome', 1);    

INSERT INTO goals
    (player_id, match_id)
VALUES
(3, 1),
(4, 1),
(1, 1);    

INSERT INTO results
    (team_id, match_id, result)
VALUES
(2, 1, 'WIN'),
(1, 1, 'LOSE');    





--          DESIGN
-- TEAMS:
--      id SERIAL PRIMARY KEY,
--      name TEXT NOT NULL,
--      city TEXT NOT NULL
-- 
-- PLAYERS:
--      id SERIAL PRIMARY KEY,
--      name TEXT NOT NULL,
--      team_id INTEGER NOT NULL REFERENCES teams
-- 
-- REFEREES:
--      id SERIAL PRIMARY KEY,
--      name TEXT NOT NULL,
-- 
-- SEASONS:
--      id SERIAL PRIMARY KEY,
--      start_date DATE NOT NULL,
--      end_date DATE NOT NULL 
-- 
-- GAMES:
--      id SERIAL PRIMARY KEY,
--      team_1_id INTEGER NOT NULL REFERENCES teams,
--      team_2_id INTEGER NOT NULL REFERENCES teams,
--      location TEXT NOT NULL,
--      season_id INTEGER NOT NULL REFERENCES season,
--      
-- GOALS:
--      id SERIAL PRIMARY KEY,
--      player_id INTEGER NOT NULL REFERENCES players,
--      match_id INTEGER NOT NULL REFERENCES matches
-- 
-- RESULTS:
--      id SERIAL PRIMARY KEY,
--      team_id INTEGER NOT NULL REFERENCES teams,
--      match_id INTEGER NOT NULL REFERENCES matches,
--      result TEXT NOT NULL
