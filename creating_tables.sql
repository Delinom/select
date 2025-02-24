create table if not exists genres (
	genre_id serial primary key,
	genre_name varchar(20) not null
);

create table if not exists authors (
	author_id serial primary key,
	author_name varchar(30) not null
);

create table if not exists authorsgenres (
	author_id integer references authors(author_id),
	genre_id integer references genres(genre_id)
);

create table if not exists albums (
	album_id serial primary key,
	album_name varchar(30) not null,
	album_year SMALLINT CHECK (album_year BETWEEN 1900 AND 2100) not null
);

create table if not exists albumsauthors (
	author_id integer references authors(author_id),
	album_id integer references albums(album_id)
);

create table if not exists tracks (
	track_id serial primary key,
	track_name varchar(30) not null,
	track_duration integer not null,
	album_id integer not null references albums(album_id)
);

create table if not exists collections (
	collection_id serial primary key,
	collection_name varchar(30) not null,
	collection_year SMALLINT CHECK (collection_year BETWEEN 1900 AND 2100) not null
);

create table if not exists collectionstracks (
	collection_id integer references collections(collection_id),
	track_id integer references tracks(track_id)
);

