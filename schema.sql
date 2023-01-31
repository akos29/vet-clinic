/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species_id INT,
  owner_id INT,
  CONSTRAINT fk_animals
    FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
    FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE
  );

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(120),
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
  vets_id INT REFERENCES vets(id),
  PRIMARY KEY (sid, vets_id),
  CONSTRAINT fk_specializations
    FOREIGN KEY(sid) REFERENCES species(id) ON DELETE CASCADE,
    FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

-- CREATE TABLE visits (
--   animal_id INT,
--   vets_id INT, 
--   date_of_visits DATE NOT NULL,
--   PRIMARY KEY (animal_id, vets_id,date_of_visits),
--   CONSTRAINT fk_visit
--     FOREIGN KEY(animal_id) REFERENCES animals(id) ON DELETE CASCADE ,
--     FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE  );

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
   CONSTRAINT fk_visits
    FOREIGN KEY(animal_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY(vet_id) REFERENCES vets(id) ON DELETE CASCADE
);

-- ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Adding Indexes for existing tables 

CREATE INDEX vet_id_asc ON vets(id ASC);
CREATE INDEX animals_id_asc ON animals(id ASC);
CREATE INDEX email_asc ON owners(email ASC);
