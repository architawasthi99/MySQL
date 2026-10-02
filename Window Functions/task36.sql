--Problem 1: What are the top 5 patients who claimed the highest insurance amounts?
SELECT *
FROM(
    SELECT *,
    ROW_NUMBER() OVER(ORDER BY claim DESC) as rn
    FROM insurance_data
)t
WHERE rn<=5
