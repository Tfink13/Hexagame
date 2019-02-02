-- Tyler Fink
-- 1/29/19
-- Making a database for a card came. The game has hero cards, creature cards
-- and spell cards. Only some heros are able to use caertain creature and spell cards.
-- There are also nuetral cards that may be used with all the heros.
-- How the game starts is a player selects there hero and are able to choose 10
-- cards to draw to their hand, not randomly.
-----------------------------------------------------------------------------------


CREATE TABLE users (
  user_id bigserial,
  hero_id integer,
  first_name varchar(20),
  last_name(20),
  start_mana integer,
  time_played time,
  create_date TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NOW(),
  CONSTRAINT hero_id_key PRIMARY KEY (hero_id)
)


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
