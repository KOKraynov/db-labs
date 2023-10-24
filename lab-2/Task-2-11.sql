use cd;
SELECT distinct concat( m.surname, ' ', m.firstname, ' - ', f.facility )
  FROM members m, facilities f
  ORDER BY 1;