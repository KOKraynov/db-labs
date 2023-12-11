use cd;
-- Task-5-16: Составьте список трех крупнейших объектов, приносящих доход (включая связи).
-- Вывод названия и ранга объекта, отсортированный по рангу и названию объекта.
SELECT facility, DOXOD, 
       RANK() OVER(ORDER BY DOXOD DESC, facility ASC) AS RK
  FROM (SELECT f.facility,
			   SUM(CASE
					 WHEN m.surname like "guest" THEN f.guestcost
					 ELSE f.membercost
				   END * b.slots) AS DOXOD 
		  FROM members m, bookings b, facilities f
		  WHERE b.memid = m.memid
			AND b.facid = f.facid
		  GROUP BY f.facility) AS ST
  ORDER BY RK, facility
  LIMIT 3;