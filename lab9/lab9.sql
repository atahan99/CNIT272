select sum (ip.weight * si.quantityshipped) as Weight , ip.categoryid , s.shipstate 
from shipment s inner join shippeditem si
on s.orderid = si.orderid
inner join inventorypart ip
on ip.partnumber = si.partnumber
where (categoryid in ('COMP','CBL','BASE','PROC')) and (s.shipstate in ('IN','IL','MI','WI','OH'))
group by ip.categoryid , s.shipstate;

