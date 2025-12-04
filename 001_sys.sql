----------------------------------
-- 1. Create user, add grants   --
----------------------------------
DECLARE
  CURSOR cur IS
    SELECT 'alter system kill session ''' || sid || ',' || serial# || '''' AS command
      FROM v$session
     WHERE username = 'CITYSCAPE_MANAGER';
BEGIN
  FOR c IN cur
  LOOP
    EXECUTE IMMEDIATE c.command;
  END LOOP;
END;
/
DECLARE
  l_cnt NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO l_cnt
    FROM dba_users t
   WHERE t.username = 'CITYSCAPE_MANAGER';
  IF l_cnt = 1
  THEN
    EXECUTE IMMEDIATE 'DROP USER cityscape_manager CASCADE';
  END IF;
END;
/

CREATE USER cityscape_manager identified BY 12345678 DEFAULT tablespace users quota unlimited ON users;

grant CREATE session TO cityscape_manager;
grant CREATE TABLE TO cityscape_manager;
grant CREATE view TO cityscape_manager;
grant CREATE sequence TO cityscape_manager;
grant CREATE PROCEDURE TO cityscape_manager;
grant CREATE TYPE TO cityscape_manager;
grant CREATE job TO cityscape_manager;

ALTER session SET current_schema = cityscape_manager;
