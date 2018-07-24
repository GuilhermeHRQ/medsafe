-- Database diff generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6

-- [ Diff summary ]
-- Dropped objects: 7
-- Created objects: 4
-- Changed objects: 2
-- Truncated tables: 0

SET search_path=public,pg_catalog,seguranca,administracao;
-- ddl-end --


-- [ Dropped objects ] --
ALTER TABLE seguranca.endereco DROP CONSTRAINT IF EXISTS fk_uf_endereco CASCADE;
-- ddl-end --
ALTER TABLE seguranca.usuario DROP COLUMN IF EXISTS celular CASCADE;
-- ddl-end --
ALTER TABLE seguranca.endereco DROP COLUMN IF EXISTS uf CASCADE;
-- ddl-end --


-- [ Created objects ] --
-- object: ativo | type: COLUMN --
-- ALTER TABLE seguranca.usuario DROP COLUMN IF EXISTS ativo CASCADE;
ALTER TABLE seguranca.usuario ADD COLUMN ativo boolean NOT NULL DEFAULT true;
-- ddl-end --


-- object: senha | type: COLUMN --
-- ALTER TABLE seguranca.usuario DROP COLUMN IF EXISTS senha CASCADE;
ALTER TABLE seguranca.usuario ADD COLUMN senha varchar(100) NOT NULL;
-- ddl-end --


-- object: seguranca.telefone | type: TABLE --
-- DROP TABLE IF EXISTS seguranca.telefone CASCADE;
CREATE TABLE seguranca.telefone(
	id serial NOT NULL,
	idusuario integer NOT NULL,
	numero char(11) NOT NULL,
	CONSTRAINT pk_telefone PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN seguranca.telefone.id IS 'Chave primária da tabela';
-- ddl-end --
COMMENT ON COLUMN seguranca.telefone.idusuario IS 'ID do usuário a que pertence o telefone';
-- ddl-end --
COMMENT ON COLUMN seguranca.telefone.numero IS 'numero do telefone';
-- ddl-end --



-- [ Changed objects ] --
ALTER TABLE seguranca.usuario ALTER COLUMN id SET DEFAULT nextval('seguranca.sq_usuario'::regclass);
-- ddl-end --
ALTER TABLE administracao.tiposanguineo ALTER COLUMN id TYPE integer;
-- ddl-end --
ALTER TABLE administracao.tiposanguineo ALTER COLUMN id SET DEFAULT nextval('administracao.tiposanguineo_id_seq'::regclass);
-- ddl-end --


-- [ Created foreign keys ] --
-- object: fk_telefone_usuario | type: CONSTRAINT --
-- ALTER TABLE seguranca.telefone DROP CONSTRAINT IF EXISTS fk_telefone_usuario CASCADE;
ALTER TABLE seguranca.telefone ADD CONSTRAINT fk_telefone_usuario FOREIGN KEY (idusuario)
REFERENCES seguranca.usuario (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

