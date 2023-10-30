-- Task-2-6: Выбрать объекты, включаящие слово 'Tennis'.
use cd;
SELECT facility
  FROM facilities 
  WHERE facility LIKE '%Tennis%';