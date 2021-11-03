create table album
(
    id serial PRIMARY KEY,
    title varchar(64),
    author varchar(64),
    description text,
    created_at date
);

create table image
(
    id serial PRIMARY KEY,
    id_album bigint,
    title varchar(64),
    ftype varchar(32),
    author varchar(64),
    description text,
    created_at date
);

create table primary_comment
(
    id serial PRIMARY KEY,
    id_image bigint,
    title varchar(64),
    author varchar(64),
    content text,
    created_at date
);

create table secondary_comment
(
    id serial PRIMARY KEY,
    id_primary bigint,
    title varchar(64),
    author varchar(64),
    content text,
    created_at date
);

create table tag
(
    id serial PRIMARY KEY,
    title varchar(64),
    author varchar(64),
    content text,
    created_at date
);

create table tag_image
(
    id_image bigint,
    id_tag bigint,
    PRIMARY KEY(id_image, id_tag)
);

create table tag_album
(
    id_album bigint,
    id_tag bigint,
    PRIMARY KEY(id_album, id_tag)
);

