use cd;
-- Task-3-4: Выберите всех членов клуба и членов, которые их рекомендовали,  отсортировав их по имени и фамилии.
select concat(m.firstname, ' ', m.surname) as name,
       concat(r.firstname, ' ', r.surname) as recommended
  from members m
  left join members r on m.recommendedby = r.memid
  order by name;