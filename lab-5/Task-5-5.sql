use cd;
-- Task-5-5:  Рассчитайте количество аренд каждого из объектов клуба за сентябрь 2012 года.
SELECT f.facility, sum(b.slots)
  FROM bookings b, facilities f
  WHERE b.facid = f.facid
    AND b.starttime >= "2012-09-01"
    AND b.starttime < "2012-10-01"
  GROUP BY f.facility;