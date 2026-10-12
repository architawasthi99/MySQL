SELECT *,
((views-LAG(views,7) OVER (ORDER BY Date))/LAG(views,7) OVER (ORDER BY Date))*100 AS 'weekly_%_change'
FROM youtube_channel_dataset;
