-- Task-2-3: Выбрать объекты, пользование которых бесплатно для членов клуба.
use cd;
SELECT facility, membercost 
  FROM facilities 
  WHERE membercost = 0;