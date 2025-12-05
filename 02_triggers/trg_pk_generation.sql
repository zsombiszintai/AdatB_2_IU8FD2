-- PK GENERÁLÁS TRIGGEREK

CREATE OR REPLACE TRIGGER trg_cityscape_users_id
  BEFORE INSERT ON cityscape_users
  FOR EACH ROW
BEGIN
  IF :new.user_id IS NULL
  THEN
    :new.user_id := seq_cityscape_users_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_adventure_id
  BEFORE INSERT ON adventure
  FOR EACH ROW
BEGIN
  IF :new.adventure_id IS NULL
  THEN
    :new.adventure_id := seq_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_lista_id
  BEFORE INSERT ON lista
  FOR EACH ROW
BEGIN
  IF :new.lista_id IS NULL
  THEN
    :new.lista_id := seq_lista_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_review_id
  BEFORE INSERT ON review
  FOR EACH ROW
BEGIN
  IF :new.review_id IS NULL
  THEN
    :new.review_id := seq_review_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_completed_adventure_id
  BEFORE INSERT ON completed_adventure
  FOR EACH ROW
BEGIN
  IF :new.completed_adventure_id IS NULL
  THEN
    :new.completed_adventure_id := seq_completed_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_abandoned_adventure_id
  BEFORE INSERT ON abandoned_adventure
  FOR EACH ROW
BEGIN
  IF :new.abandoned_adventure_id IS NULL
  THEN
    :new.abandoned_adventure_id := seq_abandoned_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_station_id
  BEFORE INSERT ON station
  FOR EACH ROW
BEGIN
  IF :new.station_id IS NULL
  THEN
    :new.station_id := seq_station_id.nextval;
  END IF;
END;
