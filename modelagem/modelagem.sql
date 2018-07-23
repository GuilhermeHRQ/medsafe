-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6

-- [ Diff summary ]
-- Dropped objects: 0
-- Created objects: 14
-- Changed objects: 0
-- Truncated tables: 0

SET search_path=public,pg_catalog,seguranca,administracao;
-- ddl-end --


-- [ Created objects ] --
-- object: seguranca | type: SCHEMA --
-- DROP SCHEMA IF EXISTS seguranca CASCADE;
CREATE SCHEMA seguranca;
-- ddl-end --

-- object: seguranca.sq_usuario | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS seguranca.sq_usuario CASCADE;
CREATE SEQUENCE seguranca.sq_usuario
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: seguranca.usuario | type: TABLE --
-- DROP TABLE IF EXISTS seguranca.usuario CASCADE;
CREATE TABLE seguranca.usuario(
	id integer NOT NULL DEFAULT nextval('seguranca.sq_usuario'::regclass),
	idtiposanguineo integer NOT NULL,
	idendereco integer NOT NULL,
	nome varchar(50) NOT NULL,
	sobrenome varchar(50) NOT NULL,
	email varchar(255) NOT NULL,
	cpf char(11) NOT NULL,
	celular char(11) NOT NULL,
	datanascimento date NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.id IS 'Chave da tabela';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.idtiposanguineo IS 'Chave estrangeira do tipo sanguíneo do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.idendereco IS 'Chave estrangeira do endereço do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.nome IS 'Nome do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.sobrenome IS 'Sobrenome do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.email IS 'Email do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.cpf IS 'CPF do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.celular IS 'Celular do usuário';
-- ddl-end --
COMMENT ON COLUMN seguranca.usuario.datanascimento IS 'Data de nascimento do usuário';
-- ddl-end --

-- object: seguranca.sq_endereco | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS seguranca.sq_endereco CASCADE;
CREATE SEQUENCE seguranca.sq_endereco
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: seguranca.endereco | type: TABLE --
-- DROP TABLE IF EXISTS seguranca.endereco CASCADE;
CREATE TABLE seguranca.endereco(
	id integer NOT NULL DEFAULT nextval('seguranca.sq_endereco'::regclass),
	cep char(8) NOT NULL,
	logradouro varchar(70) NOT NULL,
	bairro varchar(50) NOT NULL,
	numero smallint NOT NULL,
	uf char(2) NOT NULL,
	idcidade integer NOT NULL,
	CONSTRAINT pk_endereco PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.id IS 'Chave primaria da tabela endereco';
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.cep IS 'CEP do endereco';
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.logradouro IS 'Logradouro do endereco';
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.bairro IS 'Bairro do endereco';
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.uf IS 'UF do endereco';
-- ddl-end --
COMMENT ON COLUMN seguranca.endereco.idcidade IS 'ID da cidade do endereco';
-- ddl-end --

-- object: seguranca.uf | type: TABLE --
-- DROP TABLE IF EXISTS seguranca.uf CASCADE;
CREATE TABLE seguranca.uf(
	sigla char(3) NOT NULL,
	nome varchar(30) NOT NULL,
	CONSTRAINT pk_uf PRIMARY KEY (sigla)

);
-- ddl-end --
COMMENT ON COLUMN seguranca.uf.sigla IS 'Sigla do estado';
-- ddl-end --
COMMENT ON COLUMN seguranca.uf.nome IS 'Nome do estado';
-- ddl-end --

-- object: seguranca.cidade | type: TABLE --
-- DROP TABLE IF EXISTS seguranca.cidade CASCADE;
CREATE TABLE seguranca.cidade(
	id serial NOT NULL,
	nome varchar(70) NOT NULL,
	uf char(2) NOT NULL,
	CONSTRAINT pk_cidade PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN seguranca.cidade.id IS 'Chave primaria da tabela';
-- ddl-end --
COMMENT ON COLUMN seguranca.cidade.nome IS 'Nome da cidade';
-- ddl-end --
COMMENT ON COLUMN seguranca.cidade.uf IS 'UF da cidade';
-- ddl-end --

-- object: administracao | type: SCHEMA --
-- DROP SCHEMA IF EXISTS administracao CASCADE;
CREATE SCHEMA administracao;
-- ddl-end --

-- object: administracao.tiposanguineo | type: TABLE --
-- DROP TABLE IF EXISTS administracao.tiposanguineo CASCADE;
CREATE TABLE administracao.tiposanguineo(
	id serial NOT NULL,
	nome char(3) NOT NULL,
	CONSTRAINT pk_tiposanguineo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN administracao.tiposanguineo.id IS 'Chave primaria da tabela';
-- ddl-end --
COMMENT ON COLUMN administracao.tiposanguineo.nome IS 'Nome do tipo sanguineo';
-- ddl-end --



-- [ Created foreign keys ] --
-- object: fk_endereco_usuario | type: CONSTRAINT --
-- ALTER TABLE seguranca.usuario DROP CONSTRAINT IF EXISTS fk_endereco_usuario CASCADE;
ALTER TABLE seguranca.usuario ADD CONSTRAINT fk_endereco_usuario FOREIGN KEY (idendereco)
REFERENCES seguranca.endereco (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_tiposanguineo_usuario | type: CONSTRAINT --
-- ALTER TABLE seguranca.usuario DROP CONSTRAINT IF EXISTS fk_tiposanguineo_usuario CASCADE;
ALTER TABLE seguranca.usuario ADD CONSTRAINT fk_tiposanguineo_usuario FOREIGN KEY (idtiposanguineo)
REFERENCES administracao.tiposanguineo (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_uf_endereco | type: CONSTRAINT --
-- ALTER TABLE seguranca.endereco DROP CONSTRAINT IF EXISTS fk_uf_endereco CASCADE;
ALTER TABLE seguranca.endereco ADD CONSTRAINT fk_uf_endereco FOREIGN KEY (uf)
REFERENCES seguranca.uf (sigla) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_cidade_endereco | type: CONSTRAINT --
-- ALTER TABLE seguranca.endereco DROP CONSTRAINT IF EXISTS fk_cidade_endereco CASCADE;
ALTER TABLE seguranca.endereco ADD CONSTRAINT fk_cidade_endereco FOREIGN KEY (idcidade)
REFERENCES seguranca.cidade (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_uf_cidade | type: CONSTRAINT --
-- ALTER TABLE seguranca.cidade DROP CONSTRAINT IF EXISTS fk_uf_cidade CASCADE;
ALTER TABLE seguranca.cidade ADD CONSTRAINT fk_uf_cidade FOREIGN KEY (uf)
REFERENCES seguranca.uf (sigla) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

