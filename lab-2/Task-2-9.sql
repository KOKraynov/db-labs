use cd;
SELECT *
  FROM members 
  WHERE DATE(joindate) >= "2012-09-01"  
  ORDER BY 2;