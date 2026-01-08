CREATE TABLE cityscape_users (
id NUMBER NOT NULL,
username VARCHAR2(20) NOT NULL,
email VARCHAR2(50) NOT NULL,
password_hash VARCHAR2(30) NOT NULL,
registration_date DATE DEFAULT SYSDATE NOT NULL,
user_role VARCHAR2(10) default 'USER' not null,
profile_description VARCHAR2(100),
profile_picture_url VARCHAR2(400),

-- PK

CONSTRAINT pk_cityscape_users PRIMARY KEY (id),

-- UNIQUE

CONSTRAINT uq_cityscape_users_username UNIQUE (username),
CONSTRAINT uq_cityscape_email UNIQUE (email),

-- CHECK

CONSTRAINT check_cityscape_users_username CHECK(LENGTH(username) BETWEEN 4 AND 20),
CONSTRAINT check_cityscape_users_user_role CHECK(user_role IN ('USER','MODERATOR','ADMIN'))

);

