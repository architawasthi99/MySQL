--Show unique birth years from patients and order them by ascending.
SELECT DISTINCT strftime('%Y',birth_date) AS birth_year
FROM patients
ORDER by birth_year

--OR

SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER by birth_year
