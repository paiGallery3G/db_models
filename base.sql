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
    id_album bigint unsigned,
    title varchar(64),
    ftype varchar(32),
    author varchar(64),
    description text,
    created_at date
);

create table primary_comment
(
    id serial PRIMARY KEY,
    id_image bigint unsigned,
    title varchar(64),
    author varchar(64),
    content text,
    created_at date
);

create table secondary_comment
(
    id serial PRIMARY KEY,
    id_primary bigint unsigned,
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
    id_image bigint unsigned,
    id_tag bigint unsigned,
    PRIMARY KEY(id_image, id_tag)
);

create table tag_album
(
    id_album bigint unsigned,
    id_tag bigint unsigned,
    PRIMARY KEY(id_album, id_tag)
);

