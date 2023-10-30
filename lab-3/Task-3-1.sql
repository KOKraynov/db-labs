USE cd;
-- Task-3-1: Выберите лист времке  (timestamp) покупки времени использования объектов членом клуба 'David Farrell'.
SELECT b.starttime
  FROM members m, bookings b
  WHERE m.memid = b.memid
	AND concat(m.firstname, ' ', m.surname) = 'David Farrell';