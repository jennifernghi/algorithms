
drop table IF EXISTS #Employee ;
CREATE TABLE #Employee (
    id INT PRIMARY KEY,
    name varchar(20),
	salary int,
	managerId int
);


insert into #Employee values(1, 'Joe', 70000, 3);
insert into #Employee values(2, 'Henry', 80000, 4);
insert into #Employee values(3, 'Sam', 60000,  null);
insert into #Employee values(4, 'Max', 90000,  null);

select name as Employee
from #Employee as out
where salary>
(select salary
from #Employee as temp
where temp.id=out.managerid) 
 
