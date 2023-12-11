use cd;
-- Task-5-17: Классифицируйте объекты на группы одинакового размера (высокие, средние и низкие в зависимости от их доходов).
-- Упорядочите по классификации и названию объекта. используйте функцию деления на группы ntile.
SELECT facility, DOXOD, 
       CASE NTILE(3) OVER(ORDER BY DOXOD DESC)
         WHEN 1 THEN '1 (Высокие)'
         WHEN 2 THEN '2 (Средние)' 
         ELSE '3 (Низкие)'
       END AS cl
  FROM (SELECT f.facility,
			   SUM(CASE
					 WHEN m.surname like "guest" THEN f.guestcost
					 ELSE f.membercost
				   END * b.slots) AS DOXOD 
		  FROM members m, bookings b, facilities f
		  WHERE b.memid = m.memid
			AND b.facid = f.facid
		  GROUP BY f.facility) AS ST
  ORDER BY cl, facility;
