use cd;
SELECT facility
  FROM facilities 
  WHERE facid IN (1, 5)
  ORDER BY facility;