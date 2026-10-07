SELECT *
FROM(
    SELECT BattingTeam,batter,SUM(batsman_run) AS 'total_runs',
    DENSE_RANK() OVER( PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC ) AS 'rank_within_team'
    FROM ipl_ball_by_ball_2008_2022
    GROUP BY BattingTeam,batter
)t
WHERE t.rank_within_team<6
