use cd;
-- Task-6-1. Выберите начальное и конечное время последних 10 аренд  объектов, упорядочив их по времени их окончания.
SELECT b.starttime, ADDTIME(b.starttime, SEC_TO_TIME(slots*1800))
  FROM bookings b
  ORDER BY 2 DESC
  LIMIT 10
  