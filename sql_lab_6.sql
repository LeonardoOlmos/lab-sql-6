-- Leonardo Olmos Saucedo / Lab SQL 6

USE sakila;

-- Drop table if exists
drop table if exists films_2020;

-- Creating table to use
CREATE TABLE `films_2020` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned DEFAULT NULL,
  `rental_duration` int NULL,
  `rental_rate` decimal(4,2) NULL,
  `length` smallint unsigned NULL,
  `replacement_cost` decimal(5,2) NULL,
  `rating` VARCHAR(20),
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;


-- Loading CSV file, for windows was necessary to add a new flag into advanced configuration connection
LOAD DATA LOCAL INFILE 'C:/Users/leo_k/Documents/Ironhack/week_4/lab-sql-6/files_for_lab/films_2020.csv'
INTO TABLE films_2020
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ignore 1 rows;

-- Checking info
select COUNT(*) from films_2020;

-- Updating info
UPDATE sakila.films_2020
SET rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;

-- Checking info
select * from films_2020;