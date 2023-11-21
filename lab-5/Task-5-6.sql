use cd;
-- Task-5-6:  Составьте список общего количества бронирований на каждый объект в месяц в 2012 году.
SELECT f.facility, month(b.starttime), count(*)
  FROM bookings b, facilities f
  WHERE b.facid = f.facid
    AND year(b.starttime) = 2012
  GROUP BY f.facility, month(b.starttime);