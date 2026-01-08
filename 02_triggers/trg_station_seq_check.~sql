CREATE OR REPLACE TRIGGER trg_station_seq_check
  BEFORE INSERT ON station
  FOR EACH ROW
DECLARE
  v_seq_max NUMBER;
BEGIN
  SELECT nvl(MAX(seq_number), 0)
    INTO v_seq_max
    FROM station
   WHERE adventure_id = :new.adventure_id;

  IF :new.seq_number <> v_seq_max + 1
  THEN
    :new.seq_number := v_seq_max + 1;
  END IF;
END;
/
