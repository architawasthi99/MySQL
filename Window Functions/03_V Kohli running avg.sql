SELECT * 
FROM(
SELECT
CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run) AS 'runs scored',
SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'career_runs ',
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'cumulative_avg_runs  ',
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS 'running_avg'
FROM ipl_ball_by_ball_2008_2022
WHERE batter = 'V Kohli'
GROUP BY ID)t
