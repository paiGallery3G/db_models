create table album
(
    id serial,
    title text,
    author text,
    description text,
    last_edited date,
    created_at date
);

create table image
(
    id serial,
    id_album bigint,
    title text,
    author text,
    description text,
    created_at date
);

create table primary_comment
(
    id serial,
    id_image bigint,
    title text,
    author text,
    content text,
    created_at date
);

create table secondary_comment
(
    id serial,
    title text,
    author text,
    last_element_added_at date,
    created_at date
);

create table tag
(
    id serial,
    id_primary bigint,
    title text,
    author text,
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

