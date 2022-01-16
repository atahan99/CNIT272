/*
Atahan Kucuk
CNIT 272 Fall 2020

*/

--Question 1 A
Describe user_tables
/*
Name                      Null?    Type           
------------------------- -------- -------------- 
TABLE_NAME                NOT NULL VARCHAR2(128)  
TABLESPACE_NAME                    VARCHAR2(30)   
CLUSTER_NAME                       VARCHAR2(128)  
IOT_NAME                           VARCHAR2(128)  
STATUS                             VARCHAR2(8)    
PCT_FREE                           NUMBER         
PCT_USED                           NUMBER         
INI_TRANS                          NUMBER         
MAX_TRANS                          NUMBER         
INITIAL_EXTENT                     NUMBER         
NEXT_EXTENT                        NUMBER         
MIN_EXTENTS                        NUMBER         
MAX_EXTENTS                        NUMBER         
PCT_INCREASE                       NUMBER         
FREELISTS                          NUMBER         
FREELIST_GROUPS                    NUMBER         
LOGGING                            VARCHAR2(3)    
BACKED_UP                          VARCHAR2(1)    
NUM_ROWS                           NUMBER         
BLOCKS                             NUMBER         
EMPTY_BLOCKS                       NUMBER         
AVG_SPACE                          NUMBER         
CHAIN_CNT                          NUMBER         
AVG_ROW_LEN                        NUMBER         
AVG_SPACE_FREELIST_BLOCKS          NUMBER         
NUM_FREELIST_BLOCKS                NUMBER         
DEGREE                             VARCHAR2(10)   
INSTANCES                          VARCHAR2(10)   
CACHE                              VARCHAR2(5)    
TABLE_LOCK                         VARCHAR2(8)    
SAMPLE_SIZE                        NUMBER         
LAST_ANALYZED                      DATE           
PARTITIONED                        VARCHAR2(3)    
IOT_TYPE                           VARCHAR2(12)   
TEMPORARY                          VARCHAR2(1)    
SECONDARY                          VARCHAR2(1)    
NESTED                             VARCHAR2(3)    
BUFFER_POOL                        VARCHAR2(7)    
FLASH_CACHE                        VARCHAR2(7)    
CELL_FLASH_CACHE                   VARCHAR2(7)    
ROW_MOVEMENT                       VARCHAR2(8)    
GLOBAL_STATS                       VARCHAR2(3)    
USER_STATS                         VARCHAR2(3)    
DURATION                           VARCHAR2(15)   
SKIP_CORRUPT                       VARCHAR2(8)    
MONITORING                         VARCHAR2(3)    
CLUSTER_OWNER                      VARCHAR2(128)  
DEPENDENCIES                       VARCHAR2(8)    
COMPRESSION                        VARCHAR2(8)    
COMPRESS_FOR                       VARCHAR2(30)   
DROPPED                            VARCHAR2(3)    
READ_ONLY                          VARCHAR2(3)    
SEGMENT_CREATED                    VARCHAR2(3)    
RESULT_CACHE                       VARCHAR2(7)    
CLUSTERING                         VARCHAR2(3)    
ACTIVITY_TRACKING                  VARCHAR2(23)   
DML_TIMESTAMP                      VARCHAR2(25)   
HAS_IDENTITY                       VARCHAR2(3)    
CONTAINER_DATA                     VARCHAR2(3)    
INMEMORY                           VARCHAR2(8)    
INMEMORY_PRIORITY                  VARCHAR2(8)    
INMEMORY_DISTRIBUTE                VARCHAR2(15)   
INMEMORY_COMPRESSION               VARCHAR2(17)   
INMEMORY_DUPLICATE                 VARCHAR2(13)   
DEFAULT_COLLATION                  VARCHAR2(100)  
DUPLICATED                         VARCHAR2(1)    
SHARDED                            VARCHAR2(1)    
EXTERNAL                           VARCHAR2(3)    
CELLMEMORY                         VARCHAR2(24)   
CONTAINERS_DEFAULT                 VARCHAR2(3)    
CONTAINER_MAP                      VARCHAR2(3)    
EXTENDED_DATA_LINK                 VARCHAR2(3)    
EXTENDED_DATA_LINK_MAP             VARCHAR2(3)    
INMEMORY_SERVICE                   VARCHAR2(12)   
INMEMORY_SERVICE_NAME              VARCHAR2(1000) 
CONTAINER_MAP_OBJECT               VARCHAR2(3)    
*/

-- Question 1B
SELECT table_name 
from user_tables;
/*
TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
BILLOFMATERIALS
CATEGORY
CUSTOMER
CUSTORDER
CUSTORDERLINE
DEPARTMENT
EMPLOYEE
FOOD
FOOD_SUPPLIER
INVENTORYPART
LUNCH

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
LUNCH_ITEM
MACHINE
MACHINEPROCESS
OPERATION
PACKINGSLIP
PROCESS
PROCESSROUTING
PURCHASEORDER
PURCHORDERLINE
SHIPMENT
SHIPPEDITEM

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
SHIPPER
SUPPLIEDPART
SUPPLIER
TIMECARDLINE
WORKER

27 rows selected. 
*/

-- Question 2 A
set linesize 200;
select (round (476.74729)),(round(476.74729,2)),(round(476.74729,-1))
from dual;
/*
(ROUND(476.74729)) (ROUND(476.74729,2)) (ROUND(476.74729,-1))
------------------ -------------------- ---------------------
               477               476.75                   480
*/

--Question 2 B
set linesize 200;
select (trunc (476.74729)),(trunc(476.74729,2)),(trunc(476.74729,-1))
from dual;

/*
(TRUNC(476.74729)) (TRUNC(476.74729,2)) (TRUNC(476.74729,-1))
------------------ -------------------- ---------------------
               476               476.74                   470

*/

--Question 3
set linesize 200;
COL CITY FORMAT a15;
select supplier_name,LENGTH(Supplier_name)AS SN_LENGTH,UPPER(supplier_city) AS CITY
from food_supplier
where supplier_city IN ('Orland Park','Chicago','Aurora');
/*

SUPPLIER_NAME                   SN_LENGTH CITY           
------------------------------ ---------- ---------------
Fontinas Italian                       16 CHICAGO        
Fiona and Samson                       16 ORLAND PARK    
Jebston Montrose Deli                  21 CHICAGO        
Lucias Sub Shop                        15 AURORA         
Downtowner Pizza                       16 CHICAGO        
Gio and Sons                           12 CHICAGO        
Lakeshore Bakery                       16 CHICAGO        

7 rows selected. 
*/

--Question 4
select supplier_id, description, TO_CHAR((price),'$999.99') AS PRICE, NVL(price_upcharge, '999') AS PRICE_UPCHARGE
from FOOD
where price >= '7';
/*

SUP DESCRIPTION          PRICE    PRICE_UPCHARGE
--- -------------------- -------- --------------
Hsd Protein Plate           $8.40             .5
Crm Grilled Cheese          $7.88             .4
Crm Philly Melt            $10.08             .7
Crm Ham Melt                $8.61             .3
Jmd Mushroom Pizza          $9.45            .15
Lss Grilled Cheese          $8.35            999
Dpz Cheese Pizza            $7.88            999
Blu Turkey Club             $9.98             .5

8 rows selected. 



*/

--Question 5:
select TO_CHAR(MIN(lunch_date), 'mm-dd-yyyy, Day') AS MIN_DATE,  TO_CHAR(max(lunch_date), 'mm-dd-yyyy, Day') AS MAX_DATE
from lunch;
/*
MIN_DATE              MAX_DATE             
--------------------- ---------------------
07-22-2019, Monday    08-22-2019, Thursday 
*/
--Question 6A
select supplier_id, Count(*) as Number_of_Items , round((avg(price)),2) as Average_Price
from Food
group by supplier_id;

/*

SUP NUMBER_OF_ITEMS AVERAGE_PRICE
--- --------------- -------------
Ard               1           6.3
Blu               2          6.57
Crm               4          7.43
Dpz               3          3.15
Foi               4          3.68
Gls               3          3.59
Hsd               4          5.65
Jd6               3           2.8
Jmd               4           5.5
Lak               3          4.48
Lss               2          6.78

11 rows selected. 
*/

--Question 6B
select supplier_id, Count(supplier_id) as Number_of_Items , round((avg(price)),2) as Average_Price
from Food
group by supplier_id;

/*

SUP NUMBER_OF_ITEMS AVERAGE_PRICE
--- --------------- -------------
Ard               1           6.3
Blu               2          6.57
Crm               4          7.43
Dpz               3          3.15
Foi               4          3.68
Gls               3          3.59
Hsd               4          5.65
Jd6               3           2.8
Jmd               4           5.5
Lak               3          4.48
Lss               2          6.78

11 rows selected. 

*/

--Question 6C
select supplier_id, Count(price_upcharge) as Number_of_Items , round((avg(price)),2) as Average_Price
from Food
group by supplier_id;

/*

SUP NUMBER_OF_ITEMS AVERAGE_PRICE
--- --------------- -------------
Ard               0           6.3
Blu               1          6.57
Crm               4          7.43
Dpz               1          3.15
Foi               2          3.68
Gls               1          3.59
Hsd               3          5.65
Jd6               3           2.8
Jmd               3           5.5
Lak               1          4.48
Lss               0          6.78

11 rows selected. 
*/

--Question 7A
select dept_code, sum (credit_limit) 
from worker
group by dept_code;

/*
DEP SUM(CREDIT_LIMIT)
--- -----------------
Exe                45
                  147
Leg                80
Acc                72
Sal                53
Fin                48
Pur                22
Hmn                68
Srv                59
Aud                72
Tch               132

11 rows selected. 


*/

--Question 7B
select dept_code,manager_id, sum (credit_limit) 
from worker
group by dept_code,manager_id;

/*
DEP MAN SUM(CREDIT_LIMIT)
--- --- -----------------
Sal 210                20
Hmn 201                30
    203                25
    201                23
Fin 201                28
Tch 211                27
Leg 202                28
Hmn 204                38
    211                20
Sal 201                33
Tch 202                50

DEP MAN SUM(CREDIT_LIMIT)
--- --- -----------------
Leg 203                52
Exe                    45
Srv 201                59
    202                22
Aud 201                25
Fin 209                20
Acc 209                42
Tch 201                30
Pur 206                22
Acc 201                30
Aud 203                47

DEP MAN SUM(CREDIT_LIMIT)
--- --- -----------------
Tch 218                25
    208                57

24 rows selected. 

*/

--Question 7C
select dept_code,manager_id, sum (credit_limit), count(*)
from worker
group by dept_code,manager_id;

/*
DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Sal 210                20          1
Hmn 201                30          1
    203                25          1
    201                23          1
Fin 201                28          1
Tch 211                27          1
Leg 202                28          1
Hmn 204                38          2
    211                20          1
Sal 201                33          1
Tch 202                50          2

DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Leg 203                52          2
Exe                    45          1
Srv 201                59          2
    202                22          1
Aud 201                25          1
Fin 209                20          1
Acc 209                42          2
Tch 201                30          1
Pur 206                22          1
Acc 201                30          1
Aud 203                47          2

DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Tch 218                25          1
    208                57          2

24 rows selected. 

*/

--Question 7D
select dept_code,manager_id, sum (credit_limit), count(*)
from worker
Where to_char(hire_date,'YYYY')>'2010'
group by dept_code,manager_id;

/*

DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Sal 210                20          1
Hmn 201                30          1
    201                23          1
Fin 201                28          1
Tch 211                27          1
Leg 202                28          1
    211                20          1
Leg 203                52          2
Tch 202                25          1
Exe                    45          1
Srv 201                26          1

DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Fin 209                20          1
Acc 209                42          2
Tch 201                30          1
Pur 206                22          1
Aud 203                22          1
Tch 218                25          1
    208                25          1

18 rows selected. 

*/

--Question 7E
select dept_code,manager_id, sum (credit_limit), count(*)
from worker
Where to_char(hire_date,'YYYY')>'2010'
group by dept_code,manager_id
having sum(credit_limit) > 25;
/*

DEP MAN SUM(CREDIT_LIMIT)   COUNT(*)
--- --- ----------------- ----------
Hmn 201                30          1
Fin 201                28          1
Tch 211                27          1
Leg 202                28          1
Leg 203                52          2
Exe                    45          1
Srv 201                26          1
Acc 209                42          2
Tch 201                30          1

9 rows selected. 


*/

-- Question 8A
select description, price
from food
where price < (select avg(price)
from food;);


/*
DESCRIPTION               PRICE
-------------------- ----------
Chicken Soup               4.73
Velvet Cake                3.68
Bagel                      3.15
Broccoli Salad             3.15
French Fries               2.63
Barley Soup                4.73
Apple Pie                   4.2
Soda                       2.89
Coffee                     2.09
Brownie                    3.41
Iced Tea                    3.1

DESCRIPTION               PRICE
-------------------- ----------
Cole Slaw                  2.63
Dinner Roll                1.05
Cheese Sauce                .53
Sugar Cookie               3.15
Breadstick                 1.31
Chips                      3.15
Cheese Stick               1.37

18 rows selected. 

*/

--Question 8B
select avg(price)
from food;
/*

AVG(PRICE)
----------
4.97181818

*/


















































