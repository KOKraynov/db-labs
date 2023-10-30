USE cd;
-- Task-3-4: Выберите всех членов клуба и членов, которые их рекомендовали,  отсортировав их по имени и фамилии.
SELECT concat(m.firstname, ' ', m.surname) AS "name",
       concat(r.firstname, ' ', r.surname) AS recommended
  FROM members m
  LEFT JOIN members r ON m.recommendedby = r.memid
  ORDER BY NAME;