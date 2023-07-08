drop database sportvision;
create database sportvision;
use sportvision;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id int,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  foreign key(user_id) references users(user_id)
);

CREATE TABLE user_wishlist (
	wishlist_id int auto_increment primary key,
    user_id int not null,
    product_id int not null,
	foreign key(user_id) references users(user_id),
    foreign key(product_id) references products(product_id)
);
drop table user_wishlist;
CREATE TABLE product_reviews (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id int NOT NULL,
  user_id INT NOT NULL,
  rating DECIMAL(3, 2) NOT NULL,
  review TEXT,
  review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	foreign key(user_id) references users(user_id),
	foreign key(product_id) references products(product_id)
);
drop table product_reviews;

insert into users(username, email, password) 
values('Ion', 'ion@example.com', 'password123');
insert into users(username, email, password) 
values('David', 'david@example.com', 'passw123');
insert into users(username, email, password) 
values('Matei', 'matei@example.com', 'password1234');
insert into users(username, email, password) 
values('George', 'george@example.com', 'password3');
insert into users(username, email, password) 
values('Gabriel', 'gabriel@example.com', 'word123');
insert into users(username, email, password) 
values('Maria', 'maria@example.com', 'password12345');

select *from users;

insert into products( name, description, price) values('NIKE Sports Shoes LEBRON', 'Follow in the footsteps of a great champion with this pair of basketball shoes from Nike!','1209.99');
insert into products( name, description, price) values('adidas Pantofi Sport Web Boost Shoes',' These shoes have a responsive adidas BOOST sole, placed inside a Stretchweb outer sole that flexes naturally', '899.99');
insert into products( name, description, price) values('NEW BALANCE Pantofi Sport Fresh Foam X More v4','Each step will turn into pure energy thanks to advanced technology that absorbs shock.','809.99');
insert into products( name, description, price) values('ASICS Pantofi Sport GEL-CUMULUS 25', 'Feel fresh in your Asics Gel-Cumulus 25 sneakers! They are designed to provide comfort and support at every step.','849.99');
insert into products( name, description, price) values('adidas Pantofi Sport ADIDAS 4D FWD SHOES',' Feel the adidas difference with every step of the way in your 4DFWD 2 running shoes!', '800.99');

select * from products;

insert into product_reviews(product_id, user_id, rating, review) values('1', '2', '3', 'Average product, could be better');
insert into product_reviews(product_id, user_id, rating, review) values('1', '3', '5', 'Excellent');
insert into product_reviews(product_id, user_id, rating, review) values('2', '2', '5', 'Exceeded my expectations');

select * from product_reviews;

insert into user_wishlist(user_id, product_id) values('4','4');
insert into user_wishlist(user_id, product_id) values('4','3');
insert into user_wishlist(user_id, product_id) values('4','2');
insert into user_wishlist(user_id, product_id) values('1','4');
insert into user_wishlist(user_id, product_id) values('1','4');
select * from user_wishlist;

select *from users  where  username = 'George';
alter table products add manufacturer varchar(100);
insert into users(username, email, password) 
values('Maria', 'mary@example.com', 'password12345');

select *from users where username = 'Maria' and email = 'mary@example.com';
select *from users where username = 'Maria' or username= 'George';

update  users set username = upper(username);
select username as 'USER' from users;

select *from product_reviews order by review desc;

select * from products where name like '%ad%';

select * from product_reviews where rating < 4;

select sum(rating) from product_reviews;

update users set username = 'George' where username= 'Maria';
delete from user_wishlist where user_id = 1;

select group_concat(username separator '  , ')
from users;

select * from users left join product_reviews on users.user_id=product_reviews.review_id;
select *from users inner join user_wishlist on users.user_id=user_wishlist.wishlist_id;

select * from user_wishlist where product_id between 1 and 4;











