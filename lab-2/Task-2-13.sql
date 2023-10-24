use cd;
SELECT surname, firstname, joindate
  FROM members 
  where joindate in (select max(joindate) from members)
  ORDER BY 1;