-- Task-2-5: Выбрать объекты, которые платны для членов клуба, 
-- но стоимость использование не превышает 1/50 от стоимость месячного обслуживания (monthlymaintenance).
use cd;
SELECT facility, membercost 
  FROM facilities 
  WHERE membercost > 0
    AND membercost <= monthlymaintenance / 50;