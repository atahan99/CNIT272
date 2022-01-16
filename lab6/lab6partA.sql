/*
Atahan Kucuk
CNIT 272 Fall 2020

*/


--Question 1 A
SELECT fs.supplier_id, fs.supplier_name, f.description, f.price
from food_supplier fs inner join food f
on fs.supplier_id = f.supplier_id
order by fs.supplier_name;
/*
SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Ard Arnoldo Deli                   Sausage Pizza               6.3
Blu Blue Sky Deli                  Turkey Club                9.98
Blu Blue Sky Deli                  Chips                      3.15
Crm Corner Market                  Ham Melt                   8.61
Crm Corner Market                  Philly Melt               10.08
Crm Corner Market                  Grilled Cheese             7.88
Crm Corner Market                  Bagel                      3.15
Dpz Downtowner Pizza               Cheese Sauce                .53
Dpz Downtowner Pizza               Cheese Pizza               7.88
Dpz Downtowner Pizza               Dinner Roll                1.05
Foi Fontinas Italian               Apple Pie                   4.2

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Foi Fontinas Italian               French Fries               2.63
Foi Fontinas Italian               Broccoli Salad             3.15
Foi Fontinas Italian               Barley Soup                4.73
Gls Great Lakes Station            Sugar Cookie               3.15
Gls Great Lakes Station            Mango Smoothie              6.3
Gls Great Lakes Station            Breadstick                 1.31
Hsd Halsted Street Deli            Chicken Soup               4.73
Hsd Halsted Street Deli            Velvet Cake                3.68
Hsd Halsted Street Deli            Protein Plate               8.4
Hsd Halsted Street Deli            Chef Salad                 5.78
Jmd Jebston Montrose Deli          Mushroom Pizza             9.45

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Jmd Jebston Montrose Deli          Potato Soup                6.83
Jmd Jebston Montrose Deli          Iced Tea                    3.1
Jmd Jebston Montrose Deli          Cole Slaw                  2.63
Jd6 Justin's Deli at 601           Soda                       2.89
Jd6 Justin's Deli at 601           Coffee                     2.09
Jd6 Justin's Deli at 601           Brownie                    3.41
Lak Lakeshore Bakery               Caprese                    5.25
Lak Lakeshore Bakery               Spinach Salad              6.83
Lak Lakeshore Bakery               Cheese Stick               1.37
Lss Lucias Sub Shop                Grilled Cheese             8.35
Lss Lucias Sub Shop                Veggie Soup                 5.2

33 rows selected. 
*/

--Question 1 B
SELECT fs.supplier_id, fs.supplier_name, f.description, f.price
from food_supplier fs left join food f
on fs.supplier_id = f.supplier_id
order by fs.supplier_name;
/*

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Ard Arnoldo Deli                   Sausage Pizza               6.3
Blu Blue Sky Deli                  Chips                      3.15
Blu Blue Sky Deli                  Turkey Club                9.98
Crm Corner Market                  Grilled Cheese             7.88
Crm Corner Market                  Philly Melt               10.08
Crm Corner Market                  Ham Melt                   8.61
Crm Corner Market                  Bagel                      3.15
Dpz Downtowner Pizza               Cheese Sauce                .53
Dpz Downtowner Pizza               Dinner Roll                1.05
Dpz Downtowner Pizza               Cheese Pizza               7.88
Fas Fiona and Samson                                              

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Foi Fontinas Italian               Apple Pie                   4.2
Foi Fontinas Italian               French Fries               2.63
Foi Fontinas Italian               Barley Soup                4.73
Foi Fontinas Italian               Broccoli Salad             3.15
Gio Gio and Sons                                                  
Gls Great Lakes Station            Sugar Cookie               3.15
Gls Great Lakes Station            Mango Smoothie              6.3
Gls Great Lakes Station            Breadstick                 1.31
Hsd Halsted Street Deli            Chicken Soup               4.73
Hsd Halsted Street Deli            Velvet Cake                3.68
Hsd Halsted Street Deli            Protein Plate               8.4

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Hsd Halsted Street Deli            Chef Salad                 5.78
Har Harman Bakery                                                 
Jmd Jebston Montrose Deli          Mushroom Pizza             9.45
Jmd Jebston Montrose Deli          Potato Soup                6.83
Jmd Jebston Montrose Deli          Iced Tea                    3.1
Jmd Jebston Montrose Deli          Cole Slaw                  2.63
Jd6 Justin's Deli at 601           Brownie                    3.41
Jd6 Justin's Deli at 601           Coffee                     2.09
Jd6 Justin's Deli at 601           Soda                       2.89
Lak Lakeshore Bakery               Cheese Stick               1.37
Lak Lakeshore Bakery               Spinach Salad              6.83

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Lak Lakeshore Bakery               Caprese                    5.25
Lss Lucias Sub Shop                Veggie Soup                 5.2
Lss Lucias Sub Shop                Grilled Cheese             8.35
Rby Rosemont Bakery                                               

37 rows selected. 

*/

--Question 1 C
SELECT fs.supplier_id, fs.supplier_name, f.description, f.price
from food_supplier fs left join food f
on fs.supplier_id = f.supplier_id
WHERE f.supplier_id is null
order by fs.supplier_name;
/*

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Fas Fiona and Samson                                              
Gio Gio and Sons                                                  
Har Harman Bakery                                                 
Rby Rosemont Bakery                                               

*/

--Question 2 
select f.product_code, f.description, sum(f.price * lui.quantity) as Total_Purchase, count(*)
from food f left join lunch_item lui
on f.product_code = lui.product_code
and f.supplier_id = lui.supplier_id
group by f.product_code, f.description;

/*

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Sp Barley Soup                   33.11          3
Sp Veggie Soup                    20.8          2
Ff French Fries                  47.34          9
Ps Philly Melt                   201.6         10
Vt Broccoli Salad                  6.3          1
Ds Brownie                       51.15          7
Br Cheese Stick                   5.48          1
Ds Velvet Cake                    36.8          5
Sw Grilled Cheese               160.42          9
Br Breadstick                     2.62          1
Br Bagel                           6.3          1

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Sc Cheese Sauce                   1.06          1
Vr Mango Smoothie                               1
Cf Coffee                         20.9          4
Pz Cheese Pizza                  47.28          2
Br Dinner Roll                    12.6          4
Sw Caprese                        10.5          1
Pz Mushroom Pizza                47.25          2
Cp Chips                          9.45          1
Sp Potato Soup                   13.66          1
Pp Protein Plate                  16.8          1
Sd Spinach Salad                 13.66          1

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Ds Sugar Cookie                  34.65          4
Ds Apple Pie                      25.2          3
Pz Sausage Pizza                  37.8          2
Vt Cole Slaw                                    1
Cs Chef Salad                    144.5         12
Sp Chicken Soup                 108.79         10
Vr Soda                         121.38         18
Vr Iced Tea                       49.6          7
Hb Ham Melt                     129.15          6
Sw Turkey Club                   19.96          1

32 rows selected. 

*/
--Question 2 G
select f.product_code, f.description, sum(f.price * lui.quantity) as Total_Purchase, count(*)
from food f inner join lunch_item lui
on f.product_code = lui.product_code
and f.supplier_id = lui.supplier_id
group by f.product_code, f.description;
/*

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Sp Barley Soup                   33.11          3
Sp Veggie Soup                    20.8          2
Ff French Fries                  47.34          9
Ps Philly Melt                   201.6         10
Vt Broccoli Salad                  6.3          1
Ds Brownie                       51.15          7
Br Cheese Stick                   5.48          1
Ds Velvet Cake                    36.8          5
Sw Grilled Cheese               160.42          9
Br Breadstick                     2.62          1
Br Bagel                           6.3          1

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Sc Cheese Sauce                   1.06          1
Cf Coffee                         20.9          4
Pz Cheese Pizza                  47.28          2
Br Dinner Roll                    12.6          4
Sw Caprese                        10.5          1
Pz Mushroom Pizza                47.25          2
Cp Chips                          9.45          1
Sp Potato Soup                   13.66          1
Pp Protein Plate                  16.8          1
Sd Spinach Salad                 13.66          1
Ds Sugar Cookie                  34.65          4

PR DESCRIPTION          TOTAL_PURCHASE   COUNT(*)
-- -------------------- -------------- ----------
Ds Apple Pie                      25.2          3
Pz Sausage Pizza                  37.8          2
Cs Chef Salad                    144.5         12
Sp Chicken Soup                 108.79         10
Vr Soda                         121.38         18
Vr Iced Tea                       49.6          7
Hb Ham Melt                     129.15          6
Sw Turkey Club                   19.96          1

30 rows selected. 

*/


--Question 3 A
set linesize 200;
select w.worker_id, w.city, d.dept_code, d.department_name
from worker w inner join department d
on w.dept_code = d.dept_code
order by dept_code;
/*

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
228 Naperville                     Acc Accounting                    
226                                Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
219                                Aud Auditing                      
216 Aurora                         Aud Auditing                      
207 Skokie                         Aud Auditing                      
201 Chicago                        Exe Executive                     
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       
212 Oak Brook                      Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
217 Chicago                        Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
230 Chicago                        Tch Technology                    
224 Evanston                       Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
222 Naperville                     Tch Technology                    
211                                Tch Technology                    
202 Naperville                     Tch Technology                    

25 rows selected. 
*/

--Question 3B
set linesize 200;
select w.worker_id, city, d.dept_code, department_name
from department d right join worker w
on w.dept_code = d.dept_code
order by dept_code;
/*

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
226                                Acc Accounting                    
228 Naperville                     Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
207 Skokie                         Aud Auditing                      
216 Aurora                         Aud Auditing                      
219                                Aud Auditing                      
201 Chicago                        Exe Executive                     
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       
217 Chicago                        Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
212 Oak Brook                      Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
202 Naperville                     Tch Technology                    
211                                Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
222 Naperville                     Tch Technology                    
224 Evanston                       Tch Technology                    
230 Chicago                        Tch Technology                    
225                                                                  
220                                                                  
218 Naperville                                                       
214 Skokie                                                           
229 Aurora                                                           
206 Aurora                                                           

31 rows selected. 
*/

--Question 3C
set linesize 200;
select w.worker_id, city, d.dept_code, department_name
from department d left join worker w
on w.dept_code = d.dept_code
order by dept_code;

/*

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
228 Naperville                     Acc Accounting                    
226                                Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
219                                Aud Auditing                      
216 Aurora                         Aud Auditing                      
207 Skokie                         Aud Auditing                      
                                   Com Compliance                    
201 Chicago                        Exe Executive                     
                                   Fac Facilities                    
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
212 Oak Brook                      Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               
217 Chicago                        Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
                                   Mkt Marketing                     
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
                                   Shp Shipping                      

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
230 Chicago                        Tch Technology                    
224 Evanston                       Tch Technology                    
222 Naperville                     Tch Technology                    
211                                Tch Technology                    
202 Naperville                     Tch Technology                    

29 rows selected. 

*/


--Question 4
select supplier_name, supplier_city
from food_supplier
where supplier_city not in ('Skokie','Oak Brook','Chicago')
union
select first_name || ' ' || last_name as Name , city
from worker
where city not in ('Skokie','Oak Brook','Chicago')
order by supplier_name;


/*
SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Amy Trance                      Aurora                        
Angie Cross                     Naperville                    
Carole Shreve                   Naperville                    
Corner Market                   Naperville                    
Dana Sumner                     Evanston                      
Fiona and Samson                Orland Park                   
Halsted Street Deli             Naperville                    
Harman Bakery                   Naperville                    
Katelynn Rayner                 Evanston                      
Kevin Johnson                   Naperville                    
Kevin Ridgeman                  Aurora                        

SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Keyanna Jones                   Naperville                    
Lucias Sub Shop                 Aurora                        
Maia Neal                       Naperville                    
Rosemont Bakery                 Schaumburg                    
Sam Frank                       Evanston                      
Sean Smith                      Evanston                      
Tom Armstrong                   Aurora                        
Tonya Montre                    Aurora                        

19 rows selected. 
*/

--Question 5
select supplier_city
from food_supplier
INTERSECT
select city
from worker
order by supplier_city;

/*

SUPPLIER_CITY                 
------------------------------
Aurora
Chicago
Naperville
Oak Brook
Skokie

*/

--Question 6
select supplier_city
from food_supplier
minus
select city
from worker
order by supplier_city;

/*
SUPPLIER_CITY                 
------------------------------
Orland Park
Schaumburg

*/