CREATE TABLE cityscape_user (
id NUMBER NOT NULL,
username VARCHAR2(20) NOT NULL,
email VARCHAR2(50) NOT NULL,
password_hash VARCHAR2(30) NOT NULL,
registration_date DATE DEFAULT SYSDATE NOT NULL,
user_role VARCHAR2(10) default 'USER' not null,
profile_description VARCHAR2(100),
profile_picture_url VARCHAR2(400),

-- PK

CONSTRAINT pk_cityscape_user PRIMARY KEY (id),

-- UNIQUE

CONSTRAINT uq_cityscape_user_username UNIQUE (username),
CONSTRAINT uq_cityscape_email UNIQUE (email),

-- CHECK

CONSTRAINT check_cityscape_user_username CHECK(LENGTH(username) BETWEEN 4 AND 20),
CONSTRAINT check_cityscape_user_user_role CHECK(user_role IN ('USER','MODERATOR','ADMIN'))

);
/
CREATE TABLE ADVENTURE (
id NUMBER NOT NULL,
title VARCHAR2(50) NOT NULL,
adventure_description VARCHAR2(500),
difficulty NUMBER(1),
creator_id NUMBER NOT NULL,
status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,
created_at DATE DEFAULT SYSDATE NOT NULL,
total_distance NUMBER(8,2),
average_rating NUMBER(3,2),

-- PK
CONSTRAINT pk_adventure PRIMARY KEY (id),

-- FK
CONSTRAINT fk_adventure_creator_id FOREIGN KEY (creator_id) REFERENCES cityscape_user(id),

-- UNIQUE
CONSTRAINT uq_adventure_title UNIQUE (title),

-- CHECK
CONSTRAINT check_adventure_difficulty CHECK(difficulty BETWEEN 1 AND 3),
CONSTRAINT check_adventure_status CHECK(status IN ('PENDING','REJECTED','PUBLIC'))

);
/
CREATE TABLE abandoned_adventure (
id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
aborted_at DATE DEFAULT SYSDATE NOT NULL,
last_station_id NUMBER,
distance_travelled NUMBER(8,2),
elapsed_sec NUMBER(10,2),

-- PK
CONSTRAINT pk_abandoned_adventure PRIMARY KEY (id),

-- FK
CONSTRAINT fk_abandoned_adventure_user_id FOREIGN KEY (user_id) REFERENCES cityscape_(id),
CONSTRAINT fk_abandoned_adventure_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id),
CONSTRAINT fk_abandoned_adventure_last_station_id FOREIGN KEY (last_station_id) REFERENCES station(id),

--UNIQUE
CONSTRAINT uq_abandoned_adventure_user_adventure UNIQUE (user_id, adventure_id)

);
/
CREATE TABLE completed_adventure (
id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
completed_at DATE DEFAULT SYSDATE NOT NULL,
distance_travelled NUMBER(8,2),
duration_sec NUMBER(10,2),

-- PK
CONSTRAINT pk_completed_adventure PRIMARY KEY (id),

-- FK
CONSTRAINT fk_completed_adventure_user_id FOREIGN KEY (user_id) REFERENCES cityscape_user(id),
CONSTRAINT fk_completed_adventure_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id)

);
/
CREATE TABLE lista (
id NUMBER,
creator_id NUMBER NOT NULL,
title VARCHAR2(50) NOT NULL,
lista_description VARCHAR2(500),
is_public NUMBER(1),
created_at DATE DEFAULT SYSDATE NOT NULL,

-- PK
CONSTRAINT pk_lista PRIMARY KEY (id),

-- FK
CONSTRAINT fk_lista_creator_id FOREIGN KEY (creator_id) REFERENCES cityscape_user(id),

-- UNIQUE
CONSTRAINT uq_lista_title UNIQUE (creator_id, title),

-- CHECK
CONSTRAINT check_lista_is_public CHECK(is_public IN (0,1))

);
/
CREATE TABLE lista_adventure (
lista_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,

-- PK
CONSTRAINT pk_lista_adventure PRIMARY KEY (lista_id, adventure_id),

-- FK
CONSTRAINT fk_lista_adventure_lista_id FOREIGN KEY (lista_id) REFERENCES lista(id),
CONSTRAINT fk_lista_adventure_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id)

);
/
CREATE TABLE review (
id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
rating NUMBER(1),
review_text VARCHAR2(500),

-- PK
CONSTRAINT pk_review PRIMARY KEY (id),

-- FK
CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES cityscape_user(id),
CONSTRAINT fk_review_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id),

-- CHECK
CONSTRAINT check_review_rating CHECK(rating IS NULL OR rating BETWEEN 1 AND 5)

);
/
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
/
CREATE TABLE user_follow (
follower_id NUMBER NOT NULL,
followed_id NUMBER NOT NULL,
date_followed DATE DEFAULT SYSDATE NOT NULL,

-- PK
CONSTRAINT pk_user_follow PRIMARY KEY (follower_id, followed_id),

-- FK
CONSTRAINT fk_user_follow_follower_id FOREIGN KEY (follower_id) REFERENCES cityscape_user(id),
CONSTRAINT fk_user_follow_followed_id FOREIGN KEY (followed_id) REFERENCES cityscape_user(id),

-- CHECK
CONSTRAINT check_user_follow_self CHECK(follower_id <> followed_id)

);
/

-- History tables

CREATE TABLE cityscape_user_h (
id NUMBER,
user_id NUMBER NOT NULL,
old_role VARCHAR2(10),
new_role VARCHAR2(10),
changed_at DATE DEFAULT SYSDATE NOT NULL,
changed_by NUMBER,

-- PK
CONSTRAINT pk_user_h PRIMARY KEY (id),
    
-- FK
CONSTRAINT fk_user_h_user FOREIGN KEY (user_id) REFERENCES cityscape_user(id)
);
/
CREATE TABLE adventure_status_h (
id NUMBER,
adventure_id NUMBER NOT NULL,
old_status VARCHAR2(20),
new_status VARCHAR2(20),
changed_at DATE DEFAULT SYSDATE NOT NULL,
changed_by NUMBER,

-- PK
CONSTRAINT pk_adventure_status_h PRIMARY KEY (id),

-- FK
CONSTRAINT fk_adventure_status_h_adv FOREIGN KEY (adventure_id) REFERENCES adventure(id)
);
/

