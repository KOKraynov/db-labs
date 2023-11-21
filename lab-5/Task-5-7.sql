use cd;
-- Task-5-7: Найдите общее количество участников (члены + гости), совершивших хотя бы одно бронирование.
SELECT count(*)
  FROM members m
  WHERE EXISTS (SELECT 1 FROM bookings b
			      WHERE b.memid = m.memid);