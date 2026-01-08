CREATE OR REPLACE TRIGGER trg_user_role_h
  AFTER UPDATE OF user_role ON cityscape_user
  FOR EACH ROW
BEGIN
  INSERT INTO cityscape_user_h
    (id
    ,user_id
    ,old_role
    ,new_role
    ,changed_at
    ,changed_by)
  VALUES
    (NULL
    ,:old.id
    ,:old.user_role
    ,:new.user_role
    ,SYSDATE
    ,NULL);
END;
/
