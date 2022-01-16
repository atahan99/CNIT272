/*
Atahan Kucuk
CNIT 272 Fall 2020

*/

--Question 1
select  employeeid, lastname || ', ' || firstname AS CONTACT
from employee
where employeeid not in (select employeeid
from packingslip);

/*
EMPLOYEEID CONTACT                              
---------- -------------------------------------
250600     Zollman, Calie                       
251089     Alvarez, Melissa                     
250700     Jones, Charles                       
250206     Guiomar, Maria                       
250104     Blair, Michael                       
250365     Cheswick, Gina                       
250944     Thompson, Ryan                       
251135     Gostler, David                       
251030     Moore, Jaylen                        
251066     Rodgers, Laura                       
251007     Krastner, Malik                      

EMPLOYEEID CONTACT                              
---------- -------------------------------------
250127     Watson, Shelby                       
250488     Osman, Jamie                         
250112     Hickman, Hunter                      
250650     Lilley, Edna                         
250209     Reyes, Trinidad                      
250200     Hernandez, Lauren                    
250559     Romilda, Carmen                      
250103     Jones, Rita                          
250106     Loreto, Harper                       
250001     Howard, Marilyn                      
250330     Gustavel, Kristen                    

EMPLOYEEID CONTACT                              
---------- -------------------------------------
250880     Goldwear, Gary                       
251115     Cochran, Steve                       
251175     Darby, Shannon                       
250125     Stevens, Kasey                       
250220     Vigus, Todd                          
250475     Hess, Steve                          

28 rows selected. 

Explanation: 
*/

--Question 2 
select e.employeeid, lastname, emailaddr, dateordered, datedelivered
from employee E inner join purchaseorder PO
on e.employeeid = po.employeeid
where  paidinfull = 'Y' AND to_char(dateordered, 'MON-YYYY') = 'SEP-2019';

/*
EMPLOYEEID LASTNAME             EMAILADDR                                          DATEORDER DATEDELIV
---------- -------------------- -------------------------------------------------- --------- ---------
250600     Zollman                                                                 05-SEP-19 08-SEP-19
250880     Goldwear             ggoldwear@eagle.com                                03-SEP-19 14-SEP-19
250880     Goldwear             ggoldwear@eagle.com                                05-SEP-19 09-SEP-19
250880     Goldwear             ggoldwear@eagle.com                                07-SEP-19 09-SEP-19
250880     Goldwear             ggoldwear@eagle.com                                10-SEP-19 12-SEP-19
250880     Goldwear             ggoldwear@eagle.com                                10-SEP-19 14-SEP-19
251007     Krastner             mkrastner@eagle.com                                06-SEP-19 10-SEP-19
251007     Krastner             mkrastner@eagle.com                                06-SEP-19 11-SEP-19
251007     Krastner             mkrastner@eagle.com                                10-SEP-19 12-SEP-19
251007     Krastner             mkrastner@eagle.com                                10-SEP-19 13-SEP-19
251066     Rodgers                                                                 04-SEP-19 08-SEP-19

EMPLOYEEID LASTNAME             EMAILADDR                                          DATEORDER DATEDELIV
---------- -------------------- -------------------------------------------------- --------- ---------
251167     Natlen                                                                  05-SEP-19 07-SEP-19
251167     Natlen                                                                  09-SEP-19 12-SEP-19
251167     Natlen                                                                  09-SEP-19 12-SEP-19

14 rows selected. 

Explanation: employee id is the primary or primary foreign key of these two tables.
*/

--Question 3A
select CA.categoryid , categoryname , sum(stocklevel) as PARTS , round(avg(stockprice),2) as AVG_PRICE , min(stockprice) as MIN_PRICE , max(stockprice) as MAX_PRICE
from akucuk.category CA inner join inventorypart I 
on CA.categoryid = I.categoryid
group by ca.categoryid, categoryname;
/*
CATEGORYID CATEGORYNAME                        PARTS  AVG_PRICE  MIN_PRICE  MAX_PRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
ACS        Accessories                            73     189.15       59.4      419.4
BASE       Basics                                908     122.27       7.79    1717.99
CBL        Cables                               1291      15.53       1.19      74.99
COMP       Computers                              71    1132.38     788.54    1572.93
HOME       Monitoring                             12      90.97      21.97     199.97
NET        Networking                             41      57.59       7.99     121.99
POW        Power                                  27       55.9      35.97      71.77
PROC       Processors                            451     128.26       3.57     460.79
SFTW       Software                              305       5.99       5.99       5.99
STOR       Storage                               389      80.04      12.99     171.99

10 rows selected. 
 
*/

--Question 3 B
select CA.categoryid , categoryname , sum(stocklevel) as PARTS , round(avg(stockprice),2) as AVG_PRICE , min(stockprice) as MIN_PRICE , max(stockprice) as MAX_PRICE
from akucuk.category CA inner join inventorypart I 
on CA.categoryid = I.categoryid
group by ca.categoryid, categoryname
having avg(stockprice) > 75;
/*
CATEGORYID CATEGORYNAME                        PARTS  AVG_PRICE  MIN_PRICE  MAX_PRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
ACS        Accessories                            73     189.15       59.4      419.4
HOME       Monitoring                             12      90.97      21.97     199.97
BASE       Basics                                908     122.27       7.79    1717.99
COMP       Computers                              71    1132.38     788.54    1572.93
PROC       Processors                            451     128.26       3.57     460.79
STOR       Storage                               389      80.04      12.99     171.99

6 rows selected. 
Explanation: you need to use a very similar command to add another table to the query. you will need to use the second half of the command and change it according to your needs. meaning that you need to use inner join yourtablename xx . and rest of the relationship of the tables part menaing the on and and parts will be same 
*/

--Question 4
select co.orderid, co.orderdate, s.shipmentid, c.custlastname, c.state 
from customer C inner join custorder CO
on c.customerid = co.customerid
inner join shipment S
on co.orderid = s.orderid
where  shipmentid  not in  (select shipmentid
from packingslip);
/*
ORDERID    ORDERDATE SHIPMENTID CUSTLASTNAME         ST
---------- --------- ---------- -------------------- --
3001000797 29-MAR-19 H380       Robles               CO
3001000805 31-MAR-19 H383       Kmec                 MD
3001000667 23-FEB-19 M129       Lageveen             WY
3001000804 30-MAR-19 L261       Moore                KY
3001000798 29-MAR-19 L259       Umbarger             ME
3001000806 31-MAR-19 L262       Williams             VT
3001000791 27-MAR-19 L258       Illingworth          NY
3001000808 31-MAR-19 M162       Marko                OK
3001000796 29-MAR-19 M159       Hari                 KY
3001000800 30-MAR-19 H381       Gilliland            DC
3001000807 31-MAR-19 H384       Smith                VT

ORDERID    ORDERDATE SHIPMENTID CUSTLASTNAME         ST
---------- --------- ---------- -------------------- --
3001000801 30-MAR-19 H382       Marcus               NV
3001000803 30-MAR-19 M161       Osborne              GA
3001000799 29-MAR-19 M160       Mangus               FL
3001000703 01-MAR-19 M137       Hedden               AR
3001000750 13-MAR-19 M147       Cool                 ID
3001000790 27-MAR-19 L257       McGrew               AL
3001000802 30-MAR-19 L260       Jones                FL
3000000030 13-JUL-18 L006       Manaugh              FL

19 rows selected. 
Explanation: inner join allows us to use data from couple of different tables. nested query is also doing a very similar thing but that allows us to search through other tables whereelse inner join allows us to use the data from other tables
*/

--Question 5
select s.supplierid , companyname, cellphone ,count(partnumber) as SUPPLIER_COUNT
from supplier S inner join suppliedpart SP
on s.supplierid = sp.supplierid
group by s.supplierid, companyname,cellphone;
/*

SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
AC-450     DealsPC                        303-465-2392              7
C-455      Computer Zone                  208-614-8076              5
CA-103     CompCom                        919-736-0594              5
CA-105     IT Creations                   315-474-1341             11
CCS-106    Computer Visions               909-452-7153              5
CF-450     Net Works                      919-703-0048              5
CV-104     RefurbNet                      606-677-0457              4
DCI-450    Power Adapter Shop             812-547-3650              3
EA-103     TargetPC                       520-475-9737             12
GC-450     Tech WorldWide                 305-647-7525             13
JLI-450    Server Store                   887-746-3374              5

SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
LL-455     Limited Comp                   471-846-9658              9
LU-450     Tech Parts Mart                303-696-8277              5
MC-455     Discount Print                 207-634-0003             12
MM-103     Monster Parts                  843-646-0893              4
MM-104     Computer Surplus               937-147-1168              8
MSN-105    Computer Medic                 520-486-4013              4
MY-450     Tablet Repair                  972-534-8447              6
NA-450     Cables and Kits                505-660-6852              3
NN-455     Qwerty Comp                    517-777-7156              2
OI-450     Beach Audio                    860-624-7384              5
PA-384     Cyber Saver                    520-534-8890              3

SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
PA-450     xByte Tech                     305-490-1134              6
PA-455     Toner Recyclers                303-967-0610              4
PP-103     Tech Traders                   806-456-9178             13
RC-450     Electronics Cafe               303-564-6516              5
SS-455     Information Security           540-514-6031              6
SW-450     Power Smart                    313-475-4786              3
WE-450     Computer Surplus               302-696-5615              6

29 rows selected. 
Explanation: inner joins in this question works by combining supplier and supplied part tables
*/

--Question 6
select distinct c.customerid , c.orderid , co.partnumber, co.unitprice, si.packagenumber , si.shipmentid , si.quantityshipped
from custorder  C inner join custorderline CO
on c.orderid = co.orderid
inner join shippeditem SI
on si.orderid = c.orderid
and si.partnumber = co.partnumber
where (co.unitprice < 10) and (c.orderdate = TO_DATE('16-DEC-2018'));
/*

CUSTOMERID ORDERID    PARTNUMBER  UNITPRICE PACKAGENUMBER SHIPMENTID QUANTITYSHIPPED
---------- ---------- ---------- ---------- ------------- ---------- ---------------
I-200093   3000000469 CAB-016          6.99             1 H251                     1
I-200019   3000000487 CAB-008          6.99             1 H269                     4
I-200093   3000000469 BRK-010          4.99             1 H251                     5
I-200085   3000000479 ICAB-008         4.99             1 H261                     1
I-200069   3000000468 POW-003          1.99             1 H250                     1
I-200072   3000000478 CAB-016          6.99             4 H260                     3
C-200010   3000000482 BRK-009          5.99             1 H264                    26
I-200032   3000000488 BRK-010          4.99             1 H270                     5
I-200069   3000000468 ICAB-007         5.49             1 H250                     1
C-200011   3000000493 SFT-001          9.99            15 H275                     3
C-200011   3000000493 SFT-008          9.99            15 H275                     2

CUSTOMERID ORDERID    PARTNUMBER  UNITPRICE PACKAGENUMBER SHIPMENTID QUANTITYSHIPPED
---------- ---------- ---------- ---------- ------------- ---------- ---------------
I-200093   3000000469 SFT-001          9.99             1 H251                     1
C-200013   3000000473 BRK-011          5.99             9 H255                    20
I-200100   3000000486 SFT-008          9.99             1 H268                     2
C-200008   3000000489 CAB-022          9.99            21 H271                     3
C-200013   3000000473 BRK-008          5.99             8 H255                    15
I-200032   3000000488 BRK-003          9.99             1 H270                     3
C-200011   3000000493 SFT-002          9.99            15 H275                     4
I-200003   3000000466 CF-008           9.95             1 H248                     1
I-200069   3000000468 BRK-008          5.99             1 H250                     3
I-200102   3000000481 SFT-008          9.99             1 H263                     1

21 rows selected. 

Explanation: for a join with composite pk there needs be a 'and' clause after 'on' clause and the sytax of the clause will be the same
*/

--Question 7 
col TOTAL_PRICE format $999.99;
select distinct c.customerid, c.cellphone, co.orderdate, sh.shippername,co.orderid, sum((cr.unitprice * cr.orderquantity)) as TOTAL_PRICE , sum(cr.orderquantity) as ORDERS
from customer c inner join custorder co
on c.customerid = co.customerid
inner join shipment s
on s.orderid = co.orderid
inner join custorderline cr
on cr.orderid = co.orderid
inner join shipper sh
on s.shipperid = sh.shipperid
where (c.state = 'NY') and (to_char(co.orderdate,'YYYY') = '2019')
group by c.customerid, c.cellphone, co.orderdate, sh.shippername,co.orderid 
having sum((cr.unitprice * cr.orderquantity)) < 2000
order by co.orderdate;
/*

CUSTOMERID CELLPHONE    ORDERDATE SHIPPERNAME               ORDERID    TOTAL_PRICE     ORDERS
---------- ------------ --------- ------------------------- ---------- ----------- ----------
I-200145                12-JAN-19 Shipping Experts          3001000511 ########             5
I-200145                14-JAN-19 Argen Shipping            3001000525  $163.78            22
C-200005   507-762-9493 04-FEB-19 Shipping Experts          3001000589  $260.55            21
I-200145                11-FEB-19 Federal Express           3001000611  $224.89             3
I-200147                11-FEB-19 Federal Express           3001000614  $209.94             6
C-200006   507-543-1845 17-FEB-19 U.S. Postal Service       3001000643  $990.00            10
I-200147                21-FEB-19 United Parcel Service     3001000654  $471.85             2
I-200091                24-FEB-19 Federal Express           3001000682  $226.77            15
C-200038   315-486-0683 01-MAR-19 Channel Express           3001000708  $470.74            26
I-200091                03-MAR-19 Mail Hub                  3001000720  $155.91             5
I-200145                20-MAR-19 Channel Express           3001000770   $20.98             2

CUSTOMERID CELLPHONE    ORDERDATE SHIPPERNAME               ORDERID    TOTAL_PRICE     ORDERS
---------- ------------ --------- ------------------------- ---------- ----------- ----------
I-200035                22-MAR-19 U.S. Postal Service       3001000779 ########             2
I-200147                27-MAR-19 Channel Express           3001000791   $47.93             3

13 rows selected. 
Explanation: 
*/

--Question 8
col emailaddr format a25;
select co.orderid, co.orderdate, c.customerid, c.emailaddr , count(cr.orderquantity) as ordercount
from customer c inner join custorder co
on c.customerid = co.customerid
inner join custorderline cr
on co.orderid = cr.orderid
where (c.state = 'WY') and ((c.emailaddr like '%comcast.net') or (c.emailaddr is null))
group by co.orderid, co.orderdate, c.customerid, c.emailaddr;
/*

ORDERID    ORDERDATE CUSTOMERID EMAILADDR                 ORDERCOUNT
---------- --------- ---------- ------------------------- ----------
3000000486 16-DEC-18 I-200100                                      3
3000000329 18-NOV-18 I-200120   dlageveen@comcast.net              1
3000000123 25-AUG-18 I-200120   dlageveen@comcast.net              1
3000000437 14-DEC-18 C-200066   closetoheaven@comcast.net          2
3000000222 07-OCT-18 I-200100                                      4
3000000276 31-OCT-18 I-200120   dlageveen@comcast.net              3
3001000696 28-FEB-19 C-200066   closetoheaven@comcast.net          3
3001000509 11-JAN-19 C-200066   closetoheaven@comcast.net          3
3000000275 31-OCT-18 I-200089                                      1
3001000667 23-FEB-19 I-200120   dlageveen@comcast.net              2
3000000270 29-OCT-18 I-200100                                      3

ORDERID    ORDERDATE CUSTOMERID EMAILADDR                 ORDERCOUNT
---------- --------- ---------- ------------------------- ----------
3000000459 15-DEC-18 I-200120   dlageveen@comcast.net              1

12 rows selected. 

Explanation: table allias only changes the title of the collumn while collum allias can format the entire collums according to our needs
*/

--Question 9
select distinct s.companyname, s.supplierid, sp.catalognumber, sp.partnumber, sp.unitcost, p.purchorderid, p.orderedunitcost
from supplier s inner join suppliedpart sp
on s.supplierid = sp.supplierid
inner join purchorderline P
on p.supplierid = sp.supplierid
and p.catalognumber = sp.catalognumber
where s.companyname = 'DealsPC';
/*
COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001            210.33
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001            242.87
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001            585.84
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001            323.46
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001           1457.73
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001           2483.82
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001           5319.82

7 rows selected. 
Explanation: if you forgot to join all pk attributes there will be more results in the query then needed because the database won't be able to link and retrive the correct amount of data
*/


--Question 10 
select co.orderid, co.orderdate, c.companyname, c.cellphone, c.state
from customer c inner join custorder co
on c.customerid = co.customerid
where substr(c.cellphone,1,3) = '307';
/*
ORDERID    ORDERDATE COMPANYNAME                              CELLPHONE    ST
---------- --------- ---------------------------------------- ------------ --
3000000121 25-AUG-18 Greenpart Steet Metal                    307-944-3950 WY
3000000153 07-SEP-18 Rydell High School                       307-892-1477 WY
3000000185 20-SEP-18 Rydell High School                       307-892-1477 WY
3001000696 28-FEB-19 North Street Church                      307-359-8090 WY
3000000216 05-OCT-18 Rydell High School                       307-892-1477 WY
3000000273 31-OCT-18 Greenpart Steet Metal                    307-944-3950 WY
3000000319 16-NOV-18 Greenpart Steet Metal                    307-944-3950 WY
3000000333 19-NOV-18 Greenpart Steet Metal                    307-944-3950 WY
3000000434 13-DEC-18 Greenpart Steet Metal                    307-944-3950 WY
3000000437 14-DEC-18 North Street Church                      307-359-8090 WY
3001000509 11-JAN-19 North Street Church                      307-359-8090 WY

11 rows selected. 
Explanation: same company can have/ serve multiple orders hence the rows are diffrent from each other
*/