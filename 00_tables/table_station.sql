CREATE TABLE station (
id NUMBER,
adventure_id NUMBER NOT NULL,
seq_number NUMBER NOT NULL,
latitude NUMBER(9,6),
longitude NUMBER(9,6),
riddle_text VARCHAR2(100),

-- PK
CONSTRAINT pk_station PRIMARY KEY (id),

-- FK
CONSTRAINT fk_station_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id),

-- UNIQUE
CONSTRAINT uq_station_order UNIQUE (adventure_id, seq_number),

-- CHECK
CONSTRAINT check_adventure_seq_number CHECK(seq_number >= 1)

);
