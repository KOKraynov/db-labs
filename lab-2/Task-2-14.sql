-- Task-2-14: Выберите самый дорогой и самый дешевый объект.
USE cd;
SELECT facility, initialoutlay
  FROM facilities
  WHERE initialoutlay IN (SELECT min(initialoutlay) FROM facilities)
	OR initialoutlay IN (SELECT max(initialoutlay) FROM facilities);