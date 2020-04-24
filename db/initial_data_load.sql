-- load initial data for product table
-- assuming its a book store
insert into product (product_name)
select 'Python for Dummies'
from dual
where not exists (select 1 from product where product_name = 'Python for Dummies');

insert into product (product_name)
select 'Flask APIs for Dummies'
from dual
where not exists (select 1 from product where product_name = 'Flask APIs for Dummies');

insert into product (product_name)
select 'MySQL for Dummies'
from dual
where not exists (select 1 from product where product_name = 'MySQL for Dummies');

-- load initial data for client table
insert into `client` (client_name)
select 'Bill Gates'
from dual
where not exists (select 1 from `client` where client_name = 'Bill Gates');

insert into `client` (client_name, city)
select 'George Bush'
	,'Washington'
from dual
where not exists (select 1 from `client` where client_name = 'George Bush');

insert into `client` (client_name, mobile_phone, email_address, city)
select 'Barack Obama'
	,4990000001
    ,'president@usa.com'
	,'Washington'
from dual
where not exists (select 1 from `client` where client_name = 'Barack Obama');

-- load initial data for sales table
-- 'INV-001'
insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-001'
	,(Select client_id from client where client_name = 'George Bush')
    ,(Select product_id from product where product_name = 'MySQL for Dummies')
    ,now()
    ,1
    ,36
    ,36
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-001'
                    and product_id = (Select product_id from product where product_name = 'MySQL for Dummies')
				);


-- 'INV-002'
insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-002'
	,(Select client_id from client where client_name = 'Bill Gates')
    ,(Select product_id from product where product_name = 'Python for Dummies')
    ,now()
    ,1
    ,36
    ,36
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-002'
                    and product_id = (Select product_id from product where product_name = 'Python for Dummies')
				);

insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-002'
	,(Select client_id from client where client_name = 'Bill Gates')
    ,(Select product_id from product where product_name = 'Flask APIs for Dummies')
    ,now()
    ,1
    ,52
    ,52
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-002'
                    and product_id = (Select product_id from product where product_name = 'Flask APIs for Dummies')
				);

-- 'INV-003'
insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-003'
	,(Select client_id from client where client_name = 'Barack Obama')
    ,(Select product_id from product where product_name = 'Python for Dummies')
    ,now()
    ,2
    ,36
    ,72
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-003'
                    and product_id = (Select product_id from product where product_name = 'Python for Dummies')
				);

 insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-003'
	,(Select client_id from client where client_name = 'Barack Obama')
    ,(Select product_id from product where product_name = 'Flask APIs for Dummies')
    ,now()
    ,3
    ,52
    ,156
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-003'
                    and product_id = (Select product_id from product where product_name = 'Flask APIs for Dummies')
				);

 insert into `sales` (invoice_number, client_id, product_id, sales_date, quantity, unit_price, row_total)
select 'INV-003'
	,(Select client_id from client where client_name = 'Barack Obama')
    ,(Select product_id from product where product_name = 'MySQL for Dummies')
    ,now()
    ,1
    ,36
    ,36
from dual
where not exists (select 1
					from `sales`
                    where invoice_number = 'INV-003'
                    and product_id = (Select product_id from product where product_name = 'MySQL for Dummies')
				);


-- load initial data for user table
insert into app_user (user_name, login_id, hashed_password)
select 'Bill Gates'
	,'bill.g@mydomain.com'
    ,'dfsdfdsfdsf'
from dual
where not exists (select 1 from app_user where login_id = 'bill.g@mydomain.com');

insert into app_user (user_name, login_id, hashed_password)
select 'Jeff Bezos'
	,'jeff.b@mydomain.com'
    ,'xcczxczxc'
from dual
where not exists (select 1 from app_user where login_id = 'jeff.b@mydomain.com');
     
