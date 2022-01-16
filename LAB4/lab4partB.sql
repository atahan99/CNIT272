/*
Atahan Kucuk
CNIT 272 Fall 2020

*/
--Question 1:
set linesize 200;
select (user) , (ceil (6867.65786)),(floor(6867.65786)),(trunc(6867.65786,2)),(round(6867.65786,1))
from dual;
/*
(USER)                                                                                                                           (CEIL(6867.65786)) (FLOOR(6867.65786)) (TRUNC(6867.65786,2))
-------------------------------------------------------------------------------------------------------------------------------- ------------------ ------------------- ---------------------
(ROUND(6867.65786,1))
---------------------
AKUCUK                                                                                                                                         6868                6867               6867.65 
               6867.7


Explain: trunc round it up to lower side and round rounds it up to the higher side
*/

--Question 2: 
select employeeid, lastname || ', ' || firstname AS NAME, hiredate,NVL(emailaddr,'*Need Email*') AS EMAIL_ADDRESS
from Employee
where (to_char(hiredate,'YYYY') = '2013');
/*
  
EMPLOYEEID NAME                                  HIREDATE  EMAIL_ADDRESS                                     
---------- ------------------------------------- --------- --------------------------------------------------
250104     Blair, Michael                        25-JAN-13 mblair@eagle.com                                  
250106     Loreto, Harper                        04-APR-13 hloreto@eagle.com                                 
250206     Guiomar, Maria                        01-DEC-13 mguiomar@eagle.com                                
250209     Reyes, Trinidad                       09-JAN-13 treyes@eagle.com                                  
250365     Cheswick, Gina                        20-JAN-13 gcheswick@eagle.com                               
250399     Day, Ronald                           04-MAY-13 *Need Email*                                      
250550     Roland, Allison                       04-APR-13 *Need Email*                                      
250600     Zollman, Calie                        04-APR-13 *Need Email*                                      
250650     Lilley, Edna                          25-NOV-13 elilley@eagle.com                                 
251115     Cochran, Steve                        17-DEC-13 *Need Email*                                      

10 rows selected. 
Explain: use like when trying to find a char or a word in anywhere of the column. = is used to compare a specific result.

*/

--Question 3
COL MIN FORMAT a15;
COL MAX FORMAT a15;
COL AVG FORMAT a15;
select supplierid, min(orderedunitcost) as MIN, max(orderedunitcost) AS MAX, round(avg(orderedunitcost),2) as AVG, count(*) as COUNT
from purchorderline
where supplierid like 'C%' or supplierid like 'P%'
group by supplierid;
/*
SUPPLIERID             MIN             MAX             AVG      COUNT
---------- --------------- --------------- --------------- ----------
PP-103               64.62          5507.7         1276.12         13
CA-103               21.42         1888.65          598.16          5
CA-105              113.09          809.73           369.3         11
CV-104              328.87         3239.64         1264.49          4
PA-450               98.93         2585.52          773.13          6
PA-455              215.64          648.92          372.87          4
CCS-106               65.7         3239.73         1264.15          5
CF-450               54.99         2375.85          824.66          5
C-455                21.42         1624.83          602.64          4

9 rows selected. 
Explanation: Row functions operate on a single row at any time. Column functions can summarize date in entire column. 
*/

--Question 4
COL MIN FORMAT a15;
COL MAX FORMAT a15;
COL AVG FORMAT a15;
select supplierid, min(orderedunitcost) as MIN, max(orderedunitcost) AS MAX, round(avg(orderedunitcost),2) as AVG, count(*) as COUNT
from purchorderline
where supplierid like 'C%' or supplierid like 'P%' 
group by supplierid
having avg(orderedunitcost) > 800;


/*

SUPPLIERID             MIN             MAX             AVG      COUNT
---------- --------------- --------------- --------------- ----------
PP-103               64.62          5507.7         1276.12         13
CV-104              328.87         3239.64         1264.49          4
CCS-106               65.7         3239.73         1264.15          5
CF-450               54.99         2375.85          824.66          5




*/

--Question 5 
select partnumber, lpad(lower(partdescription),40,'#') , categoryid , weight, stockprice
from inventorypart
where (weight BETWEEN 2.5 and 10) and (stockprice <(select avg(stockprice)
from inventorypart));

/*

PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'#')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
ADT-001    ###ethernet fiber optic mini-transceiver STOR                4      55.99
C-001      #########################full tower case BASE                5      70.97
C-002      ##########################mid tower case BASE             5.75      42.97
C-003      #########################mini tower case BASE              2.5      40.97
C-004      #####################laptop plastic case BASE                3      21.93
CD-004     ######################bluray drive usb 3 STOR                3     153.99
DVD-001    ##########################6x dvd-rom kit STOR              2.5     119.99
MEM-004    ##########################4tb hard drive STOR                3     161.99
MEM-005    ##########################1tb hard drive STOR             2.75      47.99
MEM-006    ##########################3tb hard drive STOR              2.5      95.99
MOM-001    ####################x370 atx motherboard BASE                5      59.93

PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'#')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
MOM-002    ###################intel atx motherboard BASE              5.5      95.99
MOM-003    ##############intel atx x299 motherboard BASE             5.75      83.99
MOM-004    ############################raspberry pi BASE                6      65.99
MON-003    #################23in multimedia monitor BASE                9       79.4
MON-006    #####################23in gaming monitor BASE                9      95.99
MON-007    #####################23in curved monitor BASE                9     107.99
MON-008    ##################22in ultraslim monitor BASE                7      83.99
PRT-004    #############3-in-1 color inkjet printer ACS                 6      179.4
PRT-005    ####################color inkjet printer ACS                 8       89.4
PRT-006    #######singlehead thermal inkjet printer ACS                 9       59.4
PS-001     ###################750 watt power supply POW                 3      59.97

PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'#')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
PS-002     ###################500 watt power supply                     3      53.97
PS-003     #############760 watt ax760 power supply POW                 4      71.77
SCN-001    ###############scanjet cse color scanner ACS               3.5       77.4
SCN-002    ###scanjet business series color scanner ACS                 4      149.4
CS-001     #########################security camera HOME             2.75      50.97

27 rows selected. 


Explanation: 
*/
select avg(stockprice)
from inventorypart;

/*
AVG(STOCKPRICE)
---------------
     222.822174
*/

--Question 6
select customerid, orderid, orderdate
from custorder
where orderdate = (select min(orderdate) from custorder);
/*

CUSTOMERID ORDERID    ORDERDATE
---------- ---------- ---------
I-200001   3000000001 01-JUL-18
C-200008   3000000002 01-JUL-18
I-200002   3000000003 01-JUL-18
I-200003   3000000004 01-JUL-18

Explanation: nested queries are actualy a separate sql statement which the where clause uses it results when doing a comparison 
*/

--Question 7
Select substr(partnumber,1,3) as partnumber, operationstep, count(*)
From operation
Where operationstep in ('BOX','WRAP','LABEL')
Group by substr(partnumber,1,3), operationstep
Having count(*)>= 10
Order by partnumber;

/*

PAR OPERATIONS   COUNT(*)
--- ---------- ----------
BRK BOX                11
BRK LABEL              11
BRK WRAP               11
CAB BOX                28
CAB LABEL              28
CAB WRAP               28
CTR BOX                29
CTR LABEL              29
CTR WRAP               29
MEM BOX                12
MEM LABEL              12

PAR OPERATIONS   COUNT(*)
--- ---------- ----------
MEM WRAP               12
MIC BOX                12
MIC LABEL              12
MIC WRAP               12
P-0 BOX                10
P-0 LABEL              10
P-0 WRAP               10

18 rows selected. 

Explanation: SUBSTR only uses the specified lenght of the column name 
*/

--Question 8
select jobtitle,round(avg(TRUNC(MONTHS_BETWEEN(HireDate, BirthDate)/12)),2) ,count(*)
from employee
group by jobtitle;
/*
JOBTITLE                            ROUND(AVG(TRUNC(MONTHS_BETWEEN(HIREDATE,BIRTHDATE)/12)),2)   COUNT(*)
----------------------------------- ---------------------------------------------------------- ----------
Chief Sales Officer                                                                         34          1
Engineer                                                                                    34          5
President                                                                                   44          1
DBA                                                                                         34          1
Chief Financial Officer                                                                     34          1
Assembly                                                                                 24.37         19
VP Operations                                                                               29          1
Programmer Analyst                                                                        27.5          2
Accountant                                                                                  19          2
Sales                                                                                       29          4
Chief Information Officer                                                                   23          1

JOBTITLE                            ROUND(AVG(TRUNC(MONTHS_BETWEEN(HIREDATE,BIRTHDATE)/12)),2)   COUNT(*)
----------------------------------- ---------------------------------------------------------- ----------
Operations Officer                                                                        29.5          2
VP Finance                                                                                  34          1
VP Information                                                                              35          1

14 rows selected. 

Explain: finding the age of the employee when hired was already given. then i added avg to the outside of the trunc in order to find the average. Lastly i added round to the very outside of the clause since  it was needed to round up the average. 
*/

--Question 9 A
select status, count(*), round(sum((unitprice * orderquantity)),2) as SUBTOTAL
from custorderline
group by status;
/*

STATUS            COUNT(*)   SUBTOTAL
--------------- ---------- ----------
PENDING                 43   38151.27
SHIPPED               2225 2971646.08
PICKED                  13   11168.79
PACKED                   8    5003.04
PART SHIP                3   21076.67
*/


--Question 9B
select unitprice, orderquantity, orderid
from custorderline
where status = 'PACKED';
/*

 UNITPRICE ORDERQUANTITY ORDERID   
---------- ------------- ----------
     31.95             3 3001000703
      5.99             1 3001000703
     44.99             2 3001000703
     14.99            29 3001000797
     12.99             1 3001000667
     69.99             1 3001000667
   1846.79             2 3001000810
    119.99             5 3001000810

8 rows selected. 

*/


--Question 9C
select status, count(*), round(sum((unitprice * orderquantity)),2) as SUBTOTAL
from custorderline
group by status
having round(sum((unitprice * orderquantity)),2) <= 30000;
/*

STATUS            COUNT(*)   SUBTOTAL
--------------- ---------- ----------
PICKED                  13   11168.79
PACKED                   8    5003.04
PART SHIP                3   21076.67

*/


--Question 10 Query 1
select to_char(sysdate, 'fmMonth dd, yyyy') 
from dual ;
/*

TO_CHAR(SYSDATE,'F
------------------
October 14, 2020
*/

--Question 10 Query 2

Select to_char(sysdate,'Day') 
from dual ;
/*

TO_CHAR(S
---------
Wednesday


*/

--Question 10 Query 3
Select to_char(to_date('23-APR-1999'),'Day') 
from dual ;
/*


TO_CHAR(T
---------
Friday  
*/
/*
Explaination: to_char converts whatever data such as dates, numbers into strings or in other words into varchar. To_date converts a date written in varchar into a date data format.
*/






























