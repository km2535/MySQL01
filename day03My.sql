create database customer;
drop database customer;

create database day03;
use day03;

create table customer(
	customer_name varchar(300) primary key,
    customer_age int, 
    customer_addr varchar(300),
    customer_class varchar(300)
);

create table product(
	product_idx int primary key,
	product_id varchar(300),
	product_name varchar(300),
    product_cnt int, 
    product_price int,
    constraint product_customer_pk foreign key(product_id) references customer(customer_name)
);
drop table customer;
drop table product;
# 데이터 삽입
insert into customer values
	('이강민', 30, '부산시 영도구', 'VIP'),
    ('김혜화', 30, '강남구 테헤란로', 'VVIP'),
	('김수수', 24, '경기 남양주시', 'GOLD'),
	('박곽우', 26, '경기 구리시', 'MVP'),
	('심이수', 31, '강북구 압구정', 'VIP');
    
    
insert into product values
	(1, '이강민', '버버리', 2, 2000000),
    (2, '김수수', '샤넬', 2, 5500000),
    (3, '박곽우', '커피머신', 2, 1500000),
    (4, '김혜화', '버버리', 2, 6000000),
    (5, '김혜화', '에르메스', 2, 34000000);
    
select * from product;
select * from customer;

delete from product where product_idx = 1;
insert into product values(1, '이강민', '버버리', 2, 2000000);

update product set product_price = null where product_idx =1;