/*
Atahan Kucuk
CNIT 272 Fall 2020

*/
-- Question 1:
select *from FOOD_SUPPLIER;

/*
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Oak Brook                     
Hsd Halsted Street Deli            Naperville                    
Crm Corner Market                  Naperville                    
Foi Fontinas Italian               Chicago                       
Fas Fiona and Samson               Orland Park                   
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
Rby Rosemont Bakery                Schaumburg                    
Lss Lucias Sub Shop                Aurora                        
Har Harman Bakery                  Naperville                    
Dpz Downtowner Pizza               Chicago                       

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Gls Great Lakes Station            Skokie                        
Gio Gio and Sons                   Chicago                       
Blu Blue Sky Deli                  Skokie                        
Lak Lakeshore Bakery               Chicago                       

15 rows selected. 
*/
-- Question 2
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM worker;

/*
FIRST_NAME LAST_NAME            HIRE_DATE
---------- -------------------- ---------
Tracy      Reynolds             18-MAR-16
Carole     Shreve               17-JUL-17
Cole       Gradle               23-MAR-16
Rita       Campbell             24-MAY-18
Maia       Neal                 01-APR-16
Kevin      Ridgeman             01-OCT-05
Maria      Bensen               15-SEP-06
Tom        Armstrong            01-JUL-15
Trevor     Vought               01-NOV-05
James      Kingman              17-DEC-08
Elizabeth  Cross                15-FEB-05

FIRST_NAME LAST_NAME            HIRE_DATE
---------- -------------------- ---------
Tabitha    Tevona               21-AUG-10
Darius     Richards             12-JAN-11
Taylor     Young                12-NOV-09
Dana       Sumner               07-FEB-12
Amy        Trance               19-JUN-08
Denise     Harris               28-MAR-08
Kevin      Johnson              11-DEC-13
Kate       White                22-MAY-11
Cassie     Irwin                13-SEP-07
Sean       Smith                19-APR-11
Keyanna    Jones                15-MAR-12

FIRST_NAME LAST_NAME            HIRE_DATE
---------- -------------------- ---------
Matt       Martin               19-NOV-15
Katelynn   Rayner               07-OCT-13
Yvonne     Rivera               13-NOV-16
Roy        Gonzalez             19-DEC-12
Brooks     Walsh                21-APR-06
Angie      Cross                19-JUN-17
Tonya      Montre               07-MAR-13
Tyler      Harney               07-MAR-17
Sam        Frank                22-JUL-15

31 rows selected. 
*/ 

--Question 3A
select worker_id, last_name, city, dept_code
from worker
where city = 'Evanston' AND dept_code = 'Fin';

/*
WOR LAST_NAME            CITY                           DEP
--- -------------------- ------------------------------ ---
215 Sumner               Evanston                       Fin
221 Smith                Evanston                       Fin
*/

--Question 3B
select worker_id, last_name, city, dept_code
from worker
where city = 'Evanston' AND (dept_code = 'Fin' OR dept_code = 'Tch');
/*
WOR LAST_NAME            CITY                           DEP
--- -------------------- ------------------------------ ---
215 Sumner               Evanston                       Fin
221 Smith                Evanston                       Fin
224 Rayner               Evanston                       Tch
*/
--Question 4
select supplier_name
from food_supplier
where supplier_name LIKE '%Deli%' OR supplier_name LIKE '%Bakery%' ;
/*
SUPPLIER_NAME                 
------------------------------
Arnoldo Deli
Halsted Street Deli
Justin's Deli at 601
Jebston Montrose Deli
Rosemont Bakery
Harman Bakery
Blue Sky Deli
Lakeshore Bakery

8 rows selected. 
*/
--Question 5
select worker_id, last_name, hire_date, credit_limit
from worker
where hire_date>='1-JAN-2015' AND hire_date<='31-DEC-2019';

--AND 
select worker_id, last_name, hire_date, credit_limit
from worker
where hire_date BETWEEN '1-JAN-2015' AND '31-DEC-2019';
/*
WOR LAST_NAME            HIRE_DATE CREDIT_LIMIT
--- -------------------- --------- ------------
201 Reynolds             18-MAR-16           45
202 Shreve               17-JUL-17           30
203 Gradle               23-MAR-16           28
204 Campbell             24-MAY-18           30
205 Neal                 01-APR-16           26
208 Armstrong            01-JUL-15           22
223 Martin               19-NOV-15           20
225 Rivera               13-NOV-16           23
228 Cross                19-JUN-17           24
230 Harney               07-MAR-17           27
231 Frank                22-JUL-15           30

11 rows selected. 

*/
--Question 6A 1)
select dept_code
from worker;

/*

DEP
---
Exe
Tch
Leg
Hmn
Srv

Aud
Pur
Acc
Sal
Tch

DEP
---
Hmn
Leg

Fin
Aud
Hmn

Aud

Fin
Tch

DEP
---
Sal
Tch

Acc
Srv
Acc

Tch
Leg

31 rows selected. 

*/

--Question 6A 2)
select dept_code
from department;
/*
DEP
---
Acc
Aud
Com
Exe
Fac
Fin
Hmn
Leg
Mkt
Pur
Sal

DEP
---
Shp
Srv
Tch

14 rows selected. 
Explanation : They are different because department table oly have different department codes while worker table includes same department code multiple times
*/

--Question 6B
select DISTINCT dept_code
from worker;
/*
DEP
---
Exe

Leg
Acc
Sal
Fin
Pur
Hmn
Srv
Aud
Tch

11 rows selected. 

Explanation:  They are not the same number because query from 6A has the same department code multiple times while query from 6B only has different department codes.
*/

--Question 7A
select first_name || ' ' || last_name AS NAME , dept_code, credit_limit AS  OLD_CREDIT, (credit_limit*1.05) AS NEW_CREDIT
from worker
where dept_code IN ('Tch', 'Leg', 'Aud','Sal');
/*
NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Carole Shreve                   Tch         30       31.5
Cole Gradle                     Leg         28       29.4
Maria Bensen                    Aud         25      26.25
James Kingman                   Sal         33      34.65
Elizabeth Cross                 Tch         25      26.25
Darius Richards                 Leg         22       23.1
Amy Trance                      Aud         25      26.25
Kate White                      Aud         22       23.1
Keyanna Jones                   Tch         25      26.25
Matt Martin                     Sal         20         21
Katelynn Rayner                 Tch         25      26.25

NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Tyler Harney                    Tch         27      28.35
Sam Frank                       Leg         30       31.5

13 rows selected.
*/

--Question 7B
select first_name || ' ' || last_name AS NAME , dept_code, credit_limit AS  OLD_CREDIT, (credit_limit*1.05) AS NEW_CREDIT
from worker
where dept_code NOT IN ('Tch', 'Leg', 'Aud','Sal');
/*
NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Tracy Reynolds                  Exe         45      47.25
Rita Campbell                   Hmn         30       31.5
Maia Neal                       Srv         26       27.3
Tom Armstrong                   Pur         22       23.1
Trevor Vought                   Acc         30       31.5
Tabitha Tevona                  Hmn         21      22.05
Dana Sumner                     Fin         28       29.4
Denise Harris                   Hmn         17      17.85
Sean Smith                      Fin         20         21
Roy Gonzalez                    Acc         18       18.9
Brooks Walsh                    Srv         33      34.65

NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Angie Cross                     Acc         24       25.2

12 rows selected. 
*/
--Question 7C
select first_name || ' ' || last_name AS NAME , dept_code, credit_limit AS  OLD_CREDIT, (credit_limit*1.05) AS NEW_CREDIT
from worker;
/*
NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Tracy Reynolds                  Exe         45      47.25
Carole Shreve                   Tch         30       31.5
Cole Gradle                     Leg         28       29.4
Rita Campbell                   Hmn         30       31.5
Maia Neal                       Srv         26       27.3
Kevin Ridgeman                              22       23.1
Maria Bensen                    Aud         25      26.25
Tom Armstrong                   Pur         22       23.1
Trevor Vought                   Acc         30       31.5
James Kingman                   Sal         33      34.65
Elizabeth Cross                 Tch         25      26.25

NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Tabitha Tevona                  Hmn         21      22.05
Darius Richards                 Leg         22       23.1
Taylor Young                                25      26.25
Dana Sumner                     Fin         28       29.4
Amy Trance                      Aud         25      26.25
Denise Harris                   Hmn         17      17.85
Kevin Johnson                               20         21
Kate White                      Aud         22       23.1
Cassie Irwin                                32       33.6
Sean Smith                      Fin         20         21
Keyanna Jones                   Tch         25      26.25

NAME                            DEP OLD_CREDIT NEW_CREDIT
------------------------------- --- ---------- ----------
Matt Martin                     Sal         20         21
Katelynn Rayner                 Tch         25      26.25
Yvonne Rivera                               23      24.15
Roy Gonzalez                    Acc         18       18.9
Brooks Walsh                    Srv         33      34.65
Angie Cross                     Acc         24       25.2
Tonya Montre                                25      26.25
Tyler Harney                    Tch         27      28.35
Sam Frank                       Leg         30       31.5

31 rows selected. 
Explanation: Above SQL queries does not retrieve NULL  values hence workers without department code did not inclueded in query from 7B

*/






