drop table IF EXISTS #Person;
Create table  #Person (id int, email varchar(255)); 
insert into #Person (id, email) values ('1', 'a@b.com');
insert into #Person (id, email) values ('2', 'c@d.com');
insert into #Person (id, email) values ('3', 'a@b.com');
 

SELECT email 
FROM #Person
GROUP BY email 
HAVING count(email) > 1;
