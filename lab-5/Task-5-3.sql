use cd;
-- Task-5-3:  Рассчитайте для каждого члена количество рекомендаций, 
-- данных этим членом клуба, искючив членов, которые не давали рекомендаций.
SELECT m2.surname, m2.firstname, count(*)
  FROM members m1, members m2
  WHERE m1.recommendedby = m2.memid
  GROUP BY m2.surname, m2.firstname;