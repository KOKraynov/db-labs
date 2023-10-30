-- Task-2-7: Выбрать объекты с ID равным 1 и 5.
use cd;
SELECT facility
  FROM facilities 
  WHERE facid IN (1, 5);