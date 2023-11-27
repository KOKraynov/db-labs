use cd;
-- Task-5-4:  Рассчитайте количество аренд каждого из объектов клуба.
SELECT f.facility, sum(b.slots)
  FROM bookings b, facilities f
  WHERE b.facid = f.facid
  GROUP BY f.facility;