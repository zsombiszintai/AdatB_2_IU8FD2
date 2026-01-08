CREATE OR REPLACE TRIGGER trg_adventure_status_h
AFTER UPDATE OF status ON adventure
FOR EACH ROW
  BEGIN
    INSERT INTO adventure_status_h (
    id,
    adventure_id,
    old_status,
    new_status,
    changed_at,
    changed_by
    )VALUES (
    NULL,
    :OLD.id,
    :OLD.status,
    :NEW.status,
    SYSDATE,
    NULL
    );
    END;
    /
