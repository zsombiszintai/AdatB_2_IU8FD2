-- PK GENERÁLÁS TRIGGEREK

CREATE OR REPLACE TRIGGER trg_cityscape_user_id
  BEFORE INSERT ON cityscape_user
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_cityscape_user_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_adventure_id
  BEFORE INSERT ON adventure
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_lista_id
  BEFORE INSERT ON lista
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_lista_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_review_id
  BEFORE INSERT ON review
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_review_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_completed_adventure_id
  BEFORE INSERT ON completed_adventure
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_completed_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_abandoned_adventure_id
  BEFORE INSERT ON abandoned_adventure
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_abandoned_adventure_id.nextval;
  END IF;
END;

/

CREATE OR REPLACE TRIGGER trg_station_id
  BEFORE INSERT ON station
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_station_id.nextval;
  END IF;
END;

/
CREATE OR REPLACE TRIGGER trg_cityscape_user_h_id
  BEFORE INSERT ON cityscape_user_h
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_cityscape_user_h_id.nextval;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_adventure_status_h_id
  BEFORE INSERT ON adventure_status_h
  FOR EACH ROW
BEGIN
  IF :new.id IS NULL
  THEN
    :new.id := seq_adventure_status_h_id.nextval;
  END IF;
END;
