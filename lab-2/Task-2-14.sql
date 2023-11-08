-- Task-2-14: Выберите самый дорогой и самый дешевый объект.
USE cd;
SELECT facility, initialoutlay
  FROM facilities f, 
       (SELECT min(initialoutlay) as mn,
               max(initialoutlay) as mx
          FROM facilities) as mm
  WHERE initialoutlay = mn
    or initialoutlay = mx;