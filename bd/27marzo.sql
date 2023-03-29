-- CREATE DATABASE NETFLIX;

-- USE NETFLIX;

CREATE TABLE MOVIES(
id INT auto_increment primary key,
title varchar(45) not null,
gender varchar(45) not null,
image varchar(1000) not null,
category varchar(45) not null,
year date);

CREATE TABLE USERS(
idUser INT auto_increment primary key,
user varchar(45) not null,
password varchar(45) not null,
name varchar(45) not null,
email varchar(45) not null,
plan_details varchar(45) not null);

CREATE TABLE ACTORS(
idActor INT  auto_increment primary key,
name varchar(45) not null,
lastname varchar(45) not null,
country varchar(45) not null,
birthday date);

INSERT INTO MOVIES(title, gender, image, category, year)
VALUES ('Pulp Fiction', 'Crimen', 'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg', 'Top 10', '1994-01-01'),
('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg',  'Top 10', '1996-01-01'),
('Forrest Gump', 'Comedia', 'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg', 'Top 10', '1994-01-01');

INSERT INTO USERS(user, password, name, email, plan_details)
VALUES('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard'),
('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard'),
('ester_dev', 'ester', 'Ester', 'ester@gmail.com', 'Standadr');

INSERT INTO ACTORS(name, lastname, country, birthday)
VALUES('Tom', 'Hanks', 'Estados Unidos', '1956-06-09'),
('Roberto', 'Benigni', 'Italia', '1952-10-27'),
('John', 'Travolta', 'Estados Unidos', '1954-02-18');

CREATE TABLE IF NOT EXISTS `rel_movies_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `USERS_idUser` INT NOT NULL,
  `MOVIES_id` INT NOT NULL,
  PRIMARY KEY (`id`, `USERS_idUser`, `MOVIES_id`),
  INDEX `fk_USERS_has_MOVIES_MOVIES1_idx` (`MOVIES_id` ASC) VISIBLE,
  INDEX `fk_USERS_has_MOVIES_USERS1_idx` (`USERS_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_USERS_has_MOVIES_USERS1`
    FOREIGN KEY (`USERS_idUser`)
    REFERENCES `USERS` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USERS_has_MOVIES_MOVIES1`
    FOREIGN KEY (`MOVIES_id`)
    REFERENCES `MOVIES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rel_movie_actors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `MOVIES_id` INT NOT NULL,
  `ACTORS_idActor` INT NOT NULL,
  PRIMARY KEY (`id`, `MOVIES_id`, `ACTORS_idActor`),
  INDEX `fk_ACTORS_has_MOVIES_MOVIES1_idx` (`MOVIES_id` ASC) VISIBLE,
  INDEX `fk_ACTORS_has_MOVIES_ACTORS_idx` (`ACTORS_idActor` ASC) VISIBLE,
  CONSTRAINT `fk_ACTORS_has_MOVIES_ACTORS`
    FOREIGN KEY (`ACTORS_idActor`)
    REFERENCES `ACTORS` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACTORS_has_MOVIES_MOVIES1`
    FOREIGN KEY (`MOVIES_id`)
    REFERENCES `MOVIES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO rel_movies_users(USERS_idUser, MOVIES_id)
VALUES('1', '1.2');

INSERT INTO rel_movies_users(USERS_idUser, MOVIES_id)
VALUES('2', '2');

INSERT INTO rel_movie_actors(MOVIES_id, ACTORS_idActor)
VALUES('1', '3');

INSERT INTO rel_movie_actors(MOVIES_id, ACTORS_idActor)
VALUES ('2', '2');

INSERT INTO rel_movie_actors(MOVIES_id, ACTORS_idActor)
VALUES ('3', '1');