use cd;
-- Task-6-5.  Выведите наименования всех объектов клуба заглавными буквами, если они содержат в названии слово ‘Tennis’
SELECT upper(f.facility)
  FROM facilities f
  WHERE BINARY facility LIKE '%Tennis%';
  