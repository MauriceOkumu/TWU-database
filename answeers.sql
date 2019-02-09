--select * from member;
--select name from member where member.id=(select book.id from book where title="The Hobbit");
select name from member where id =(
select member_id from checkout_item where book_id = (
select book.id from book where title = "The Hobbit"));

--select all the names
--select * from member where not exists(
--select 1 from checkout_item where checkout_item.member_id=member.id);

--Add me as member
--insert into member(id, name) values(85, "Maurice Okumu");

--Add a book
--insert into book(id, title) values(56, "The Pragmatic Programmer");

--not using exists keyword, select the count
select count(*) from member where(
select count(*) from checkout_item where checkout_item.member_id = member.id) < 1;

--movies not checked out
select * from movie where(
select count(*) from checkout_item where checkout_item.movie_id = movie.id) < 1;

--books not checked out
select * from book where(
select count(*) from checkout_item where checkout_item.book_id = book.id) < 1;

--update member set id = 77 where name = "Maurice Okumu";
--update book set id = 57 where title = "The Pragmatic Programmer";

--create a join in the checkout table
--insert into checkout_item(member_id, book_id, movie_id) values(
--select member.id from member where name = "Maurice Okumu",
--select book.id from book where title = "The Pragmatic Programmer", null);

--);

--insert into checkout_item (select id from member where name = "Maurice Okumu",
--select id from book where title = "The Pragmatic Programmer", null);
insert into checkout_item(member_id, book_id, movie_id) values(77, 57, null);

--checkout the book I added and verify
select name from member where id = (
select member_id from checkout_item where book_id = (
select book.id from book where title = "The Pragmatic Programmer"));