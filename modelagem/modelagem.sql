-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6

-- [ Diff summary ]
-- Dropped objects: 11
-- Created objects: 8
-- Changed objects: 4
-- Truncated tables: 0

SET search_path=public,pg_catalog,seguranca,administracao;
-- ddl-end --


-- [ Dropped objects ] --
ALTER TABLE seguranca.cidade DROP CONSTRAINT IF EXISTS fk_uf_cidade CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.removerusuario(integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.atualizarusuario(integer,character varying,character varying,character varying,character,character,date,integer,json) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.selecionarusuarioporid(IN integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.selecionarusuario(IN character varying,IN integer,IN integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.inserirusuario(character varying,character varying,character varying,character,character,date,integer,json) CASCADE;
-- ddl-end --
DROP TABLE IF EXISTS seguranca.cidade CASCADE;
-- ddl-end --
DROP SEQUENCE IF EXISTS seguranca.cidade_id_seq CASCADE;
-- ddl-end --
DROP TABLE IF EXISTS seguranca.uf CASCADE;
-- ddl-end --
DROP SEQUENCE IF EXISTS seguranca.sq_endereco CASCADE;
-- ddl-end --
DROP SEQUENCE IF EXISTS seguranca.sq_usuario CASCADE;
-- ddl-end --


-- [ Created objects ] --
-- object: administracao.cidade | type: TABLE --
-- DROP TABLE IF EXISTS administracao.cidade CASCADE;
CREATE TABLE administracao.cidade(
	id integer NOT NULL,
	nome varchar(70) NOT NULL,
	uf char(2) NOT NULL,
	CONSTRAINT pk_cidade PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN administracao.cidade.id IS 'Chave primaria da tabela';
-- ddl-end --
COMMENT ON COLUMN administracao.cidade.nome IS 'Nome da cidade';
-- ddl-end --
COMMENT ON COLUMN administracao.cidade.uf IS 'UF da cidade';
-- ddl-end --

-- object: administracao.uf | type: TABLE --
-- DROP TABLE IF EXISTS administracao.uf CASCADE;
CREATE TABLE administracao.uf(
	sigla char(3) NOT NULL,
	nome varchar(30) NOT NULL,
	CONSTRAINT pk_uf PRIMARY KEY (sigla)

);
-- ddl-end --
COMMENT ON COLUMN administracao.uf.sigla IS 'Sigla do estado';
-- ddl-end --
COMMENT ON COLUMN administracao.uf.nome IS 'Nome do estado';
-- ddl-end --

-- object: administracao.tipotelefone | type: TABLE --
-- DROP TABLE IF EXISTS administracao.tipotelefone CASCADE;
CREATE TABLE administracao.tipotelefone(
	id serial NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT pk_tipotelefone PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN administracao.tipotelefone.id IS 'Chave da tabela';
-- ddl-end --
COMMENT ON COLUMN administracao.tipotelefone.nome IS 'Nome do tipo de telefone';
-- ddl-end --

-- object: idtipo | type: COLUMN --
-- ALTER TABLE seguranca.telefone DROP COLUMN IF EXISTS idtipo CASCADE;
ALTER TABLE seguranca.telefone ADD COLUMN idtipo integer NOT NULL;
-- ddl-end --


-- object: seguranca.usuario_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS seguranca.usuario_id_seq CASCADE;
CREATE SEQUENCE seguranca.usuario_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: seguranca.endereco_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS seguranca.endereco_id_seq CASCADE;
CREATE SEQUENCE seguranca.endereco_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --



-- [ Changed objects ] --
ALTER TABLE seguranca.usuario ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE seguranca.usuario ALTER COLUMN id SET DEFAULT nextval('seguranca.usuario_id_seq'::regclass);
-- ddl-end --
ALTER TABLE seguranca.endereco ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE seguranca.endereco ALTER COLUMN id SET DEFAULT nextval('seguranca.endereco_id_seq'::regclass);
-- ddl-end --
ALTER TABLE administracao.tiposanguineo ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE administracao.tiposanguineo ALTER COLUMN id SET DEFAULT nextval('administracao.tiposanguineo_id_seq'::regclass);
-- ddl-end --
ALTER TABLE seguranca.telefone ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE seguranca.telefone ALTER COLUMN id SET DEFAULT nextval('seguranca.telefone_id_seq'::regclass);
-- ddl-end --


-- [ Created foreign keys ] --
-- object: fk_uf_cidade | type: CONSTRAINT --
-- ALTER TABLE administracao.cidade DROP CONSTRAINT IF EXISTS fk_uf_cidade CASCADE;
ALTER TABLE administracao.cidade ADD CONSTRAINT fk_uf_cidade FOREIGN KEY (uf)
REFERENCES administracao.uf (sigla) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_telefone_tipotelefone | type: CONSTRAINT --
-- ALTER TABLE seguranca.telefone DROP CONSTRAINT IF EXISTS fk_telefone_tipotelefone CASCADE;
ALTER TABLE seguranca.telefone ADD CONSTRAINT fk_telefone_tipotelefone FOREIGN KEY (idtipo)
REFERENCES administracao.tipotelefone (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

