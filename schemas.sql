CREATE TABLE member (
  id integer primary key,
  name text,
  unique(name)
);
CREATE TABLE checkout_item (
  member_id integer,
  book_id integer,
  movie_id integer,
  unique(member_id, book_id, movie_id) on conflict replace,
  unique(book_id),
  unique(movie_id)
);
CREATE TABLE book (
  id integer primary key,
  title text,
  unique(title)
);
CREATE TABLE movie (
  id integer primary key,
  title text,
  unique(title)
);
