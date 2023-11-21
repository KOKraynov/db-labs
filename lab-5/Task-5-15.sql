use cd;
-- Task-5-15: Составьте список участников (включая гостей) вместе с количеством часов,
-- которые они забронировали для объекта,  округленным до ближайших десяти часов.
-- Ранжируйте их по этой округленной цифре, получая в результате имя, фамилию,
-- округленные часы и звание (== ранг). Сортировка по званию (== рангу), фамилии и имени.
SELECT surname, firstname, facility, hours, 
       RANK() OVER(ORDER BY hours DESC) AS RK
  FROM (SELECT m.surname, m.firstname, f.facility,
			   round(count(1)/2, -1) as hours
		  FROM members m, bookings b, facilities f
		  WHERE b.memid = m.memid
			AND b.facid = f.facid
		  GROUP BY m.surname, m.firstname, f.facility) AS ST
  ORDER BY RK, surname, firstname;