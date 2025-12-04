CREATE TABLE abandoned_adventure (
abandoned_adventure_id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
aborted_at DATE DEFAULT SYSDATE NOT NULL,
last_station_id NUMBER,
distance_travelled NUMBER(8,2),
elapsed_min NUMBER(10,2),

-- PK
CONSTRAINT pk_abandoned_adventure PRIMARY KEY (abandoned_adventure_id),

-- FK
CONSTRAINT fk_abandoned_adventure_user_id FOREIGN KEY (user_id) REFERENCES cityscape_users(user_id),
CONSTRAINT fk_abandoned_adventure_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(adventure_id),
CONSTRAINT fk_abandoned_adventure_last_station_id FOREIGN KEY (last_station_id) REFERENCES station(station_id),

--UNIQUE
CONSTRAINT uq_abandoned_adventure_user_adventure UNIQUE (user_id, adventure_id)

);
