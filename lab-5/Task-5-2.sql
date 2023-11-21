use cd;
-- Task-5-2: Рассчитайте количество зарегистрированных объектов в теннисном клубе, 
-- стоимость аренды гостя в котором не менее 10.
SELECT count(*)
  FROM facilities f
  WHERE f.facility LIKE '%TENNIS%'
    AND f.guestcost >= 10;