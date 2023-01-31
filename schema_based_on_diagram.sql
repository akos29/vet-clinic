CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL
);
  
CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at timestamp,
  patient_id INT REFERENCES patients(id) ON DELETE CASCADE,
  status VARCHAR(100) NOT NULL
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price decimal,
  quantity INT,
  total_price decimal,
  invoice_id INT REFERENCES invoices(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE treatment_history (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id),
  CONSTRAINT fk_treatment_history
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
    FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);



CREATE INDEX medical_history_id_asc ON medical_histories(id ASC);
CREATE INDEX patient_id_asc ON patients(id ASC);
CREATE INDEX treatments_id_asc ON treatments(id ASC);
CREATE INDEX invoice_items_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_history_id_asc ON treatment_history(treatment_id ASC);