--select * from member;
--select name from member where member.id=(select book.id from book where title="The Hobbit");
select name from member where id =(select member_id from checkout_item where book_id=(select book.id from book where title="The Hobbit"));

--select all the names
--select * from member where not exists(
--select 1 from checkout_item where checkout_item.member_id=member.id);

--not using exists keyword, select the count
select count(*) from member where(
select count(*) from checkout_item where checkout_item.member_id=member.id) < 1;

--movies not checked out
select * from movie where(
select count(*) from checkout_item where checkout_item.movie_id=movie.id) < 1;

--books not checked out
select * from book where(
select count(*) from checkout_item where checkout_item.book_id=book.id) < 1;