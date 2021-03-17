BEGIN;
	CREATE TABLE Klasse(
		Klasse varchar(10) PRIMARY KEY NOT NULL,
		Klassenlehrer varchar(40) NOT NULL
	);
	
	CREATE TABLE Lernangebot(
		LernangebotNr SERIAL PRIMARY KEY NOT NULL,
		Beschreibung varchar(400)
	);
	
	CREATE TABLE Schüler(
		SchülerNr SERIAL PRIMARY KEY,
		Vorname varchar(40) NOT NULL,
		Nachname varchar(40) NOT NULL,
		Klasse varchar(10) NOT NULL,
		CONSTRAINT fk_klasse
			FOREIGN KEY(Klasse)
				REFERENCES Klasse(Klasse)
	);
	
	CREATE TABLE Lernangebotsübersicht(
		SchülerNr int NOT NULL,
		LernangebotNr int NOT NULL,
		Zeit_in_h int NOT NULL,
		PRIMARY KEY(SchülerNr, LernangebotNr),
		CONSTRAINT fk_schuelerNr
			FOREIGN KEY(SchülerNr)
				REFERENCES Schüler(SchülerNr),	
		CONSTRAINT fk_lernangebotNr
			FOREIGN KEY(LernangebotNr)
				REFERENCES Lernangebot(LernangebotNr)
	)

	

COMMIT;

BEGIN;

	INSERT INTO Klasse
	VALUES
		('11a', 'Lempel'),
		('12a', 'Breier'),
		('11b', 'Sommer');
		
	INSERT INTO Lernangebot
	VALUES
		(2, 'Tanz'),
		(3, 'Chor'),
		(1, 'Elektronik');
		
	INSERT INTO Schüler
	VALUES
		(1, 'Ina', 'Jürgens', '11a'),
		(2, 'Tom', 'Schmidt', '12a'),
		(3, 'Franz', 'Jäger', '11a'),
		(4, 'Ina', 'Olsen', '11b'),
		(5, 'Paula', 'Jürgens', '12a')
		
	INSERT INTO Lernangebotsübersicht
	VALUES
		(1, 2, 12),
		(2, 3, 22),
		(3, 1, 15),
		(3, 2, 12),
		(3, 3, 2),
		(4, 2, 5),
		(5, 1, 23)



COMMIT;

