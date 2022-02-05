drop table IF EXISTS #Weather;
Create table  #Weather (id int, recordDate date, temperature int)
 
insert into #Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into #Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into #Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into #Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')
select id
from #Weather as w1 
    where DATEDIFF(day,(
       select TOP 1 recorddate as one
       from #Weather as w2
       where w1.recordDate>w2.recordDate and w1.temperature>w2.temperature
       order by recorddate desc
),w1.recorddate)=1;