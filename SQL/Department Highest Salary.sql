drop table IF EXISTS #Employee;
drop table IF EXISTS #Department;
Create table #Employee (id int, name varchar(255), salary int, departmentId int)
Create table #Department (id int, name varchar(255))

insert into #Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into #Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into #Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into #Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into #Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')
 
insert into #Department (id, name) values ('1', 'IT')
insert into #Department (id, name) values ('2', 'Sales')

select * from #Employee;
select * from #Department;

select b.name as Department, a.name as Employee, a.salary as Salary
from (
select a.*, DENSE_RANK() over (partition by a.departmentId order by a.salary desc) as rank
from #Employee a ) a
join #Department b on a.departmentId = b.id
where a.rank = 1