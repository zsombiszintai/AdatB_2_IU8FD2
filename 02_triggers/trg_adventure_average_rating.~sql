CREATE OR REPLACE TRIGGER trg_adventure_average_rating
  AFTER INSERT OR UPDATE OR DELETE ON review
  FOR EACH ROW
DECLARE
  v_adventure_id adventure.adventure_id%TYPE;
BEGIN
  IF inserting
     OR updating
  THEN
    v_adventure_id := :new.adventure_id;
  ELSIF deleting
  THEN
    v_adventure_id := :old.adventure_id;
  END IF;

  UPDATE adventure a
     SET average_rating =
         (SELECT round(nvl(AVG(r.rating), 0), 2)
            FROM review r
           WHERE r.adventure_id = v_adventure_id)
   WHERE a.adventure_id = v_adventure_id;
END;

/
        
