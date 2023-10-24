use cd;
SELECT facility, membercost 
  FROM facilities 
  WHERE membercost <> 0
  ORDER BY facility;