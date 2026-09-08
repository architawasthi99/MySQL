
SELECT COUNT(*) 
from patients
WHERE strftime('%Y',birth_date)='2010'
