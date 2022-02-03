drop table IF EXISTS #Customers;
drop table IF EXISTS #Orders;
Create table  #Customers (id int, name varchar(255))
Create table #Orders (id int, customerId int) 
insert into #Customers (id, name) values ('1', 'Joe')
insert into #Customers (id, name) values ('2', 'Henry')
insert into #Customers (id, name) values ('3', 'Sam')
insert into #Customers (id, name) values ('4', 'Max') 
insert into #Orders (id, customerId) values ('1', '3')
insert into #Orders (id, customerId) values ('2', '1')
 

select C.name as 'Customers' 
from #Customers C where C.id not in 
(select O.CustomerId from #Orders O )