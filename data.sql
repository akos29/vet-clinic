-* Populate database with sample data. *-

INSERT INTO animals (name,date_of_birth,escape_attempts, neutered, weight_kg) VALUES 
('Agumon','2020-02-03',0,true,10.23),
('Gabumon','2018-11-15',2,true,8), 
('Pikachu','2021-01-07',1,false,15.04), 
('Devimon','2017-05-12',5,true,11);


INSERT INTO animals (name,date_of_birth,escape_attempts, neutered, weight_kg) VALUES 
('Charmander','2020-02-08',0,false,-11),
('Plantmon','2018-10-15',2,true,-5.7), 
('Squirtle','1993-04-02',3,false,-12.13), 
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-7',7,true,-20.4),
('Blossom','1998-10-13',3,true,-17),
('Ditto','2022-05-14',4,true,-22);



INSERT INTO owners (full_name,age) VALUES 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

INSERT INTO species (name) VALUES 
('Pokemon'),
('Digimon');


INSERT INTO vets (name,age, date_of_graduation) VALUES 
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-4'),
('Jack Harkness',45,'2008-06-08');

INSERT INTO specializations (vets_id,sid) VALUES 
((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));
-- (3,1),
-- (3,2),
-- (4,2);

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vet_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

UPDATE animals SET species_id=1 WHERE name LIKE '%mon';
SELECT name, species_id FROM animals;
UPDATE animals SET species_id=1 WHERE species_id IS NULL;
SELECT name, species_id FROM animals;


UPDATE animals SET owner_id=1 WHERE name LIKE 'Agumon';
SELECT name, owner_id FROM animals;
UPDATE animals SET owner_id=2 WHERE name LIKE 'Gabumon';
UPDATE animals SET owner_id=2 WHERE name LIKE 'Pikachu';
SELECT name, owner_id FROM animals;
UPDATE animals SET owner_id=3 WHERE name LIKE 'Devimon';
UPDATE animals SET owner_id=3 WHERE name LIKE 'Plantmon';
SELECT name, owner_id FROM animals;
UPDATE animals SET owner_id=4 WHERE name LIKE 'Charmander';
UPDATE animals SET owner_id=4 WHERE name LIKE 'Squirtle';
UPDATE animals SET owner_id=4 WHERE name LIKE 'Blossom';
SELECT name, owner_id FROM animals;
UPDATE animals SET owner_id=5 WHERE name LIKE 'Angemon';
UPDATE animals SET owner_id=5 WHERE name LIKE 'Boarmon';
SELECT name, owner_id FROM animals;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

