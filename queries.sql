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


SELECT COUNT(*) as Number_of_Animals FROM animals;

SELECT COUNT(*)  as Number_of_Animals_Never_Tried_To_Scape FROM animals WHERE escape_attempts=0;


SELECT AVG(weight_kg) as Average_weight_of_animals FROM animals;


SELECT COUNT(escape_attempts) AS Animal_escaped_the_most_count, neutered FROM animals GROUP BY neutered;


SELECT MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight, species FROM animals GROUP BY species;


SELECT AVG(escape_attempts) as Average_Escape_Attempt, species FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-12-31' GROUP BY species;

SELECT name as Animals_of_Melody_Pond 
FROM animals a
  JOIN owners o ON o.id=a.owner_id
WHERE o.full_name='Melody Pond';

SELECT a.name as Pokemon_Animals
FROM animals a
  JOIN species s ON s.id=a.species_id
WHERE s.name='Pokemon';

SELECT full_name, name
FROM owners o
  LEFT JOIN animals a ON a.owner_id=o.id;

SELECT COUNT(*),s.name
FROM species s
  JOIN animals a ON a.species_id=s.id
  GROUP BY s.name; 

SELECT a.name as Animals_of_Jennifer_Orwell 
FROM animals a
  JOIN owners o ON o.id=a.owner_id
  JOIN species s ON s.id=a.species_id
WHERE o.full_name='Jennifer Orwell' AND s.name='Digimon';

SELECT a.name as Animals_of_Dean_Winchester_Never_tried_to_escape
FROM animals a
  JOIN owners o ON o.id=a.owner_id
WHERE o.full_name='Dean Winchester' AND a.escape_attempts=0;

SELECT o.full_name,COUNT(*) AS C
FROM animals a
  JOIN owners o ON o.id=a.owner_id
GROUP BY o.full_name 
ORDER BY C DESC
LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT a.name, vs.date_of_visits as date
FROM animals a
  JOIN visits vs ON vs.aid=a.id
  JOIN vets v ON v.id=vs.vid
WHERE v.name='William Tatcher'
ORDER BY date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as Animals_Stephanie_see
FROM animals a
  JOIN visits vs ON vs.aid=a.id
  JOIN vets v ON v.id=vs.vid
WHERE v.name='Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT v.name, s.name
FROM vets v
  LEFT JOIN specializations ss ON ss.vid=v.id
  LEFT JOIN species s ON s.id=ss.sid;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

-- What animal has the most visits to vets?
-- Who was Maisy Smith's first visit?
-- Details for most recent visit: animal information, vet information, and date of visit.
-- How many visits were with a vet that did not specialize in that animal's species?
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.