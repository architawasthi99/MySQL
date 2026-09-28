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
SELECT
    name,
    marks,
    NTH_VALUE(marks, 2) OVER(
        ORDER BY marks DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS second_highest
FROM marks;

--FIND THE BRANCH TOPPERS
