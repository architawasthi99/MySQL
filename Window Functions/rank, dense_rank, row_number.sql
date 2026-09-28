CREATE DATABASE College;

CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51)


--FIND ALL STUDENTS WHO HAVE MARKS HIGHER THAN THE AVG MARKS OF THEIR RESPECTIVE BRANCH
SELECT * 
FROM marks(
  SELECT *,AVG(marks) OVER(PARTITION BY branch) AS avg_branch
  FROM marks
)t
WHERE marks > avg_branch;

--FIND THE LOWEST AND HIGHEST NUMBERS
SELECT *, 
MAX(marks) OVER() AS 'overall_max', 
MIN(marks) OVER() AS 'overall_min',
MIN(marks) OVER(PARTITION BY branch) AS 'branch_min',
MAX(marks) OVER(PARTITION BY branch) AS 'branch_max'
FROM marks
ORDER BY student_id

--RANK/DENSE_RANK/ROW_NUMBER
SELECT *,
RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Rank'
FROM marks
  
//

SELECT *,
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC) AS 'Rank'
FROM marks

//

SELECT *,
ROW_NUMBER() OVER(PARTITION BY branch) AS 'Rank'
FROM marks

--TOP 2 MOST PAYING CUSTOMER OF EACH MONTH
SELECT * 
FROM(
  SELECT MONTHNAME(date) AS 'months',user_id,SUM(amount) AS 'total_expense',
  RANK() OVER(PARTITION BY months ORDER BY total_expense ) AS 'rank'
  FROM orders
  GROUP BY MONTHNAME(date),user_id
  ORDER BY MONTH(date)
)t
WHERE t.rank < 3
ORDER BY months DESC, rank ASC
  










