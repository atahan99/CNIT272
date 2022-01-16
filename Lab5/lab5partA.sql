/*
Atahan Kucuk
CNIT 272 Fall 2020

*/
--Question 1:
select *
from lunch_item
where lunch_id IN (select lunch_id
from lunch
where lunch_date = '15-AUG-2019')
order by lunch_id ; 

/*
 LUNCH_ID ITEM_NUMBER SUP PR   QUANTITY
---------- ----------- --- -- ----------
        34           1 Lss Sw          2
        34           2 Lss Sp          2
        35           1 Hsd Ds          2
        35           2 Gls Br          2
        36           2 Jd6 Cf          2
        36           1 Jd6 Ds          2
        36           3 Lss Sw          2
        37           1 Crm Hb          3
        37           3 Crm Br          2
        37           2 Jmd Vr          4
        38           1 Hsd Sp          3

  LUNCH_ID ITEM_NUMBER SUP PR   QUANTITY
---------- ----------- --- -- ----------
        38           2 Jd6 Vr          2
        39           1 Crm Ps          2
        39           2 Jd6 Vr          2
        39           3 Foi Ff          2
        40           1 Hsd Cs          2
        40           2 Jmd Vr          2
        41           1 Dpz Pz          3
        41           2 Dpz Br          3
        41           3 Jd6 Vr          2

20 rows selected. 

*/
--Question 2 
select supplier_id, supplier_name
from food_supplier
where supplier_id NOT IN (select supplier_id
from food); 
/*

SUP SUPPLIER_NAME                 
--- ------------------------------
Fas Fiona and Samson              
Gio Gio and Sons                  
Har Harman Bakery                 
Rby Rosemont Bakery               

*/
--Question 3
set linesize 200;
select WO.worker_id, last_name, dept_code, lunch_id,lunch_date
from worker WO   inner join lunch LU 
on WO.worker_id = LU.worker_id
where lunch_date between '1-JUL-2019' and '31-JUL-2019'
order by lunch_date;


/*
WOR LAST_NAME            DEP   LUNCH_ID LUNCH_DAT
--- -------------------- --- ---------- ---------
214 Young                             3 22-JUL-19
228 Cross                Acc          5 22-JUL-19
230 Harney               Tch          1 22-JUL-19
210 Kingman              Sal          6 22-JUL-19
208 Armstrong            Pur          4 22-JUL-19
203 Gradle               Leg          2 22-JUL-19
223 Martin               Sal         12 27-JUL-19
210 Kingman              Sal         10 27-JUL-19
219 White                Aud         11 27-JUL-19
215 Sumner               Fin          9 27-JUL-19
214 Young                            13 27-JUL-19

WOR LAST_NAME            DEP   LUNCH_ID LUNCH_DAT
--- -------------------- --- ---------- ---------
201 Reynolds             Exe          8 27-JUL-19
201 Reynolds             Exe          7 27-JUL-19

13 rows selected. 

*/
--Question 4 A
set linesize 200
select WO.worker_id, last_name,city, dept_code, lunch_id,lunch_date
from worker WO   inner join lunch LU 
on WO.worker_id = LU.worker_id
where city = 'Skokie' or city = 'Naperville';

/*

WOR LAST_NAME            CITY                           DEP   LUNCH_ID LUNCH_DAT
--- -------------------- ------------------------------ --- ---------- ---------
203 Gradle               Skokie                         Leg          2 22-JUL-19
203 Gradle               Skokie                         Leg         35 15-AUG-19
214 Young                Skokie                                      3 22-JUL-19
214 Young                Skokie                                     13 27-JUL-19
218 Johnson              Naperville                                 39 15-AUG-19
218 Johnson              Naperville                                 25 07-AUG-19
222 Jones                Naperville                     Tch         30 10-AUG-19
222 Jones                Naperville                     Tch         47 22-AUG-19
222 Jones                Naperville                     Tch         43 20-AUG-19
223 Martin               Skokie                         Sal         12 27-JUL-19
228 Cross                Naperville                     Acc         24 03-AUG-19

WOR LAST_NAME            CITY                           DEP   LUNCH_ID LUNCH_DAT
--- -------------------- ------------------------------ --- ---------- ---------
228 Cross                Naperville                     Acc         41 15-AUG-19
228 Cross                Naperville                     Acc          5 22-JUL-19

13 rows selected. 

*/

--Quesstion 4 B
set linesize 200
select DISTINCT WO.worker_id, last_name,city, De.dept_code, department_name, lunch_id,lunch_date, item_number, supplier_id, product_code
from worker WO   inner join lunch LU 
on WO.worker_id = LU.worker_id
inner join department DE 
on de.dept_code = wo.dept_code
where city = 'Skokie' or city = 'Naperville';
/*
WOR LAST_NAME            CITY                           DEP DEPARTMENT_NAME                  LUNCH_ID LUNCH_DAT
--- -------------------- ------------------------------ --- ------------------------------ ---------- ---------
203 Gradle               Skokie                         Leg Legal                                   2 22-JUL-19
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19
228 Cross                Naperville                     Acc Accounting                             24 03-AUG-19
222 Jones                Naperville                     Tch Technology                             30 10-AUG-19
203 Gradle               Skokie                         Leg Legal                                  35 15-AUG-19
228 Cross                Naperville                     Acc Accounting                             41 15-AUG-19
222 Jones                Naperville                     Tch Technology                             43 20-AUG-19
222 Jones                Naperville                     Tch Technology                             47 22-AUG-19

9 rows selected. 
*/

--Question 4 C
set linesize 200
select DISTINCT WO.worker_id, last_name,city, De.dept_code, department_name, Lu.lunch_id,lunch_date , item_number, supplier_id, product_code
from worker WO   inner join lunch LU 
on WO.worker_id = LU.worker_id
inner join department DE 
on de.dept_code = wo.dept_code
inner join Lunch_item LUI
on lu.lunch_id = lui.lunch_id
where city = 'Skokie' or city = 'Naperville';



/*

WOR LAST_NAME            CITY                           DEP DEPARTMENT_NAME                  LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR
--- -------------------- ------------------------------ --- ------------------------------ ---------- --------- ----------- --- --
203 Gradle               Skokie                         Leg Legal                                   2 22-JUL-19           2 Foi Ff
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19           1 Hsd Cs
228 Cross                Naperville                     Acc Accounting                             41 15-AUG-19           1 Dpz Pz
222 Jones                Naperville                     Tch Technology                             47 22-AUG-19           2 Lak Sd
222 Jones                Naperville                     Tch Technology                             47 22-AUG-19           3 Lak Br
203 Gradle               Skokie                         Leg Legal                                   2 22-JUL-19           4 Hsd Ds
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19           3 Foi Sp
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19           2 Crm Sw
222 Jones                Naperville                     Tch Technology                             30 10-AUG-19           1 Crm Ps
222 Jones                Naperville                     Tch Technology                             43 20-AUG-19           3 Jd6 Vr
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19           1 Hsd Sp

WOR LAST_NAME            CITY                           DEP DEPARTMENT_NAME                  LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR
--- -------------------- ------------------------------ --- ------------------------------ ---------- --------- ----------- --- --
222 Jones                Naperville                     Tch Technology                             30 10-AUG-19           2 Lss Sp
222 Jones                Naperville                     Tch Technology                             43 20-AUG-19           1 Ard Pz
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19           4 Jd6 Cf
203 Gradle               Skokie                         Leg Legal                                  35 15-AUG-19           1 Hsd Ds
222 Jones                Naperville                     Tch Technology                             47 22-AUG-19           4 Gls Ds
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19           2 Crm Hb
203 Gradle               Skokie                         Leg Legal                                   2 22-JUL-19           1 Jmd Pz
228 Cross                Naperville                     Acc Accounting                              5 22-JUL-19           5 Hsd Ds
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19           4 Jd6 Vr
228 Cross                Naperville                     Acc Accounting                             41 15-AUG-19           2 Dpz Br
228 Cross                Naperville                     Acc Accounting                             41 15-AUG-19           3 Jd6 Vr

WOR LAST_NAME            CITY                           DEP DEPARTMENT_NAME                  LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR
--- -------------------- ------------------------------ --- ------------------------------ ---------- --------- ----------- --- --
222 Jones                Naperville                     Tch Technology                             43 20-AUG-19           2 Dpz Br
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19           3 Crm Hb
203 Gradle               Skokie                         Leg Legal                                  35 15-AUG-19           2 Gls Br
203 Gradle               Skokie                         Leg Legal                                   2 22-JUL-19           3 Jd6 Vr
223 Martin               Skokie                         Sal Sales                                  12 27-JUL-19           5 Foi Ds
222 Jones                Naperville                     Tch Technology                             47 22-AUG-19           1 Lak Sw

28 rows selected. 

*/

--Question 5 A
select distinct sum(lunch_id) as LUNCH_COUNT, to_char(lunch_date, 'MON-YYYY') AS MONTH
FROM lunch
GROUP BY to_char(lunch_date, 'MON-YYYY');

/*

LUNCH_COUNT MONTH   
----------- --------
       1037 AUG-2019
         91 JUL-2019

*/

--Question 5 B
select  sum(lu.lunch_id) as LUNCH_COUNT, to_char(lu.lunch_date, 'MON-YYYY') AS MONTH , wo.dept_code
FROM lunch LU inner join worker WO
on wo.worker_id = lu.worker_id
GROUP BY to_char(lu.lunch_date, 'MON-YYYY'), wo.dept_code;


/*

LUNCH_COUNT MONTH    DEP
----------- -------- ---
         17 AUG-2019 Aud
         11 JUL-2019 Aud
         92 AUG-2019 Acc
          9 JUL-2019 Fin
         16 AUG-2019 Pur
         28 JUL-2019 Sal
          1 JUL-2019 Tch
         15 JUL-2019 Exe
          2 JUL-2019 Leg
        291 AUG-2019 Tch
         16 JUL-2019    

LUNCH_COUNT MONTH    DEP
----------- -------- ---
         76 AUG-2019 Exe
        127 AUG-2019 Leg
         26 AUG-2019 Srv
          5 JUL-2019 Acc
         83 AUG-2019 Fin
        239 AUG-2019    
          4 JUL-2019 Pur
         70 AUG-2019 Hmn

19 rows selected. 

*/

--Question 6 A

col TOTAL format $999.99;
col SUPPLYCCOUNT format a15;
select fs.supplier_id, supplier_name, supplier_city, sum(price)as TOTAL , count(quantity) as SUPPLYCOUNT
from food f inner join lunch_item lui
on f.supplier_id = lui.supplier_id
and f.product_code = lui.product_code
inner join food_supplier fs
on fs.supplier_id = f.supplier_id
group by fs.supplier_id, supplier_name, supplier_city;

/*
SUP SUPPLIER_NAME                  SUPPLIER_CITY                     TOTAL SUPPLYCOUNT
--- ------------------------------ ------------------------------ -------- -----------
Ard Arnoldo Deli                   Oak Brook                        $12.60           2
Blu Blue Sky Deli                  Skokie                           $13.13           2
Crm Corner Market                  Naperville                      $202.89          23
Dpz Downtowner Pizza               Chicago                          $20.49           7
Foi Fontinas Italian               Chicago                          $53.61          16
Gls Great Lakes Station            Skokie                           $13.91           5
Hsd Halsted Street Deli            Naperville                      $143.46          28
Jd6 Justin's Deli at 601           Oak Brook                        $84.25          29
Jmd Jebston Montrose Deli          Chicago                          $47.43          10
Lak Lakeshore Bakery               Chicago                          $13.45           3
Lss Lucias Sub Shop                Aurora                           $35.45           5

11 rows selected. 


*/

--Question 6 B 

col TOTAL format $999.99;
col SUPPLYCCOUNT format a15;
select fs.supplier_id, supplier_name, supplier_city, sum(price)as TOTAL , count(quantity) as SUPPLYCOUNT
from food f inner join lunch_item lui
on f.supplier_id = lui.supplier_id
and f.product_code = lui.product_code
inner join food_supplier fs
on fs.supplier_id = f.supplier_id
group by fs.supplier_id, supplier_name, supplier_city
having sum(price) > 50 ; 

/*

SUP SUPPLIER_NAME                  SUPPLIER_CITY                     TOTAL SUPPLYCOUNT
--- ------------------------------ ------------------------------ -------- -----------
Hsd Halsted Street Deli            Naperville                      $143.46          28
Crm Corner Market                  Naperville                      $202.89          23
Jd6 Justin's Deli at 601           Oak Brook                        $84.25          29
Foi Fontinas Italian               Chicago                          $53.61          16


*/






























































