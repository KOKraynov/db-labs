use cd;
SELECT facility, membercost 
  FROM facilities 
  WHERE NOT membercost = 0
    AND monthlymaintenance <= membercost * 50
  ORDER BY facility;