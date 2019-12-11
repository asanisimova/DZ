SELECT 'ФИО: Анисимова Анна';

CREATE TABLE films (
    id integer NOT NULL,
    title text,
    country text,
    box_office integer,
    release_date date
);

CREATE TABLE persons (
    id integer NOT NULL,
    fio text
);


CREATE TABLE persons2content (
    person_id integer,
    film_id integer,
    person_type text
);


insert into films values (1,'Avengers: Endgame','USA, UK, Canada',47450130,'2019-04-29'),
(2,'Fast & Furious Presents: Hobbs & Shaw','USA',18775269,'2019-08-01'),
(3,'The Lion King','USA',4933957,'2019-07-18'),
(4,'Gisaengchung', 'South Korea',1328181,'2019-07-04'),
(5,'Spider-Man: Far from Home','USA',21444241,'2019-07-04');

insert into persons values (101, 'Anthony Russo'),
(102,'Chris Evans'),
(103,'David Litch'),
(104,'Dwayne Johnson'),
(105,'John Favreau'),
(106,'Donald Glover'),
(107,'Pong joon-ho'),
(108,'Song Kang Ho'),
(109,'Tom Holland'),
(110,'Zendia');


insert into persons2content values (101,1,'stage director'),
(102,1,'actor'),
(103,2,'stage director'),
(104,2,'actor'),
(105,3,'stage director'),
(106,3,'actor'),
(107,4,'stage director'),
(108,4,'actor'),
(109,5,'actor'),
(110,5,'actor');

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


ALTER TABLE ONLY persons2content
    ADD CONSTRAINT persons2content_film_id_fkey FOREIGN KEY (film_id) REFERENCES films(id);


ALTER TABLE ONLY persons2content
    ADD CONSTRAINT persons2content_person_id_fkey FOREIGN KEY (person_id) REFERENCES persons(id);



