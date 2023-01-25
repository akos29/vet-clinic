/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL );

  ALTER TABLE animals ADD species VARCHAR(50);

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  age INT );

CREATE TABLE species ( 
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL );

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT,
  date_of_graduation DATE );

CREATE TABLE specializations (
  sid INT REFERENCES species(id),
  vid INT REFERENCES vets(id) );

CREATE TABLE visits (
  aid INT REFERENCES animals(id),
  vid INT REFERENCES vets(id) );

  ALTER TABLE animals 
  ADD CONSTRAINT animalsPrimaryKey PRIMARY KEY (id);

  ALTER TABLE animals DROP COLUMN species;

  ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
  ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

  ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);