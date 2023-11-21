use cd;
-- Task-6-6.  Выведите все объектов клуба, если они содержат в названии слово  ‘Tennis’ в произвольном регистре.
SELECT f.facility
  FROM facilities f
  WHERE F.facility LIKE '%tEnnis%'
