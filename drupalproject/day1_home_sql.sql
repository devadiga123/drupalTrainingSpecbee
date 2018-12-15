use payment;

create table wallet(
id int(10) unsigned not null auto_increment comment "Id",
cid int(10) unsigned not null  comment "Customer Id",
sid int(10) unsigned not null  comment "Subscription Id",
line_item_id int(11) comment "Line Item Id",
line_item_aid int(11) comment "Line Item Id",
amount decimal(10,2) comment "amount",
total decimal(10,2) comment "total",
transaction_id varchar(255) comment "transaction_id",
payment_id varchar(255) comment "payment_id",
transaction_type varchar(255) comment "transaction_type",
reversal varchar(255) comment "reversal",
`status` tinyint(1) comment "status",
created datetime comment "created",
updated datetime comment "updated",
user_id int(11) comment "user_id",
delivery_date date comment "delivery_date",
primary key(id)
);
create table transaction(
id int(10) unsigned not null auto_increment comment "Id",
cid int(10) unsigned not null  comment "Customer Id",
sid int(10) unsigned not null  comment "Subscription Id",
amount decimal(10,2) comment "amount",
total decimal(10,2) comment "total",
transaction_id varchar(255) comment "transaction_id",
payment_id varchar(255) comment "payment_id",
transaction_type varchar(255) comment "transaction_type",
`status` tinyint(1) comment "status",
created datetime comment "created",
updated datetime comment "updated",
response varchar(45) comment "response",
unique key(transaction_id),
unique key(payment_id),
primary key(id)
);




start transaction;
insert into wallet values('1','2','3','10','10','100.00','100.00','abc',
'def','ghi','jkl','6','2018-01-01 00:00:05','2018-01-01 00:00:05','10','2018-01-01 00:00:05');
insert into transaction values('1','2','3','100.00','100.00','abc',
'def','ghi','6','2018-01-01 00:00:05','2018-01-01 00:00:05','done');
commit;

start transaction;
update wallet set transaction_id="xyz" where id="1";
update transaction set transaction_id="xyz" where id="1";
rollback;

start transaction;
insert into wallet values('2','2','4','10','10','100.00','100.00','mno',
'pqr','stu','vwx','6','2018-01-01 00:00:05','2018-01-01 00:00:05','10','2018-01-01 00:00:05');
insert into transaction values('2','2','3','100.00','100.00','mno',
'pqr','stu','6','2018-01-01 00:00:05','2018-01-01 00:00:05','done');
savepoint a;
update wallet set transaction_id="xyz" where id="2";
update transaction set transaction_id="xyz" where id="2";
rollback to savepoint a;


CREATE USER 'akshay'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON * . * TO 'akshay'@'%';
revoke ALL PRIVILEGES ON * . * from 'akshay'@'%';
REVOKE  delete ON *.* FROM 'akshay'@'%';



grant select,insert,update,delete ON customer_wallet TO 'akshay';

REVOKE DELETE ON customer_wallet FROM akshay;


select* from wallet;



insert into wallet values('2','2','4','10','10','100.00','100.00','mno',
'pqr','stu','vwx','6','2018-01-01 00:00:05','2018-01-01 00:00:05','10','2018-01-01 00:00:05');

insert into wallet values('3','2','4','10','10','100.00','100.00','qqq',
'ppp','sss','vvv','6','2018-01-01 00:00:05','2018-01-01 00:00:05','10','2018-01-01 00:00:05');
insert into wallet values('4','2','4','10','10','100.00','100.00','nnn',
'qqq','ttt','xxx','6','2018-01-01 00:00:05','2018-01-01 00:00:05','10','2018-01-01 00:00:05');

delete from wallet where id=1;
select * from wallet;
delete from wallet;

select *from wallet;

update wallet set sid=4;

rename table wallet to customer_wallet;
select * from customer_wallet;
