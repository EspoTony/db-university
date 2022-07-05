-- creo database
create DATABASE university;

-- usiamo il databse creato
use university;

-- creazione tabelle
create table dipartimento (
 id INT NOT NULL AUTO_INCREMENT,
 nome VARCHAR(30) NOT NULL,
 indirizzo VARCHAR (30),
 direttore VARCHAR (30),
 numero_massimo_iscritti BIGINT  NOT NULL,
 PRIMARY KEY (id)
);
create table studenti (
 matricola BIGINT NOT NULL,
 nome VARCHAR(50) NOT NULL,
 cognome VARCHAR (50),
 id_corsi_laurea INT,
 PRIMARY KEY (matricola)
);
create table insegnanti (
 matricola BIGINT NOT NULL,
 nome VARCHAR(50) NOT NULL,
 cognome VARCHAR (50),
 matricola_insegnanti BIGINT NOT NULL,
 PRIMARY KEY (matricola)
);
create table corsi (
 id INT NOT NULL,
 nome_corso VARCHAR(50) NOT NULL,
 crediti INT NOT NULL,
 ore_totali INT NOT NULL,
 PRIMARY KEY (id)
);
create table corsi_laurea (
 id INT NOT NULL,
 nome_corsi VARCHAR(50) NOT NULL,
 crediti INT NOT NULL,
 id_dipartimento INT,
 numero_iscritti BIGINT  NOT NULL,
 PRIMARY KEY (id)
);


CREATE TABLE cdl_corsi (
id_cdl INT NOT NULL,
id_corsi INT NOT NULL,
FOREIGN KEY(id_cdl) REFERENCES corsi_laurea(id),
FOREIGN KEY(id_corsi) REFERENCES corsi(id)
);
CREATE TABLE cdl_insegnanti (
id_cdl INT NOT NULL,
id_insegnanti BIGINT NOT NULL,
FOREIGN KEY(id_cdl) REFERENCES corsi_laurea(id),
FOREIGN KEY(id_insegnanti) REFERENCES insegnantii(matricola)
);
ALTER TABLE studenti ADD FOREIGN KEY(id_corsi_laurea) REFERENCES corsi_laurea(id);
ALTER TABLE corsi_laurea  ADD FOREIGN KEY(id_dipartimento) REFERENCES dipartimento(id);
-- Inserisco dati nel dipartimento
INSERT INTO university.dipartimento
(nome, indirizzo, direttore, numero_massimo_iscritti)
VALUES('Dipartimento delle bustine', 'Casa di stefano', 'Stefanus', 20);
INSERT INTO university.corsi_laurea
(id, nome_corsi, crediti, id_dipartimento, numero_iscritti)
VALUES(4791, 'Corso dei piedi', 12, 10, 20);


