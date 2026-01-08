CREATE TABLE completed_adventure (
id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
completed_at DATE DEFAULT SYSDATE NOT NULL,
distance_travelled NUMBER(8,2),
duration_min NUMBER(10,2),

-- PK
CONSTRAINT pk_completed_adventure PRIMARY KEY (id),

-- FK
CONSTRAINT fk_completed_adventure_user_id FOREIGN KEY (user_id) REFERENCES cityscape_users(id),
CONSTRAINT fk_completed_adventure_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id)

);
