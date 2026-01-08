CREATE OR REPLACE TRIGGER trg_completed_adventure_delete
  BEFORE INSERT ON completed_adventure
  FOR EACH ROW
BEGIN
  DELETE FROM abandoned_adventure
   WHERE user_id = :new.user_id
     AND adventure_id = :new.adventure_id;

END;
/
