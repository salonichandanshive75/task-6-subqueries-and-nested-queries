use library;
drop table book;
drop table books;
drop table member;
drop table members;
create table books( book_id int primary key, title varchar(99));
create table members( member_id int primary key, name varchar(50));
create table loans (loan_id int primary key, member_id int, book_id int, loan_date date, foreign key (member_id) references members(member_id), foreign key(book_id) references books(book_id));
insert into books values (2, 'The Alchemist'), (3, 'Digital Fortress'), (4, 'A Brief History of Time'), (5, 'To kill a Mockingbird');
insert into members values (2, 'Alice'), (3, 'Bob'), (4, 'Charlie'), (5, 'David');
insert into loans values (303, 2, 3, '2024-05-02'), (304,3,2, '2024-05-03'), (305,4,5, '2024-6-22');
select members.name, books.title, loans.loan_date from loans 
inner join members on loans.member_id=members.member_id
inner join books on loans.book_id = books.book_id;
select members.name, books.title, loans.loan_date from members left join loans on members.member_id = loans.member_id left join books on loans.book_id = books.book_id;
select members.name, books.title, loans.loan_date from books right join loans on books.book_id=loans.book_id right join members on loans.member_id=members.member_id;
select members.name, books.title, loans.loan_date from members left join loans on members.member_id=loans.member_id left join books on loans.book_id=books.book_id
union select members.name, books.title, loans.loan_date from books left join loans on books.book_id=loans.book_id
left join members on loans.member_id=members.member_id;
drop table books;
drop table loans;
create table books (book_id int primary key, title varchar(99), price decimal(6,2));
insert into books values (2, 'The Alchemist', 300.00), (3, 'Digital Fortress', 450.00), (4, 'A Brief History of Time', 500.00), (5, 'To kill a Mocking bird', 250.00);
drop table loans;
create table loans(loan_id int primary key, book_id int, loan_date date, foreign key (book_id) references books(book_id));
insert into loans values (2, 3, '2024-04-29'), (3, 2, '2024-03-30'), (4,5, '2024-06-03');
select title, price, (select avg(price) from books) as avg_price from books;
select title, price from books where price>(select avg(price) from books);
select title, price from (select* from books where price>300) as expensive_books;
