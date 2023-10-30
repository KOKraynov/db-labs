-- Task-2-4: Выбрать объекты, пользование которых платно для членов клуба
SELECT facility, membercost 
  FROM facilities 
  WHERE membercost <> 0;