-- select * from buys;


CREATE TABLE customer (
  cust_id int NOT NULL,
  cust_name varchar(40),
  cust_addr varchar(50) ,
  cust_phone int ,
  PRIMARY KEY (cust_id)
);

CREATE TABLE store (
  store_id int NOT NULL,
  location varchar(40) DEFAULT NULL,
  s_phone int DEFAULT NULL,
  no_of_employee int DEFAULT NULL,
  PRIMARY KEY (store_id)
);

CREATE TABLE manufacturer (
  manu_id int NOT NULL,
  manu_name varchar(30) DEFAULT NULL,
  manu_phone int DEFAULT NULL,
  manu_email varchar(50) DEFAULT NULL,
  no_of_orders int DEFAULT NULL,
  PRIMARY KEY (manu_id)
);


CREATE TABLE employee (
  EmpId int NOT NULL,
  Emp_name varchar(30) DEFAULT NULL,
  Emp_role varchar(20) DEFAULT NULL,
  Salary int DEFAULT NULL,
  JOINING_DATE date DEFAULT NULL,
  store_id int DEFAULT NULL,
  PRIMARY KEY (EmpId), 
  FOREIGN KEY (store_id) REFERENCES store (store_id)
);

CREATE TABLE `product` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(40) NOT NULL,
  `price` int DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `manu_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`prod_id`,`prod_name`),
  FOREIGN KEY (`manu_id`) REFERENCES `manufacturer` (`manu_id`),
  FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
);

CREATE TABLE buys ( 
  cust_id INT NOT NULL, 
  prod_id INT NOT NULL, 
  PRIMARY KEY (cust_id, prod_id), 
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id), 
  FOREIGN KEY (prod_id) REFERENCES product(prod_id) 
); 



Alter table customer
modify cust_phone bigint;

insert into customer values
(2001,'Kishore Kumar','Laalbaug,Akkalkot',7498967841),
(2002,'Ranbir Kapoor','Raj Colony,Akkalkot',7845123696),
(2004,'Vijay Sethupathi','Sethu Nivas,Akkalkot',7489569741),
(2003,'Sharad Pawar','Silver Oak,Akkalkot',9874561224),
(2005,'Raj Thackrey','Krishna Kunj,Akkalkot',9878659645);


Alter table store
modify s_phone bigint;

insert into store values
(101,'Main Road,Akkalkot',202164555,5),
(102,'Old Adat Bazar,Akkalkot',202164555,4);

Alter table manufacturer
modify manu_phone bigint;

insert into manufacturer values
(425,'CSK Spices',011456987,'cskspices@gmail.com',500),
(401,'Adams Daily',20031045,'adamsdaily@gmail.com',150),
(405,'Aaryan Soaps',40056144,'aaryansoaps@gmail.com',300),
(411,'Bantai Butter',48751211,'bantaibutter@gmail.com',50),
(415,'Matoshri Sugar pvt',47856324,'matoshrisugar@gmail.com',110),
(420,'Rolex rice',7896314,'rolexrice@gmail.com',115);


alter table employee
add column emp_phone bigint;

insert into employee values
(10101,'Prashant Kumbhar','Manager',50000,'2018-01-01',101,7498964178),
(10102,'Kundan Patil','Salesperson',10000,'2018-01-02',101,4569785874),
(10103,'Kriti Senon','Receptionist',8000,'2019-01-01',101,9874123546),
(10104,'Shraddha Kapoor','Salesgirl',7500,'2019-01-01',101,8410056412),
(10105,'Varun Dhavan','Worker',5000,'2019-01-01',101,8045712893);

insert into employee values
(10201,'Samarth Kulkarni','Manager',50000,'2019-01-01',102,7498964890),
(10202,'Ravi Ashwin','Salesperson',10000,'2018-01-02',102,4569785847),
(10203,'Rashmika Mandanna','Receptionist',8000,'2019-01-01',102,9874123564),
(10204,'Samantha Ruth','Salesgirl',7500,'2019-01-01',102,8410056421),
(10205,'Vijay Deorkonda','Worker',5000,'2019-01-01',102,8045712839);

insert into product values
(11,'Chivada Masala',45,'2024-01-01',350,425,101),
(25,'Butter',90,'2023-01-01',35,411,101),
(56,'Dettol Soaps',30,'2023-01-01',50,405,101),
(55,'lux Soaps',35,'2023-01-01',50,405,102),
(60,'Rice',55,'2024-01-01',45,420,102);

alter table product
drop column quantity;

alter table buys
add column quantity int;

insert into buys values
(2004,11,3),
(2001,56,3),
(2002,55,3),
(2005,60,4),
(2003,25,2);

