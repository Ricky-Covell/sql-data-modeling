-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


            -- TABLES

CREATE TABLE regions
(
     id SERIAL PRIMARY KEY,
     name TEXT NOT NULL
);


CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    preffered_region_id INTEGER REFERENCES regions
);


CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,  
    name TEXT NOT NULL
);


CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,  
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users,
    region_id INTEGER NOT NULL REFERENCES regions,     
    category_id INTEGER NOT NULL REFERENCES categories
);




            -- VALUES

INSERT INTO regions
    (name)
VALUES
('Atlanta'),
('New York'),
('Miami');


INSERT INTO users
    (username, password, preffered_region_id)
VALUES
('John', 'John123', 1),
('Keith', 'Keith123', 2),
('Joe', 'Keith123', 3);


INSERT INTO categories
    (name)
VALUES
('Home'),
('Instruments'),
('Free');


INSERT INTO posts
    (title, body, user_id, region_id, category_id)
VALUES
('Couch 200$', 'Buy my couch.', 1, 1, 1),
('Guitar 500$', 'Buy my guitar.', 2, 2, 2),
('Free Washing Machine', 'Take my washing machine', 3, 3, 3);







--          DESIGN
-- REGIONS:
--      id SERIAL PRIMARY KEY,
--      name TEXT NOT NULL
--      
-- USERS:
--      id SERIAL PRIMARY KEY,  
--      username VARCHAR(15) UNIQUE NOT NULL,
--      password VARCHAR(15) NOT NULL,
--      preffered_region_id INTEGER REFERENCES regions
-- 
-- CATEGORIES:
--      id SERIAL PRIMARY KEY,  
--      name TEXT NOT NULL
-- 
-- POSTS:
--      id SERIAL PRIMARY KEY,
--      title TEXT NOT NULL,
--      body TEXT NOT NULL,
--      user_id INTEGER NOT NULL REFERENCES users,
--      region_id INTEGER NOT NULL REFERENCES regions,     
--      category_id INTEGER NOT NULL REFERENCES categories
-- 
--     
-- 
-- 
-- 