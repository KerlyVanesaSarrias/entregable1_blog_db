create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(50),
	email varchar(100)
);

insert into users (first_name,last_name,email) values
	('Vanessa','Sarrias','vanesarrias@gmail.com'),
	('Kerly','Rojas','kerlyrojas@gmail.com'),
	('Santiago','Tovar','santovar@gmail.com');
 
 select * from users;
 
 create table posts (
	 id serial primary key,
	 creator_id int references users(id),
	 title varchar(200),
	 texts text
	 );

 insert into posts (creator_id,title,texts) values
	(1, 'First Post', 'Lorem ipsum dolor sit amet.'),
	(2, 'Second Post', 'Consectetur adipiscing elit.'),
	(3, 'Third Post', 'Sed do eiusmod tempor incididunt.'),
	(1, 'Fourth Post', 'Ut labore et dolore magna aliqua.'),
	(3, 'Fifth Post', 'Ut enim ad minim veniam.');
	
	
 select * from posts;
 
 create table likes (
 	id serial primary key,
	 user_id int references users(id),
	 post_id int references posts(id)
 );
 
 insert into likes (user_id,post_id) values
	(1,2),
	(2,1),
	(3,4),
	(1,5),
	(3,3);
	

 select * from likes;
 
 select posts.*, users.first_name, users.last_name,users.email 
 from posts join users 
 on posts.creator_id = users.id;
 
 select posts.*, users.first_name, users.last_name,users.email
 from posts
 join likes on posts.id = likes.post_id
 join users on likes.user_id = users.id;	
 
 