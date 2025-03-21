SET SQL DIALECT 3;

SET NAMES UTF8;

CREATE DATABASE 'posto_abc.fdb'
USER 'SYSDBA' PASSWORD ''
PAGE_SIZE 8192
DEFAULT CHARACTER SET UTF8 COLLATION UTF8;


/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE BOMBAS (
    ID         INTEGER GENERATED BY DEFAULT AS IDENTITY,
    TANQUE_ID  INTEGER,
    DESCRICAO  VARCHAR(100)
);

CREATE TABLE EMPRESAS (
    ID    INTEGER GENERATED BY DEFAULT AS IDENTITY,
    NOME  VARCHAR(100)
);

CREATE TABLE IMPOSTOS (
    ID         INTEGER GENERATED BY DEFAULT AS IDENTITY,
    DESCRICAO  VARCHAR(100),
    ALIQUOTA   DECIMAL(15,2) DEFAULT 0 NOT NULL
);

CREATE TABLE PRODUTOS (
    ID           INTEGER GENERATED BY DEFAULT AS IDENTITY,
    DESCRICAO    VARCHAR(100),
    PRECO_VENDA  DECIMAL(15,4) DEFAULT 0 NOT NULL
);

CREATE TABLE PRODUTOS_IMPOSTOS (
    IMPOSTO_ID  INTEGER NOT NULL,
    PRODUTO_ID  INTEGER NOT NULL
);

CREATE TABLE TANQUES (
    ID          INTEGER GENERATED BY DEFAULT AS IDENTITY,
    PRODUTO_ID  INTEGER NOT NULL,
    DESCRICAO   VARCHAR(100)
);

CREATE TABLE VENDAS (
    ID              INTEGER GENERATED BY DEFAULT AS IDENTITY,
    DATA_HORA       TIMESTAMP NOT NULL,
    SUBTOTAL        DECIMAL(15,4) DEFAULT 0 NOT NULL,
    TOTAL_IMPOSTOS  DECIMAL(15,4) DEFAULT 0 NOT NULL,
    TOTAL           DECIMAL(15,4) DEFAULT 0 NOT NULL
);

CREATE TABLE VENDAS_ITENS (
    ID              INTEGER GENERATED BY DEFAULT AS IDENTITY,
    VENDA_ID        INTEGER NOT NULL,
    PRODUTO_ID      INTEGER NOT NULL,
    QUANTIDADE      DECIMAL(15,4) DEFAULT 0 NOT NULL,
    PRECO           DECIMAL(15,4) DEFAULT 0 NOT NULL,
    SUBTOTAL        DECIMAL(15,4) DEFAULT 0 NOT NULL,
    TOTAL_IMPOSTOS  DECIMAL(15,4) DEFAULT 0,
    TOTAL           DECIMAL(15,4) DEFAULT 0,
    BOMBA_ID        INTEGER,
    TANQUE_ID       INTEGER
);



/******************************************************************************/
/*                          Autoincrement generators                          */
/******************************************************************************/

ALTER TABLE BOMBAS ALTER ID RESTART WITH 4;
ALTER TABLE EMPRESAS ALTER ID RESTART WITH 1;
ALTER TABLE IMPOSTOS ALTER ID RESTART WITH 1;
ALTER TABLE PRODUTOS ALTER ID RESTART WITH 2;
ALTER TABLE TANQUES ALTER ID RESTART WITH 2;
ALTER TABLE VENDAS ALTER ID RESTART WITH 16;
ALTER TABLE VENDAS_ITENS ALTER ID RESTART WITH 10;




/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE BOMBAS ADD CONSTRAINT PK_BOMBAS PRIMARY KEY (ID);
ALTER TABLE EMPRESAS ADD CONSTRAINT PK_EMPRESAS PRIMARY KEY (ID);
ALTER TABLE IMPOSTOS ADD CONSTRAINT PK_IMPOSTOS PRIMARY KEY (ID);
ALTER TABLE PRODUTOS ADD CONSTRAINT PK_PRODUTOS PRIMARY KEY (ID);
ALTER TABLE PRODUTOS_IMPOSTOS ADD CONSTRAINT PK_PRODUTOS_IMPOSTOS PRIMARY KEY (IMPOSTO_ID, PRODUTO_ID);
ALTER TABLE TANQUES ADD CONSTRAINT PK_TANQUES PRIMARY KEY (ID);
ALTER TABLE VENDAS ADD CONSTRAINT PK_VENDAS PRIMARY KEY (ID);
ALTER TABLE VENDAS_ITENS ADD CONSTRAINT PK_VENDAS_ITENS PRIMARY KEY (ID);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE BOMBAS ADD CONSTRAINT FK_BOMBAS_TANQUES FOREIGN KEY (TANQUE_ID) REFERENCES TANQUES (ID) ON UPDATE CASCADE;
ALTER TABLE TANQUES ADD CONSTRAINT FK_TANQUES_PRODUTOS FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE VENDAS_ITENS ADD CONSTRAINT FK_VENDAS_ITENS_BOMBA FOREIGN KEY (BOMBA_ID) REFERENCES BOMBAS (ID);
ALTER TABLE VENDAS_ITENS ADD CONSTRAINT FK_VENDAS_ITENS_PRODUTO FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ON UPDATE CASCADE;
ALTER TABLE VENDAS_ITENS ADD CONSTRAINT FK_VENDAS_ITENS_TANQUE FOREIGN KEY (TANQUE_ID) REFERENCES TANQUES (ID);
ALTER TABLE VENDAS_ITENS ADD CONSTRAINT FK_VENDAS_ITENS_VENDA FOREIGN KEY (VENDA_ID) REFERENCES VENDAS (ID) ON DELETE CASCADE ON UPDATE CASCADE;


/******************************************************************************/
/*                                   Roles                                    */
/******************************************************************************/

CREATE ROLE RDB$ADMIN;
