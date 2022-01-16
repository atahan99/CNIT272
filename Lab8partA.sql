/*
Atahan Kucuk
CNIT 272 Fall 2020

*/
--Question 1
select supplier_ID
from food_supplier
where supplier_id = 'Sky'
-------------
insert into food_supplier (supplier_id, supplier_name, supplier_city) values ('Sky', 'Sky Rise Market', 'Chicago');
-------------
insert into food (supplier_id, product_code, menu_item, description, price, price_upcharge) values ('Sky', 'Sp', 2 , 'Broccoli Soup', 4.75 , .6 );
-----------------
insert into food (supplier_id, product_code, menu_item, description, price, price_upcharge) values ('Sky', 'St', 8 , 'Beef Ribeye Steak', 15.00 , .8 );
-----------------
select f.supplier_id, supplier_name, product_code, price
from food f inner join food_supplier fs
on f.supplier_id = fs.supplier_id
where f.supplier_id = 'Sky';
/*
SUP SUPPLIER_NAME                  PR      PRICE
--- ------------------------------ -- ----------
Sky Sky Rise Market                Sp       4.75
Sky Sky Rise Market                St         15
*/
--Question 2
select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id = 'Hsd';
/*

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Hsd Halsted Street Deli            Naperville                    


*/
update food_supplier
set supplier_name = 'Hanover Market'
where supplier_id = 'Hsd';
update food_supplier
set supplier_city = 'Skokie'
where supplier_id = 'Hsd';
---
COMMIT;
----
select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id = 'Hsd';
/*

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Hsd Hanover Market                 Skokie                        

*/
--Question 3
select supplier_id, description, price
from food
where product_code = 'Sp';
/*

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Foi Barley Soup                4.73
Hsd Chicken Soup               4.73
Jmd Potato Soup                6.83
Lss Veggie Soup                 5.2
Sky Broccoli Soup              4.75

*/
update food
set price = 6.73
where supplier_id in ('Foi', 'Hsd') and product_code = 'Sp';
update food
set price = 8.83
where supplier_id = 'Jmd' and product_code = 'Sp';
update food
set price = 7.2
where supplier_id = 'Lss' and product_code = 'Sp';
update food
set price = 6.75
where supplier_id = 'Sky' and product_code = 'Sp';
-----
select supplier_id, description, price
from food
where product_code = 'Sp';
/*
SUP DESCRIPTION               PRICE
--- -------------------- ----------
Foi Barley Soup                6.73
Hsd Chicken Soup               6.73
Jmd Potato Soup                8.83
Lss Veggie Soup                 7.2
Sky Broccoli Soup              6.75


*/
--Question 4 part A
select worker_id
from lunch 
where worker_id = 231
/*

WOR
---
231
231
*/
insert into lunch (lunch_id, lunch_date, worker_id) values (48,  '12-JAN-2020' ,231);
--------
select *
from lunch
where worker_id = 231;
/*
  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
        48 12-JAN-20 231
        18 01-AUG-19 231
        42 20-AUG-19 231


*/
--Question 4 part B
insert into lunch_item(lunch_id, product_code, item_number, quantity) values(48,'St',8,1);
insert into lunch_item(lunch_id, product_code, item_number, quantity) values(48, 'Sp', 6 , 3);
insert into lunch_item(lunch_id, product_code, item_number, quantity) values(48, 'Pz',7,5);
----
select worker_id, l.lunch_id,lunch_date, item_number, supplier_id,product_code,quantity
from lunch l inner join lunch_item lui
on l.lunch_id = lui.lunch_id
where l.worker_id = 231;
/*

WOR   LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR   QUANTITY
--- ---------- --------- ----------- --- -- ----------
231         18 01-AUG-19           1 Hsd Cs          2
231         18 01-AUG-19           2 Jmd Vr          2
231         42 20-AUG-19           3 Jd6 Vr          2
231         42 20-AUG-19           2 Crm Ps          2
231         42 20-AUG-19           1 Hsd Cs          3
231         48 12-JAN-20           8     St          1
231         48 12-JAN-20           6     Sp          3
231         48 12-JAN-20           7     Pz          5

8 rows selected. 



*/
Rollback;
--Question 4 part C
--3 lunch items 
select * 
from lunch_item
where lunch_id = 48;
-- lunch
select *
from lunch
where lunch_id = 48;
--Q3 price 
select supplier_id, description, price
from food
where product_code = 'Sp';
/*


SUP DESCRIPTION               PRICE
--- -------------------- ----------
Foi Barley Soup                4.73
Hsd Chicken Soup               4.73
Jmd Potato Soup                6.83
Lss Veggie Soup                 5.2
Sky Broccoli Soup              4.75

*/
--Q2 not rolled back 
select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id = 'Hsd';
/*

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Hsd Hanover Market                 Skokie       
*/
--Q1 not rolled back
select f.supplier_id, supplier_name, product_code, price
from food f inner join food_supplier fs
on f.supplier_id = fs.supplier_id
where f.supplier_id = 'Sky';
/*
SUP SUPPLIER_NAME                  PR      PRICE
--- ------------------------------ -- ----------
Sky Sky Rise Market                Sp       4.75
Sky Sky Rise Market                St         15
*/
--Question 5
select supplier_id, supplier_name
from food_supplier
where supplier_id not in (select supplier_id 
from food)
/*

SUP SUPPLIER_NAME                 
--- ------------------------------
Fas Fiona and Samson              
Gio Gio and Sons                  
Har Harman Bakery                 
Rby Rosemont Bakery  

*/
delete from food_supplier where supplier_id = 'Fas';
delete from food_supplier where supplier_id = 'Gio';
delete from food_supplier where supplier_id = 'Har';
delete from food_supplier where supplier_id = 'Rby';
/*

1 row deleted.


1 row deleted.


1 row deleted.


1 row deleted.

*/
select supplier_id, supplier_name
from food_supplier
where supplier_id not in (select supplier_id 
from food)
/*
no rows selected


*/
select *
from food_supplier;
/*
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Oak Brook                     
Hsd Hanover Market                 Skokie                        
Crm Corner Market                  Naperville                    
Foi Fontinas Italian               Chicago                       
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
Lss Lucias Sub Shop                Aurora                        
Dpz Downtowner Pizza               Chicago                       
Gls Great Lakes Station            Skokie                        
Blu Blue Sky Deli                  Skokie                        
Lak Lakeshore Bakery               Chicago                       

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Sky Sky Rise Market                Chicago                       

12 rows selected. 


*/
--Question 6
create table EmpComp (
Worker_ID char(3),
Comp_Date date,
Comp_Limit Number(5,2),
Participants VarChar2(100),
CONSTRAINT EmpComp_PK primary key (Worker_ID, Comp_Date)
)
/*
Table EMPCOMP created.
*/
alter table EmpComp
add constraint EmpComp_Fk foreign key (Worker_ID) references Worker (Worker_ID);
/*
Table EMPCOMP altered.

*/
insert into EmpComp
Select worker_id, sysdate, (credit_limit+credit_limit*.4), null
From worker
where dept_code = 'Sal';
/*
2 rows inserted.

*/
commit;
----
select w.worker_id, dept_code, credit_limit, comp_limit
from worker w inner join EmpComp ec
on w.worker_id = ec.worker_id
/*
WOR DEP CREDIT_LIMIT COMP_LIMIT
--- --- ------------ ----------
210 Sal           33       46.2
223 Sal           20         28

*/



















