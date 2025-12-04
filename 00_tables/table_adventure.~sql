CREATE TABLE ADVENTURE (
adventure_id NUMBER NOT NULL,
title VARCHAR2(50) NOT NULL,
adventure_description VARCHAR2(500),
difficulty NUMBER(1),
creator_id NUMBER NOT NULL,
status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,
created_at DATE DEFAULT SYSDATE NOT NULL,
total_distance NUMBER(8,2),
average_rating NUMBER(3,2),

-- PK
CONSTRAINT pk_adventure PRIMARY KEY (adventure_id),

-- FK
CONSTRAINT fk_adventure_creator_id FOREIGN KEY (creator_id) REFERENCES cityscape_users(user_id),

-- UNIQUE
CONSTRAINT uq_adventure_title UNIQUE (title),

-- CHECK
CONSTRAINT check_adventure_difficulty CHECK(difficulty BETWEEN 1 AND 3),
CONSTRAINT check_adventure_status CHECK(status IN ('PENDING','REJECTED','PUBLIC'))

);


