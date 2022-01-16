/*
Atahan Kucuk
CNIT 272 Fall 2020

*/
-- Question 1 A:
DESCRIBE shipment
/*
Name           Null?    Type         
-------------- -------- ------------ 
SHIPMENTID     NOT NULL VARCHAR2(10) 
ORDERID                 VARCHAR2(10) 
SHIPPERID               NUMBER(4)    
SHIPNAME                VARCHAR2(20) 
SHIPADDRESS             VARCHAR2(40) 
SHIPCITY                VARCHAR2(20) 
SHIPSTATE               CHAR(2)      
SHIPPOSTALCODE          CHAR(10)     
*/
--Question 1 B:
select shipmentid, orderid,shipcity, shippostalcode
from shipment
where shipstate = 'HI'; 
/*
SHIPMENTID ORDERID    SHIPCITY             SHIPPOSTAL
---------- ---------- -------------------- ----------
H035       3000000080 Pearl City           96782     
H375       3001000786 Kapaa                96746     
H379       3001000795 Pearl City           96782     
H098       3000000246 Kapaa                96746     
H197       3000000415 Kapaa                96746   
*/
--Question 2A: 
select DISTINCT inservicedate
from machine;
/*
INSERVICE
---------
20-MAY-16
26-NOV-16
10-FEB-13
23-FEB-16
10-JUN-16
13-JAN-11
24-MAR-13

7 rows selected. 
*/
--Question 2B
select DISTINCT inservicedate, make
from machine;
/*
INSERVICE MAKE                     
--------- -------------------------
13-JAN-11 BARCODE SYSTEM           
26-NOV-16 #98577 DEWEL PACK        
10-JUN-16 ADEPT ONE                
10-FEB-13 ADEPT ONE                
23-FEB-16 #98766 PACKAGE           
24-MAR-13 #99234 NEW JERSEY        
20-MAY-16 LINESHAFT CONVEYOR       
24-MAR-13 RFID SYSTEM              

8 rows selected. 
Explanation : it is because even though we differentiate inservice date and make there are 2 entries for 24-MAR-13 for 2 different make of machine
*/
--Question 3A
select supplierid, companyname, city,state, emailaddr
from supplier
where city = 'Denver' AND state = 'CO';
/*
SUPPLIERID COMPANYNAME                    CITY                 ST EMAILADDR                                         
---------- ------------------------------ -------------------- -- --------------------------------------------------
RC-450     Electronics Cafe               Denver               CO thonn@ecafe.com                                   
SE-450     Security Associates            Denver               CO gwendal@securityassoc.com                         
*/
--Question 3B
select supplierid, companyname, city,state, emailaddr
from supplier
where (city = 'Denver' OR city = 'Boulder') AND state = 'CO';
/*
SUPPLIERID COMPANYNAME                    CITY                 ST EMAILADDR                                         
---------- ------------------------------ -------------------- -- --------------------------------------------------
LU-450     Tech Parts Mart                Boulder              CO almyn@techparts.com                               
RC-450     Electronics Cafe               Denver               CO thonn@ecafe.com                                   
SE-450     Security Associates            Denver               CO gwendal@securityassoc.com   
Explanation: Or includes entries from both city queries while and only retrieves entries from single query
*/
--Question 4
select supplierid, catalognumber, unitcost, unitofmeasure,(unitcost / unitofmeasure)AS cost_per_piece
from suppliedpart
where (unitofmeasure BETWEEN '40' AND '50') and  (unitcost/unitofmeasure)<=10 
order by unitcost;
/*

SUPPLIERID CATALOGNUM   UNITCOST UNITOFMEASURE COST_PER_PIECE
---------- ---------- ---------- ------------- --------------
MSN-105    350-9206       104.65            45     2.32555556
PA-450     325-2251        107.7            45     2.39333333
EA-103     700-6296        107.7            45     2.39333333
GC-450     200-0121        125.7            45     2.79333333
CA-105     875-9676       126.77            50         2.5354
EA-103     700-2626       167.65            50          3.353
GC-450     200-1149       167.65            45     3.72555556
CA-105     875-5233       175.46            45     3.89911111
LU-450     975-3658        175.8            45     3.90666667
PA-455     150-4568        175.8            45     3.90666667
PA-455     150-1218        175.8            45     3.90666667

SUPPLIERID CATALOGNUM   UNITCOST UNITOFMEASURE COST_PER_PIECE
---------- ---------- ---------- ------------- --------------
CA-105     875-3721       210.65            45     4.68111111
MM-104     900-8700        239.6            50          4.792
LU-450     975-1900        239.6            50          4.792
PA-455     150-2677        239.6            50          4.792
MC-455     625-6302        239.6            50          4.792
LU-450     975-5249        239.6            50          4.792
PP-103     225-4131        239.6            40           5.99

18 rows selected. 
Explaination :  cost_per_piece is not stored anywhere hence where clause can not retrive information about it hence in order to limit the results we have to add in the calculation for creating cost per piece into the where clause


*/
--Question 5
select employeeid, firstname || ' ' || lastname AS Employee_Name , homephone, hiredate
from employee
where (hiredate like '%10' ) and (releasedate IS null);
/*

EMPLOYEEID EMPLOYEE_NAME                        HOMEPHONE    HIREDATE 
---------- ------------------------------------ ------------ ---------
250120     Grayson Nairn                        919-486-6919 04-APR-10
250488     Jamie Osman                          919-486-2519 03-JAN-10
250559     Carmen Romilda                       305-747-8589 03-JAN-10
250700     Charles Jones                        919-774-5552 03-JAN-10
250967     Sandra Daniels                       929-763-4843 25-FEB-10
251166     Harold Sidney                        919-486-0649 25-JUN-10

6 rows selected. 


Explanation: by creating a new collum and combining entries from multiple collums 
*/

--Question 6
select supplierid, contactname, emailaddr, city, state
from supplier
where state not in ('VA','NJ','CO','CA')
order by city;
/*

SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
PP-103     Jennie Fry           Jfry@techtrade.com                                 Alamo                TX
CA-105     Adam Cyr             acyr@itcreate.com                                  Albany               NY
PA-399     Johanna Tighe        jtighe@securesol.com                               Albany               NY
GC-450     Kelli Jones          kjones@techww.com                                  Bonifay              FL
JLI-450    Wade Holle           Wade@serverstore.com                               Carson City          NV
MM-103     David Becker         BeckerDavid@monsterparts.com                       Charleston           SC
CA-103     Timothy Neal         tneal@compcom.com                                  Charlotte            NC
SE-455     Robert Case          rcase@cybertech.com                                Cinncinati           OH
MM-104     Jamie Pickett        jpickett@compsurplus.com                           Cinncinati           OH
MY-450     Lance Andrews        LanceA@tabletrep.com                               Dallas               TX
SW-450     Yauleng Depoe        ydepoe@powsmart.com                                Detroit              MI

SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
WE-450     Brenda Pritchett     bpritchett@compsurplus.com                         Dover                DE
PA-450     Darlene Jenkins      DarJen@beachaudio.com                              Fort Sutton          FL
DCI-450    Debra Cruz           Debra@powadapt.com                                 Fort Wayne           IN
OI-450     Pam Krick            pkrick@beachaudio.com                              Groton               CT
NN-455     Tim White            twhite@qwcomp.com                                  Lansing              MI
LL-455     Elizabeth Clark      eclark@limitcomp.com                               New York City        NY
MSN-105    Donald Blythe        Dblythe@compmedic.com                              Phoenix              AZ
EA-103     Loraine Platt        LoraineP@targetpc.com                              Phoenix              AZ
PA-384     Todd Wolfe           twolfe@cybersaver.com                              Phoenix              AZ
AM-450     Rob Thomas           rthomas@compclub.com                               Pittsburg            PA
MC-455     Gordon Mayes         Gordon@discountprint.com                           Portland             ME

SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
C-455      Sandy Goodman        Sgoodman@compzone.com                              Rexburg              ID
NA-450     Gary Mikels          GaryMikels@cablekit.com                            Santa Fe             NM
PA-385     Julie Evans          jevans@weartech.com                                Springfield          MO
CF-450     Paul Smith           psmith@nw.com                                      Whales               NC
CV-104     Kevin Martin         kmartin@refurbnet.com                              Yale                 KY

27 rows selected.

explanation: use of 'not in' saves time and makes it easy to filter out the query
*/

--Question 7
select emailaddr, companyname, contactname, state
from supplier
where companyname like '%Tech%' Or state = 'VA';
/*

EMAILADDR                                          COMPANYNAME                    CONTACTNAME          ST
-------------------------------------------------- ------------------------------ -------------------- --
jevans@weartech.com                                Wearable Techies               Julie Evans          MO
kjones@techww.com                                  Tech WorldWide                 Kelli Jones          FL
almyn@techparts.com                                Tech Parts Mart                Alice Mynhier        CO
DarJen@beachaudio.com                              xByte Tech                     Darlene Jenkins      FL
Jfry@techtrade.com                                 Tech Traders                   Jennie Fry           TX
sbird@infosec.com                                  Information Security           Stephen Bird         VA
rcase@cybertech.com                                Cyber Tech                     Robert Case          OH

7 rows selected. 
explanation: 'LIKE' is used to find keyword or number or in general a type of value in anywhere in a specific collum
*/

--Question 8
select partnumber,categoryid,weight,stocklevel,reorderlevel
from inventorypart
where (stocklevel<reorderlevel) and (categoryid = 'SFTW' or categoryid = 'HOME');
/*

PARTNUMBER CATEGORYID     WEIGHT STOCKLEVEL REORDERLEVEL
---------- ---------- ---------- ---------- ------------
SFT-003    SFTW              .25         19           20
SFT-007    SFTW            1.375         16           20
CS-001     HOME             2.75          4            5
CS-002     HOME            10.75          4            5
CS-003     HOME             1.75          4            5

explanation: there are 2 different statements in this where clause hence they are separated by parantheses with and in between them to combine them
*/
--Question 9
select orderid,unitprice,orderquantity,(unitprice*orderquantity) AS Total,discount
from custorderline
where unitprice > 2000
order by total;

/*
ORDERID     UNITPRICE ORDERQUANTITY      TOTAL   DISCOUNT
---------- ---------- ------------- ---------- ----------
3000000028    2202.09             1    2202.09          0
3000000209    2202.09             1    2202.09          5
3000000387    2202.09             1    2202.09          0
3001000570    2202.09             1    2202.09          0
3001000535    2202.09             1    2202.09          0
3001000689    2202.09             1    2202.09          0
3001000754    2202.09             1    2202.09          0
3000000354    2202.09             1    2202.09          0
3000000480    2202.09             6   13212.54         10
3000000351    2202.09             6   13212.54         10
3000000224    2202.09            16   35233.44         10

ORDERID     UNITPRICE ORDERQUANTITY      TOTAL   DISCOUNT
---------- ---------- ------------- ---------- ----------
3001000784    2202.09            20    44041.8         10

12 rows selected. 

explanation: Calculated fields in the select clause helps us to create new collums and manipulate the output of the date as we want
*/




























































































