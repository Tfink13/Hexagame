-- Tyler Fink
-- 1/29/19
-- Making a database for a card came. The game has hero cards, creature cards
-- and spell cards. Only some heros are able to use caertain creature and spell cards.
-- There are also nuetral cards that may be used with all the heros.
-- How the game starts is a player selects there hero and are able to choose 10
-- cards to draw to their hand, not randomly.
-----------------------------------------------------------------------------------


CREATE TABLE users (
  id bigserial,
  hero_id integer,
  username varchar(25),
  first_name varchar(20),
  last_name varchar(20),
  time_played time,
  sign_up_date date,
  CONSTRAINT hero_id_key PRIMARY KEY (hero_id, username)
)

INSERT INTO users (hero_id, username, first_name, last_name, time_played, sign_up_date)
VALUES ('1', 'Tfink', 'Tyler', 'Fink', '02:32:43', '2019-1-2')
INSERT INTO users (hero_id, username, first_name, last_name, start_mana, time_played, sign_up_date)
VALUES ('1', 'Finky', 'Tyler', 'Fink', '04:30:12', '2019-14-1')
INSERT INTO users (hero_id, username, first_name, last_name, start_mana, time_played, sign_up_date)
VALUES ('2', 'MCO', 'Zach', 'Reitzle', '02:12:54', '2019-1-2')
INSERT INTO users (hero_id, username, first_name, last_name, start_mana, time_played, sign_up_date)
VALUES ('3', 'JF', 'Jimmy', 'Fallon', '08:38:32', '2017-3-3')
INSERT INTO users (hero_id, username, first_name, last_name, start_mana, time_played, sign_up_date)
VALUES ('4', 'CapnSaylor', 'Cag', 'Saylor', '12:13:24', '2019-1-2')
INSERT INTO users (hero_id, username, first_name, last_name, start_mana, time_played, sign_up_date)
VALUES ('5', 'jsfink', 'Jason', 'Fink', '04:30:12', '2019-2-1')
INSERT INTO users (hero_id, username, first_name, last_name, time_played, sign_up_date)
VALUES ('5', 'jsfink', 'Jason', 'Fink', '04:30:12', '2019-4-1')


CREATE TABLE heros (
  name varchar(25),
  card_type varchar(20),
  affiliation varchar(20),
  mana_cost integer,
  attack integer,
  defense integer,
  abililty_one varchar(20),
  abililty_two varchar(20),
  ability_three varchar(20),
  effect varchar(150),
  hero_id interger REFERENCES users (hero_id_key) ON DELETE CASCADE,
  CONSTRAINT check_hero_id CHECK (hero_id >= 5)
  CONSTRAINT affiliation_key PRIMARY KEY (affiliation)
)

CREATE TABLE creature_cards (
  card_id bigserial,
  name varchar(25),
  card_type varchar(20),
  affiliation varchar(20) REFERENCES heros (affiliation_key),
  mana_cost integer,
  attack integer,
  defense integer,
  abililty_one varchar(20),
  abililty_two varchar(20),
  ability_three varchar(20),
  effect varchar(150),
)

CREATE TABLE spell_cards (
  card_id bigserial,
  name varchar(25),
  card_type varchar(20),
  affiliation varchar(20) REFERENCES heros (affiliation_key),
  mana_cost integer,
  attack integer,
  defense integer,
  abililty_one varchar(20),
  abililty_two varchar(20),
  ability_three varchar(20),
  effect varchar(150),
)

CREATE TABLE nuetral_cards (
  card_id bigserial,
  name varchar(20),
  card_type varchar(20),
)
