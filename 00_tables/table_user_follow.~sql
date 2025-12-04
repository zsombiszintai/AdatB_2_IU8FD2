CREATE TABLE user_follow (
follower_id NUMBER NOT NULL,
followed_id NUMBER NOT NULL,
date_followed DATE DEFAULT SYSDATE NOT NULL,

-- PK
CONSTRAINT pk_user_follow PRIMARY KEY (follower_id, followed_id),

-- FK
CONSTRAINT fk_user_follow_follower_id FOREIGN KEY (follower_id) REFERENCES cityscape_users(user_id),
CONSTRAINT fk_user_follow_followed_id FOREIGN KEY (followed_id) REFERENCES cityscape_users(user_id),

-- CHECK
CONSTRAINT check_user_follow_self CHECK(follower_id <> followed_id)

);
