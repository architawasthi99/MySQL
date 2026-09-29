--FIRST_VALUE
SELECT student_id,name,marks,
FIRST_VALUE(marks) OVER(ORDER BY marks DESC) AS 'highest_marks'
FROM marks; 

--LAST_VALUE
SELECT student_id,name,marks,
LAST_VALUE(marks) OVER(ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'highest_marks'
FROM marks;

--NTH_VALUE
SELECT * , 
NTH_VALUE(name,2) OVER(PARTITION BY branch ORDER BY marks DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'sencond highest'
FROM marks

--FIND THE BRANCH TOPPERS (print name,branch,marks)
    --Using FIRST_VALUE()
SELECT name,branch,marks
FROM(SELECT * ,
	FIRST_VALUE(name) OVER(PARTITION BY branch ORDER BY marks DESC) AS 'topper_name',
	FIRST_VALUE(marks) OVER(PARTITION BY branch ORDER BY marks DESC) AS 'topper_marks'
	FROM marks)t
WHERE t.name=t.topper_name AND t.marks=t.topper_marks

    -- Using RANK()
SELECT name,branch,marks
FROM (
    SELECT *,
    RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Rank'
    FROM marks
)t
WHERE t.rank=1;   --{same marks also displayed}

    --Using DENSE_RANK()
	SELECT name,branch,marks
	FROM (
		SELECT *,
		DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Rank'
		FROM marks
	)t
	WHERE t.rank=1; --{same result because we want rank 1}

   --ROW_NUMBER()
	SELECT name,branch,marks
	FROM (
		SELECT *,
		row_number() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Rank'
		FROM marks
	)t
	WHERE t.rank=1; 
