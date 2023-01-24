/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name from animals WHERE date_of_birth >='2016-01-01' AND date_of_birth < '2019-01-01';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name from animals WHERE neutered=true AND escape_attempts<3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals WHERE weight_kg>10.5;

-- Find all animals that are neutered.
SELECT * from animals WHERE neutered=true;

-- Find all animals not named Gabumon.
SELECT * from animals WHERE NOT name='Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * from animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

ALTER TABLE animals ADD species VARCHAR(50);

BEGIN;
UPDATE animals SET species='unspecified';
SELECT name, species FROM animals;
ROLLBACK;
SELECT name, species FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
SELECT name, species FROM animals;
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT name, species FROM animals;
COMMIT;
SELECT name, species FROM animals;

BEGIN;
DELETE FROM animals;
SELECT name, species FROM animals;
ROLLBACK;
SELECT name, species FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SELECT name, date_of_birth FROM animals;
SAVEPOINT saveAfterDelete;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO saveAfterDelete;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;
SELECT name, weight_kg FROM animals;
COMMIT;


-- How many animals are there?
SELECT COUNT(*) as Number_of_Animals FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*)  as Number_of_Animals_Never_Tried_To_Scape FROM animals WHERE escape_attempts=0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) as Average_weight_of_animals FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT COUNT(escape_attempts) AS Animal_escaped_the_most_count, neutered FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

