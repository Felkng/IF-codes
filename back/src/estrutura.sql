--
-- PostgreSQL database dump
--

\restrict juqu6uz2aXzAc5ZdwEa6I7bOLKTXpQGfbGFmGcflrH3fG46HfiQ3dwedJZXzFjz

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aluno_turma; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.aluno_turma (
    aluno_id bigint NOT NULL,
    turma_id bigint NOT NULL
);


ALTER TABLE public.aluno_turma OWNER TO integrador;

--
-- Name: alunos; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.alunos (
    user_id bigint NOT NULL,
    curso_id bigint,
    matricula integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.alunos OWNER TO integrador;

--
-- Name: atividade; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.atividade (
    id bigint NOT NULL,
    data_entrega timestamp(0) without time zone NOT NULL,
    problema_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    turma_id bigint
);


ALTER TABLE public.atividade OWNER TO integrador;

--
-- Name: atividade_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.atividade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atividade_id_seq OWNER TO integrador;

--
-- Name: atividade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.atividade_id_seq OWNED BY public.atividade.id;


--
-- Name: caso_teste; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.caso_teste (
    id bigint NOT NULL,
    entrada text NOT NULL,
    saida text NOT NULL,
    privado boolean DEFAULT true NOT NULL,
    problema_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.caso_teste OWNER TO integrador;

--
-- Name: caso_teste_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.caso_teste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.caso_teste_id_seq OWNER TO integrador;

--
-- Name: caso_teste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.caso_teste_id_seq OWNED BY public.caso_teste.id;


--
-- Name: correcao; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.correcao (
    id bigint NOT NULL,
    token character varying(512) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    submissao_id bigint NOT NULL,
    status_correcao_id bigint NOT NULL,
    caso_teste_id bigint NOT NULL
);


ALTER TABLE public.correcao OWNER TO integrador;

--
-- Name: correcao_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.correcao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correcao_id_seq OWNER TO integrador;

--
-- Name: correcao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.correcao_id_seq OWNED BY public.correcao.id;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.cursos (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cursos OWNER TO integrador;

--
-- Name: cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_seq OWNER TO integrador;

--
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.cursos_id_seq OWNED BY public.cursos.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO integrador;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO integrador;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO integrador;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO integrador;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO integrador;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO integrador;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO integrador;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO integrador;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO integrador;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO integrador;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO integrador;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: problema; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.problema (
    id bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    enunciado text NOT NULL,
    tempo_limite integer,
    memoria_limite integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    privado boolean DEFAULT true NOT NULL,
    created_by bigint
);


ALTER TABLE public.problema OWNER TO integrador;

--
-- Name: problema_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.problema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problema_id_seq OWNER TO integrador;

--
-- Name: problema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.problema_id_seq OWNED BY public.problema.id;


--
-- Name: professor; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.professor (
    id bigint NOT NULL,
    area_atuacao character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.professor OWNER TO integrador;

--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO integrador;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO integrador;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO integrador;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: status_correcao; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.status_correcao (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.status_correcao OWNER TO integrador;

--
-- Name: status_correcao_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.status_correcao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_correcao_id_seq OWNER TO integrador;

--
-- Name: status_correcao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.status_correcao_id_seq OWNED BY public.status_correcao.id;


--
-- Name: submissao; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.submissao (
    id bigint NOT NULL,
    data_submissao date NOT NULL,
    codigo text NOT NULL,
    linguagem integer NOT NULL,
    atividade_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint NOT NULL,
    status_correcao_id bigint NOT NULL
);


ALTER TABLE public.submissao OWNER TO integrador;

--
-- Name: submissao_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.submissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submissao_id_seq OWNER TO integrador;

--
-- Name: submissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.submissao_id_seq OWNED BY public.submissao.id;


--
-- Name: turma; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.turma (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    professor_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.turma OWNER TO integrador;

--
-- Name: turma_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.turma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turma_id_seq OWNER TO integrador;

--
-- Name: turma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.turma_id_seq OWNED BY public.turma.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: integrador
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO integrador;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: integrador
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO integrador;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: integrador
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: atividade id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.atividade ALTER COLUMN id SET DEFAULT nextval('public.atividade_id_seq'::regclass);


--
-- Name: caso_teste id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.caso_teste ALTER COLUMN id SET DEFAULT nextval('public.caso_teste_id_seq'::regclass);


--
-- Name: correcao id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao ALTER COLUMN id SET DEFAULT nextval('public.correcao_id_seq'::regclass);


--
-- Name: cursos id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id SET DEFAULT nextval('public.cursos_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: problema id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.problema ALTER COLUMN id SET DEFAULT nextval('public.problema_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: status_correcao id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.status_correcao ALTER COLUMN id SET DEFAULT nextval('public.status_correcao_id_seq'::regclass);


--
-- Name: submissao id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.submissao ALTER COLUMN id SET DEFAULT nextval('public.submissao_id_seq'::regclass);


--
-- Name: turma id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.turma ALTER COLUMN id SET DEFAULT nextval('public.turma_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: aluno_turma aluno_turma_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.aluno_turma
    ADD CONSTRAINT aluno_turma_pkey PRIMARY KEY (aluno_id, turma_id);


--
-- Name: alunos alunos_matricula_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_matricula_unique UNIQUE (matricula);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (user_id);


--
-- Name: atividade atividade_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_pkey PRIMARY KEY (id);


--
-- Name: caso_teste caso_teste_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.caso_teste
    ADD CONSTRAINT caso_teste_pkey PRIMARY KEY (id);


--
-- Name: correcao correcao_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao
    ADD CONSTRAINT correcao_pkey PRIMARY KEY (id);


--
-- Name: correcao correcao_token_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao
    ADD CONSTRAINT correcao_token_unique UNIQUE (token);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: problema problema_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.problema
    ADD CONSTRAINT problema_pkey PRIMARY KEY (id);


--
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: status_correcao status_correcao_nome_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.status_correcao
    ADD CONSTRAINT status_correcao_nome_unique UNIQUE (nome);


--
-- Name: status_correcao status_correcao_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.status_correcao
    ADD CONSTRAINT status_correcao_pkey PRIMARY KEY (id);


--
-- Name: submissao submissao_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.submissao
    ADD CONSTRAINT submissao_pkey PRIMARY KEY (id);


--
-- Name: turma turma_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: integrador
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: integrador
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: integrador
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: aluno_turma aluno_turma_aluno_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.aluno_turma
    ADD CONSTRAINT aluno_turma_aluno_id_foreign FOREIGN KEY (aluno_id) REFERENCES public.alunos(user_id) ON DELETE CASCADE;


--
-- Name: aluno_turma aluno_turma_turma_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.aluno_turma
    ADD CONSTRAINT aluno_turma_turma_id_foreign FOREIGN KEY (turma_id) REFERENCES public.turma(id) ON DELETE CASCADE;


--
-- Name: alunos alunos_curso_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_curso_id_foreign FOREIGN KEY (curso_id) REFERENCES public.cursos(id) ON DELETE SET NULL;


--
-- Name: alunos alunos_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: atividade atividade_problema_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_problema_id_foreign FOREIGN KEY (problema_id) REFERENCES public.problema(id);


--
-- Name: atividade atividade_turma_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_turma_id_foreign FOREIGN KEY (turma_id) REFERENCES public.turma(id) ON DELETE CASCADE;


--
-- Name: caso_teste caso_teste_problema_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.caso_teste
    ADD CONSTRAINT caso_teste_problema_id_foreign FOREIGN KEY (problema_id) REFERENCES public.problema(id) ON DELETE CASCADE;


--
-- Name: correcao correcao_caso_teste_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao
    ADD CONSTRAINT correcao_caso_teste_id_foreign FOREIGN KEY (caso_teste_id) REFERENCES public.caso_teste(id);


--
-- Name: correcao correcao_status_correcao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao
    ADD CONSTRAINT correcao_status_correcao_id_foreign FOREIGN KEY (status_correcao_id) REFERENCES public.status_correcao(id);


--
-- Name: correcao correcao_submissao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.correcao
    ADD CONSTRAINT correcao_submissao_id_foreign FOREIGN KEY (submissao_id) REFERENCES public.submissao(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: problema problema_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.problema
    ADD CONSTRAINT problema_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: professor professor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_id_foreign FOREIGN KEY (id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: submissao submissao_atividade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.submissao
    ADD CONSTRAINT submissao_atividade_id_foreign FOREIGN KEY (atividade_id) REFERENCES public.atividade(id);


--
-- Name: submissao submissao_status_correcao_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.submissao
    ADD CONSTRAINT submissao_status_correcao_id_foreign FOREIGN KEY (status_correcao_id) REFERENCES public.status_correcao(id);


--
-- Name: submissao submissao_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.submissao
    ADD CONSTRAINT submissao_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: turma turma_professor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: integrador
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_professor_id_foreign FOREIGN KEY (professor_id) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict juqu6uz2aXzAc5ZdwEa6I7bOLKTXpQGfbGFmGcflrH3fG46HfiQ3dwedJZXzFjz

