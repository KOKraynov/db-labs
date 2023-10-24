use cd;
-- Task-3-1: Выберите лист времке  (timestamp) покупки времени использования объектов членом клуба 'David Farrell'.
select b.starttime
  from members m, bookings b
  where m.memid = b.memid
	and concat(m.firstname, ' ', m.surname) like '%David Farrell%';