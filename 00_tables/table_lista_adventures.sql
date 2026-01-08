CREATE TABLE lista_adventures (
lista_id NUMBER NOT NULL,
adventure_id NUMBER NOT NULL,

-- PK
CONSTRAINT pk_list_adventures PRIMARY KEY (lista_id, adventure_id),

-- FK
CONSTRAINT fk_lista_adventures_list_id FOREIGN KEY (lista_id) REFERENCES lista(id),
CONSTRAINT fk_lista_adventures_adventure_id FOREIGN KEY (adventure_id) REFERENCES adventure(id)

);
