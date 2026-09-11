--Show the total amount of male patients and the total amount of female patients in the patients table.
--Display the two results in the same row.

--MYSQL
SELECT
    SUM(IF(gender='M',1,0)) AS male_count,
    SUM(IF(gender='F',1,0)) AS female_count
FROM patients

--OTHERS
SELECT
    SUM(CASE WHEN gender='M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender='F' THEN 1 ELSE 0 END) AS female_count
FROM patients;  
