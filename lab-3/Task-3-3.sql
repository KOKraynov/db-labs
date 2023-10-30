USE cd;
-- Task-3-3: Выберите членов клуба, которые рекомендовали других членов для вступления.
SELECT concat(m.firstname, ' ', m.surname) as name
  FROM members m
  WHERE m.memid IN (SELECT DISTINCT r.recommendedby
                      FROM members r
                      WHERE r.recommendedby IS NOT NULL);