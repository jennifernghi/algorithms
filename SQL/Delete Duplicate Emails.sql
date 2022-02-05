drop table IF EXISTS #Person;
Create table  #Person (Id int, Email varchar(255))
Truncate table #Person
insert into #Person (id, email) values ('1', 'john@example.com')
insert into #Person (id, email) values ('2', 'bob@example.com')
insert into #Person (id, email) values ('3', 'john@example.com')

delete from #Person
where id in (
select id from (
select *, row_number() over ( partition by  email order by id) as rank
from #Person ) a
where a.rank > 1 )

select * from #Person