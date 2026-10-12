SELECT * FROM ipl.youtube_channel_dataset;

SELECT
    YEAR(date) AS year,
    MONTHNAME(date) AS month_name,
    SUM(views) AS monthly_views,
    LAG(SUM(views)) OVER (
        ORDER BY YEAR(date), MONTH(date)
    ) AS previous_month_views,
    ((SUM(views)-LAG(SUM(views)) OVER( ORDER BY YEAR(date),MONTH(date)))/LAG(SUM(views)) OVER( ORDER BY YEAR(date),MONTH(date)))*100 AS 'percentage_change'
FROM youtube_channel_dataset
GROUP BY YEAR(date), MONTH(date), MONTHNAME(date)
ORDER BY YEAR(date), MONTH(date);
