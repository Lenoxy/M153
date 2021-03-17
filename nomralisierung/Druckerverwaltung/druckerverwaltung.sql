BEGIN;
create table Location(
	id SERIAL PRIMARY KEY,
	LocationName VARCHAR NOT NULL
);

CREATE TABLE PrinterModel(
	id SERIAL PRIMARY KEY,
	ModelName VARCHAR NOT NULL
);

CREATE TABLE Person(
	id SERIAL PRIMARY KEY,
	Firstname VARCHAR NOT NULL,
	Lastname VARCHAR NOT NULL,
	Phonenumber VARCHAR
);
COMMIT;

BEGIN;
CREATE TABLE PrinterUnit(
	SerialNumber VARCHAR PRIMARY KEY,
	PrinterName VARCHAR NOT NULL,
	DateBought DATE,
	fk_location_id int,
	fk_PrinterModel_id int,
	fk_person_id int,
	CONSTRAINT fk_location
      	  FOREIGN KEY(fk_location_id) 
	    REFERENCES Location(id),
	CONSTRAINT fk_PrinterModel
          FOREIGN KEY(fk_PrinterModel_id) 
	    REFERENCES PrinterModel(id),
	CONSTRAINT fk_person
          FOREIGN KEY(fk_person_id) 
	    REFERENCES Person(id)
);
COMMIT;
