-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6

-- [ Diff summary ]
-- Dropped objects: 9
-- Created objects: 2
-- Changed objects: 5
-- Truncated tables: 0

SET search_path=public,pg_catalog,seguranca,administracao;
-- ddl-end --


-- [ Dropped objects ] --
DROP FUNCTION IF EXISTS administracao.selecionaruf() CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS administracao.selecionartipotelefone() CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS administracao.selecionartiposanguineo() CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS administracao.selecionarcidade(IN character,IN character varying,IN integer,IN integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.removerusuario(integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.atualizarusuario(integer,character varying,character varying,character varying,character,date,integer,boolean,character varying,json,json) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.selecionarusuarioporid(IN integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.selecionarusuario(IN character varying,IN integer,IN integer) CASCADE;
-- ddl-end --
DROP FUNCTION IF EXISTS seguranca.inserirusuario(character varying,character varying,character varying,character,date,integer,character varying,json,json) CASCADE;
-- ddl-end --


-- [ Created objects ] --
-- object: logon | type: COLUMN --
-- ALTER TABLE seguranca.usuario DROP COLUMN IF EXISTS logon CASCADE;
ALTER TABLE seguranca.usuario ADD COLUMN logon varchar(30) NOT NULL;
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
ALTER TABLE administracao.tipotelefone ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE administracao.tipotelefone ALTER COLUMN id SET DEFAULT nextval('administracao.tipotelefone_id_seq'::regclass);
-- ddl-end --


-- [ Created foreign keys ] --
-- object: fk_cidade_endereco | type: CONSTRAINT --
-- ALTER TABLE seguranca.endereco DROP CONSTRAINT IF EXISTS fk_cidade_endereco CASCADE;
ALTER TABLE seguranca.endereco ADD CONSTRAINT fk_cidade_endereco FOREIGN KEY (idcidade)
REFERENCES administracao.cidade (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

