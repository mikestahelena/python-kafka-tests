CREATE TABLE public.customer (
	id serial4 NOT NULL,
	name varchar NOT NULL,
	document varchar NOT NULL,
	birthdate timestamp NOT NULL,
	email varchar NOT NULL,
	phone varchar NOT NULL,
	address varchar NOT NULL,
	city varchar NOT NULL,
	state varchar NOT NULL,
    job varchar NOT NULL,
    company varchar NOT NULL,
    start_date timestamp NOT NULL,
	income double precision NOT NULL,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT customer_document_uk UNIQUE (document),
	CONSTRAINT customer_pk PRIMARY KEY (id)
);

ALTER TABLE public.customer REPLICA IDENTITY FULL;
