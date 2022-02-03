drop table IF EXISTS #Log;
CREATE TABLE #Log (
    id INT,
    num INT
);

INSERT INTO #Log values(1, 1);
INSERT INTO #Log values(2, 1);
INSERT INTO #Log values(3, 1);
INSERT INTO #Log values(4, 2);
INSERT INTO #Log values(5, 1);
INSERT INTO #Log values(6, 2);
INSERT INTO #Log values(7, 2);


select * from #Log;
WITH CTE AS (
	SELECT *, LAG(NUM) OVER (ORDER BY ID ASC) AS LAGGED, LEAD(NUM) OVER(ORDER BY ID ASC) AS LEADED FROM #Log
)
SELECT DISTINCT(NUM) AS ConsecutiveNums  FROM CTE WHERE LEADED = LAGGed AND NUM = LAGGED;
