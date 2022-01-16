/*
Atahan Kucuk
CNIT 272 Fall 2020

*/

--Question 1 
select s.supplierid, s.contactname, s.cellphone
from supplier s left join suppliedpart sp 
on s.supplierid = sp.supplierid
where sp.supplierid is null;
/*
SUPPLIERID CONTACTNAME          CELLPHONE   
---------- -------------------- ------------
AM-450     Rob Thomas           484-374-8030
PA-385     Julie Evans                      
PA-399     Johanna Tighe        315-654-9976
SE-450     Gina Wendal          303-455-5775
SE-455     Robert Case          937-776-8273

Explanation: inside a nested query in where clause compare the supplier ids in suppliedpart table while comparing the values of supplierid from supplier table 



*/
--Question 2
select s.companyname, s.contactname, s.cellphone , sum(sp.unitcost) as TOTAL_UC 
from supplier s left join suppliedpart sp 
on s.supplierid = sp.supplierid
group by s.companyname, s.contactname, s.cellphone;




/*

COMPANYNAME                    CONTACTNAME          CELLPHONE      TOTAL_UC
------------------------------ -------------------- ------------ ----------
CompCom                        Timothy Neal         919-736-0594    1669.69
Computer Visions               William Newlon       909-452-7153    2875.29
Net Works                      Paul Smith           919-703-0048    1670.18
Tech Traders                   Jennie Fry           806-456-9178   14128.46
Security Associates            Gina Wendal          303-455-5775           
Power Smart                    Yauleng Depoe        313-475-4786      456.2
Tech WorldWide                 Kelli Jones          305-647-7525    8628.48
Discount Print                 Gordon Mayes         207-634-0003   15683.97
Tablet Repair                  Lance Andrews        972-534-8447    1396.32
DealsPC                        Dorothy Beering      303-465-2392    7648.66
Tech Parts Mart                Alice Mynhier        303-696-8277      892.6

COMPANYNAME                    CONTACTNAME          CELLPHONE      TOTAL_UC
------------------------------ -------------------- ------------ ----------
Qwerty Comp                    Tim White            517-777-7156     817.65
Beach Audio                    Pam Krick            860-624-7384    2924.62
Wearable Techies               Julie Evans                                 
Secure Solutions               Johanna Tighe        315-654-9976           
RefurbNet                      Kevin Martin         606-677-0457    5054.56
Computer Surplus               Jamie Pickett        937-147-1168       7092
Cables and Kits                Gary Mikels          505-660-6852     815.22
Power Adapter Shop             Debra Cruz           812-547-3650     698.62
TargetPC                       Loraine Platt        520-475-9737    6178.87
Limited Comp                   Elizabeth Clark      471-846-9658   13111.16
Cyber Saver                    Todd Wolfe           520-534-8890     656.66

COMPANYNAME                    CONTACTNAME          CELLPHONE      TOTAL_UC
------------------------------ -------------------- ------------ ----------
xByte Tech                     Darlene Jenkins      305-490-1134    1140.55
Computer Surplus               Brenda Pritchett     302-696-5615    8369.18
Computer Club                  Rob Thomas           484-374-8030           
IT Creations                   Adam Cyr             315-474-1341    3148.98
Electronics Cafe               Travis Honn          303-564-6516    7159.98
Information Security           Stephen Bird         540-514-6031    6594.94
Computer Zone                  Sandy Goodman        208-614-8076    1218.43
Server Store                   Wade Holle           887-746-3374    3830.95
Monster Parts                  David Becker         843-646-0893     495.51
Computer Medic                 Donald Blythe        520-486-4013     1975.2
Toner Recyclers                Thurman Mezzo        303-967-0610     614.15

COMPANYNAME                    CONTACTNAME          CELLPHONE      TOTAL_UC
------------------------------ -------------------- ------------ ----------
Cyber Tech                     Robert Case          937-776-8273           

34 rows selected.



Explain: Inner joins only allows common rows to be displayed while outer joins allow all rows from both tables to be displayed

*/

--Question 3
select ip.partnumber, c.categoryid, c.categoryname, ip.weight, ip.stockprice
from category c right join inventorypart ip 
on c.categoryid = ip.categoryid
where ip.weight > (select avg(weight)
from inventorypart
where categoryid = 'CBL'
)
group by ip.partnumber, c.categoryid, c.categoryname, ip.weight, ip.stockprice
having ip.stockprice < 5 ;


/*
PARTNUMBER CATEGORYID CATEGORYNAME                       WEIGHT STOCKPRICE
---------- ---------- ------------------------------ ---------- ----------
CAB-023                                                    .625       3.59
CF-009     PROC       Processors                             .5       3.57
BRK-010    CBL        Cables                                 .5       2.99
CAB-007    CBL        Cables                               .688       2.79
CAB-009                                                      .5       4.59
ICAB-008   CBL        Cables                                 .5       2.99
BRK-007    CBL        Cables                                 .5       3.59
CAB-010                                                    .813       4.59
BRK-008    CBL        Cables                                 .5       3.59

9 rows selected. 

*/
--Explanation: 
select round(avg(weight),2)
from inventorypart
where categoryid = 'CBL'
/*
ROUND(AVG(WEIGHT),2)
--------------------
                 .47



Right join returns all rows from right table while left join returns all rows from left table even if there are no match


*/


--Question 4
select customerid
from customer
minus
select customerid
from custorder;
/*

CUSTOMERID
----------
C-200055
C-200075
C-200077
C-200078
C-200080
I-200028
I-200055
I-200057
I-200077
I-200107
I-200113

CUSTOMERID
----------
I-200136
I-200158
I-200159
I-200160

15 rows selected. 


Explain: the order of the queries because the results of the bottom query will be removed from the top query results. 


*/

--Question 5
select firstname || ' ' || lastname as Name , city
from employee
intersect
select shipname, shipcity
from shipment

/*
NAME                                 CITY                
------------------------------------ --------------------
Allison Roland                       Palma               




Explain : it will show more results because whenever there is match values from that row will be displayed even if the column for that attribute is null. 

*/

--Question 6
select  lastname, to_char(hiredate, 'Month') as HIRE_BIRTHDAY
from employee
intersect
select lastname, to_char(birthdate, 'Month') as HIRE_BIRTHDAY
from employee


/*
LASTNAME             HIRE_BIRT
-------------------- ---------
Alvarez              July     
Darby                April    
Gostler              June     
Guiomar              December 
Hettinger            January  
Thompson             June     
Vigus                November 

7 rows selected. 


Explain: query is comparing just the moth as to_char clause converts the date to a string and the rest is just a string matching. Intersect
can use same table for different attributes of the table. in this case we were comparing 2 date attributes. 

*/


--Question 7

select partnumber, count(*)
from custorderline
where substr(partnumber,1,3) = 'BRK'
group by partnumber
union
select partnumber , count(*)
from processrouting
where substr(partnumber,1,3) = 'BRK'
group by partnumber;

/*


PARTNUMBER   COUNT(*)
---------- ----------
BRK-001             1
BRK-001             4
BRK-002             1
BRK-002            17
BRK-003             1
BRK-003             6
BRK-004             1
BRK-004            14
BRK-005             1
BRK-005            11
BRK-006             1

PARTNUMBER   COUNT(*)
---------- ----------
BRK-007             1
BRK-007            18
BRK-008             1
BRK-008            14
BRK-009             1
BRK-009            21
BRK-010             1
BRK-010            16
BRK-011             1
BRK-011            20

21 rows selected. 

Explain: Union allows all coresponging rows from both queries to be shown in a single results section
*/


--Question 8
select shipname
from shipment
minus
select custfirstname || ' ' || custlastname as CustName
from customer


/*

SHIPNAME                            
------------------------------------
Adrian McGrew
Arika Bross
Ben Baltz
Bruce Fogarty
Carl Turley
Carrie Buchko
Cecil Scheetz
Crissy Jones
Dan Lagaveen
Danika Sharp
Dean Katpally

SHIPNAME                            
------------------------------------
Deb Compton
Dennis Eberle`
Don Torres
Eugene Gasper
Frank Aamodt
George Purcell
Gregory Abbott
Heather Waters
Jack Akers
Jana Gritffith
Janet Umbarger

SHIPNAME                            
------------------------------------
Jared Meers
Jeffery  Jordan
Jennefer Hundley
Jill Reece
Joan Flynn
Jonathan Blanco
June Idle
Kathleen Plyman
Kenneth Hughes
Krsity Moore
Larry Moore

SHIPNAME                            
------------------------------------
Mary Basham
Megan Stahley
Michael Godby
Michael Mumford
Norman Fields
Orville Gilliland
Phil Reece
Richard Akropolis
Richard Dalder
Robert Belt
Roy Beer

SHIPNAME                            
------------------------------------
Samantha Akers
Scott Alexander
Scott Slutz
Shelia Eagon
Sherry Garlin
Sherry Leathers
Terry Young
Tom Moore
Tommy McFerren
Trevor Snuffer

54 rows selected
*/
--Question 8 B : 201 match
select shipname
from shipment
intersect
select custfirstname || ' ' || custlastname as CustName
from customer

/*


SHIPNAME                            
------------------------------------
Allen Robles
Allison Roland
Amy Heide
Andrea Griswold
Andrea Montgomery
Andrew Ray
Andrew Smith
Andrew Yelnick
Andy Huegel
Angela Wainscott
Angie Hoover

SHIPNAME                            
------------------------------------
Anita Pastron
Anna Mayton
Anne Hatzell
Ansel Farrell
Archie Doremski
Bill Umbarger
Brad Arquette
Brenda Jones
Brenda Kitchel
Bridgette Kyger
Brittany Cottingham

SHIPNAME                            
------------------------------------
Bryan Price
Carey Dailey
Carl Dallas
Carl Hague
Cathy Bending
Cathy Harvey
Charlene Franks
Charles Jones
Chas Funk
Chris Dunlap
Dan Lageveen

SHIPNAME                            
------------------------------------
Daniel Barton
Daniel Ezra
Daniel Hundnall
Daniel Rodkey
Daniel Stabnik
David Chang
David Schilling
David Smith
David Tarter
David Tietz
Dean Eagon

SHIPNAME                            
------------------------------------
Dennis Drazer
Dennis Eberle
Dennis Mundy
Dennis Sammons
Dorlan Bresnaham
Doug Blizzard
Dusty Jones
Elizabeth Derhammer
Elizabeth Henderson
Eric Becker
Eric Fannon

SHIPNAME                            
------------------------------------
Eric Quintero
Evelyn Cassens
Frank Malady
Gary Kempf
Geo Schofield
George Trenkle
Gerald Campbell
Ginger Xiao
Heather Wallpe
Helene Ziekart
Hugo Gillespie

SHIPNAME                            
------------------------------------
Irene Poczekay
Jack Barrick
Jack Illingworth
Jacob Richer
James Gross
James Jones
James King
James Laake
James Schilling
Jamie Thompson
Jane Mumford

SHIPNAME                            
------------------------------------
Jason Laxton
Jay Hanau
Jeff Kowaiski
Jeffery Jordan
Jennifer Hundley
Jennifer Kmec
Jerry Mennen
Jerry Muench
Jessica Cain
Jessica Nakamura
Jim Lichty

SHIPNAME                            
------------------------------------
Jim Manaugh
Jim Sokeland
Jim Webb
Jo Jacko
Joan Hedden
John Garcia
John McGinnis
John Skadberg
Jon Clute
Joseph Schuman
Joshua Cole

SHIPNAME                            
------------------------------------
Juicheng Nugent
Kara Orze
Karen Burns
Karen Mangus
Karen Marko
Karen Randolph
Kathy Gunderson
Kelly Jordan
Kenneth Mintier
Kenneth Wilcox
Kevin Jackson

SHIPNAME                            
------------------------------------
Kevin Zubarev
Kimber Spaller
Kris Shinn
Kristy Moore
Larry Gardiner
Larry Osmanova
Lawrence Pullen
Linda Bowen
Linda Hari
Linda Li
Lisa Pettry

SHIPNAME                            
------------------------------------
Lou Caldwell
Louise Cool
Lucille Appleton
Lynne Lagunes
Marc Williams
Marjorie Vandermay
Marla Reeder
Marty Fay
Mary Ann Rausch
Mary Deets
Mary Jo Wales

SHIPNAME                            
------------------------------------
Mary Uhl
Matt Nakanishi
Matt Shade
Matt Smith
Matthew Quant
Melody Fazal
Meredith Rushing
Michael Emore
Michael Tendam
Michelle Oakley
Mike Condie

SHIPNAME                            
------------------------------------
Mike Dunbar
Mildred Jones
Nancy Basham
Noemi Elston
Patricia Leong
Patrick Bollock
Paul Kaakeh
Paul Rice
Paul Sullivan
Peter Austin
Phillip Hession

SHIPNAME                            
------------------------------------
Randall Neely
Randy Talauage
Richard Kluth
Richard Scott
Richard Stetler
Richard Strehle
Richard Zito
Robert Cortez
Robert Dalury
Robert Lister
Ronald Miller

SHIPNAME                            
------------------------------------
Rosemary Vanderhoff
Roy McGrew
Russ Mann
Ruth Albeering
Ruth Ball
Ryan Stahley
Sally Valle
Sarah McCammon
Scott Gray
Scott Yarian
Sean Akropolis

SHIPNAME                            
------------------------------------
Sharon Rouls
Sherry Garling
Shirley Osborne
Stephanie Pearl
Stephanie Yeinick
Steve Fulkerson
Susan Strong
Susan Watson
Tammi Baldocchio
Ted Zissa
Terry Xu

SHIPNAME                            
------------------------------------
Thomas Wolfe
Thomas Zelenka
Tim Carlton
Tim Leffert
Tim Parker
Tom Baker
Tom Irelan
Tracy Cicholski
Travis Camargo
Trudi Antonio
Verna McGrew

SHIPNAME                            
------------------------------------
Wade Jacobs
Zach McGrew
Zack Hill

201 rows selected


*/


--Question 9 
select partnumber
from inventorypart
minus
select partnumber
from custorderline


/*

PARTNUMBER
----------
ADT-002
BRK-006
C-004
CAB-002
CAB-004
CAB-014
CAB-019
CAB-024
CS-001
CS-002
CS-003

PARTNUMBER
----------
CTR-010
CTR-020
POW-001
PRT-005
SCN-003
SFT-009

17 rows selected. 

Explanation: we could use inner join and use a qualifying where statement to find this same result


*/


--Question 10

select s.supplierid, s.contactname, sp.unitcost
from supplier s inner join suppliedpart sp
on s.supplierid = sp.supplierid
where sp.unitcost in (select Max(unitcost) as max
from suppliedpart)
union
select s.supplierid, s.contactname, sp.unitcost
from supplier s inner join suppliedpart sp
on s.supplierid = sp.supplierid
where sp.unitcost in (select min(unitcost) as min
from suppliedpart)


/*

SUPPLIERID CONTACTNAME            UNITCOST
---------- -------------------- ----------
LL-455     Elizabeth Clark          8275.8
PA-450     Darlene Jenkins            22.4




Explanation : = matches a single value while IN allows multiple values to be matched and retrived 
*/






