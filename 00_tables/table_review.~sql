CREATE TABLE review (
review_id NUMBER,
user_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,
rating NUMBER(1),
review_text VARCHAR2(500),

-- PK
CONSTRAINT pk_review PRIMARY KEY (review_id),

-- FK
CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES cityscape_users(user_id),
CONSTRAINT fk_review_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(adventure_id),

-- CHECK
CONSTRAINT check_review_rating CHECK(rating IS NULL OR rating BETWEEN 1 AND 5)

);
