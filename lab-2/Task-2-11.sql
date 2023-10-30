-- Task-2-11: Объедините имена членов и названия объектов в обдну таблицу с одним столбцом.
SELECT distinct concat( m.surname, ' ', m.firstname, ' - ', f.facility )
  FROM members m, facilities f, bookings b
  WHERE b.memid = m.memid
    AND b.facid = f.facid;