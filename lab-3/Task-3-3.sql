use cd;
-- Task-3-3: Выберите членов клуба, которые рекомендовали других членов для вступления.
select concat(m.firstname, ' ', m.surname) as name
  from members m
  where m.memid in (select distinct r.recommendedby
                      from members r
                      where r.recommendedby is not null);