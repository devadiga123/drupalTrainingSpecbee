select c.mccsid as Mccsid, c.`name` as Customer_name,c.mobile as Mobile,a.`name` as Apartment,b.`name` as `Block`,
f.`name` as Flat,c.created as Start_Date,c.referral_contact as Referal_Contact,from_unixtime(w.created) as Last_Recharge,w.total as Wallet_Total
from mcart_customers as c 
inner join mc_apartment as a on c.acode=a.id 
inner join mc_block as b on c.bcode=b.id
inner join mc_flat as f on c.fcode=f.id
inner join mcart_wallet as w on c.mccsid=w.mccsid
 where w.id in (select max(id) from mcart_wallet
                             group by mccsid);

select total as Wallet_total, mccsid from mcart_wallet where id in 
(select max(id) from mcart_wallet group by mccsid);

select mccsid,sum(amount)from mcart_wallet 
group by mccsid;

select case 
when transaction_type="Recharge" 
then "Success" else  
transaction_type end from mcart_wallet;


select ms.id as subscriptions_Id, ms.mccsid as Mccsid, c.mobile as Mobile,c.`name` as Lable,ms.product_id as Product_Id,
ms.subscription_type as Subscrition_type,ms.amount as Subscrition_Amount,ms.quantity as Subscription_Quantity,a.`name` as Apartment,
b.`name` as `Block`,f.`name` as Flat,ms.start_date as Subscrition_Start_Date,ms.end_date as Subscrition_End_Date,
ms.stop_date as Subscrition_Stop_Date,ms.resume_date as Subscrition_Resume_Date,ms.created as Subscrition_Created_Date,
ms.`status` as Subscrition_Status from mcart_subscriptions as ms
inner join mcart_customers as c on ms.mccsid=c.mccsid
inner join  mc_apartment as a on c.acode=a.id
inner join  mc_block as b on c.bcode=b.id
inner join mc_flat as f on c.fcode=f.id;

select c.`name` as  `name`,c.mobile as mobile,d.pid as ProductId,s.subscription_type as SubscriptionType,
d.quantity  as productQuantity,d.amount as PraductAmount,d.delivery_date as productDeliveryDate,
dr.mobile_number as DistributorMobileNumber,dr.`name` as DistributorName,db.mobile_number as distributorMobileNumber,
db.`name` as deliveryboyName,c.acode as mcartBlock,a.`name` as appartment,c.bcode as mcartblockId,
b.`name` as `block`,c.fcode as mcartflatId,f.`name` as flat
from mc_distribution as d inner join mcart_customers as c on d.mccsid=c.mccsid
inner join mcart_subscriptions as s on s.mccsid=c.mccsid
inner join mc_distributors as dr on d.mcdid=dr.id
inner join mc_delivery_boys as db on d.mcdbid=db.id
inner join mc_apartment as a on c.acode=a.id
inner join mc_block as b on c.bcode=b.id
inner join mc_flat as f on c.fcode=f.id;