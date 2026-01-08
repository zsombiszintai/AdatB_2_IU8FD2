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
CONSTRAINT fk_lista_creator_id FOREIGN KEY (creator_id) REFERENCES cityscape_users(id),

-- UNIQUE
CONSTRAINT uq_lista_title UNIQUE (creator_id, title),

-- CHECK
CONSTRAINT check_lista_is_public CHECK(is_public IN (0,1))

);
