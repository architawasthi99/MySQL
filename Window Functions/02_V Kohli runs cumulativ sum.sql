SELECT
CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match no.',
SUM(batsman_run) AS 'runs scored',
SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'career_runs '
FROM ipl_ball_by_ball_2008_2022
WHERE batter = 'V Kohli'
GROUP BY ID
