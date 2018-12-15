create table sales_order
(entity_id int(10) unsigned NOT NULL auto_increment comment "Entity Id",
 state varchar(32) comment "State",
 `status` varchar(32) comment "Status",
 coupon_code varchar(255) comment "Coupon Code",
 protect_code varchar(255) comment "Protect Code",
 shipping_description varchar(255) comment "Shipping Description",
 is_virtual smallint(5) unsigned comment "Is Virtual",
 store_id smallint(5) unsigned comment "Store Id",
 customer_id int(10) unsigned comment "Customer Id",
 base_discount_amount decimal(12,4) comment "Base Discount Amount",
 base_discount_canceled decimal(12,4) comment "Base Discount Canceled",
 base_discount_invoiced decimal(12,4) comment "Base Discount Invoiced",
 base_discount_refunded decimal(12,4) comment "Base Discount Refunded",
 base_grand_total decimal(12,4) comment "Base Grand Total",
 base_shipping_amount decimal(12,4) comment "Base Shipping Amount",
 base_shipping_canceled decimal(12,4) comment "Base Shipping Canceled",
 base_shipping_invoiced decimal(12,4) comment "Base Shipping Invoiced",
 base_shipping_refunded decimal(12,4) comment "Base Shipping Refunded",
 base_shipping_tax_amount decimal(12,4) comment "Base Shipping Tax Amount",
 base_shipping_tax_refunded decimal(12,4) comment "Base Shipping Tax Refunded",
 base_subtotal decimal(12,4) comment "Base Subtotal",
 base_subtotal_canceled decimal(12,4) comment "Base Subtotal Canceled",
 base_subtotal_invoiced decimal(12,4) comment "Base Subtotal Invoiced",
 base_subtotal_refunded decimal(12,4) comment "Base Subtotal Refunded",
 base_tax_amount decimal(12,4) comment "Base Tax Amount",
 base_tax_canceled decimal(12,4) comment "Base Tax Canceled",
 base_tax_invoiced decimal(12,4) comment "Base Tax Invoiced",
 base_tax_refunded decimal(12,4) comment "Base Tax Refunded",
 base_to_global_rate decimal(12,4) comment "Base To Global Rate",
 base_to_order_rate decimal(12,4) comment "Base To Order Cate",
 base_total_canceled decimal(12,4) comment "Base Total Canceled",
 base_total_invoiced decimal(12,4) comment "Base Total Invoiced",
 base_total_invoiced_cost decimal(12,4) comment "Base Total Invoiced Cost",
 base_total_offline_refunded decimal(12,4) comment "Base Total Offline Refunded",
 base_total_online_refunded decimal(12,4) comment "Base Total Online Refunded",
 base_total_paid decimal(12,4) comment "Base_Total_Paid",
 base_total_qty_ordered decimal(12,4) comment "Base_Total_Qty_Ordered",
 base_total_refunded decimal(12,4) comment "Base_Total_Refunded",
 discount_amount decimal(12,4) comment "Discount_Amount",
 discount_canceled decimal(12,4) comment "Discount_Canceled",
 discount_invoiced decimal(12,4) comment "Discount_Invoiced",
 discount_refunded decimal(12,4) comment "Discount_Refunded",
 grand_total decimal(12,4) comment "Grand_Total",
 created_at timestamp not null default current_timestamp comment "Created_At",
 updated_at timestamp not null default current_timestamp comment "Updated_At",
 
 
PRIMARY KEY(`entity_id`));



describe sales_order;

create table sales_order_item(
item_id int(10) unsigned NOT NULL auto_increment,
order_id int(10) unsigned NOT NULL,
store_id smallint(5)  unsigned,
parent_item_id int(10) unsigned,
quote_item_id int(10) unsigned,

created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update CURRENT_TIMESTAMP,
product_id int(10) unsigned,
product_type varchar(255),
product_options text,
weight decimal(12,4),
is_virtual int(10) unsigned,
sku int(10) unsigned,
`name` int(10) unsigned,
description text,
applied_rule_ids text,
additional_data text,
is_qty_decimal smallint(5) unsigned,
no_discount smallint(5) unsigned not null,
qty_backordered decimal(12,4),
qty_canceled decimal(12,4),
qty_invoiced decimal(12,4),
qty_ordered decimal(12,4),
qty_refunded decimal(12,4),
qty_shipped decimal(12,4),
base_cost decimal(12,4),
price decimal(12,4) not null,
base_price decimal(12,4) not null,
original_price decimal(12,4),
base_original_price decimal(12,4),
tax_percent decimal(12,4),
tax_amount decimal(12,4),

foreign key(`order_id`) references sales_order(entity_id),
PRIMARY KEY(`item_id`)

);
alter table sales_order_item add column(
   subscription_info int(11),subscription_type text,no_of_days text);
   CREATE TABLE `sales`.`st` (
  `a1` INT NOT NULL AUTO_INCREMENT,
  `a2` VARCHAR(20) NULL,
  `a3` DECIMAL(10,4) NULL COMMENT 'third column',
  PRIMARY KEY (`a1`));
   


alter table sales_order_item drop foreign key sales_order_item_ibfk_1;

alter table sales_order_item add foreign key(`order_id`) references sales_order(entity_id);


insert into sales_order values('1','karnataka','success','A00','Z00','Banglore','12','123','1234',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','2018-01-01 00:00:01','2018-01-01 00:00:01');
     select * from sales_order;    
     insert into sales_order_item values('1','1','12','12','12','2018-01-01 00:00:01','2018-01-01 00:00:01','4','hello2','hii','123.3',
                                   '100','2','2','hiii','hii','hii','100',
                                   '100','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100.00','100.00','100.00','100.00','100.00','100.00','100.00',
                                   '100','end','end');
select * from sales_order_item;

update sales_order set updated_at=default where entity_id=1;
select*from sales_order;