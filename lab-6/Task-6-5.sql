use cd;
-- Task-6-5.  Выведите наименования всех объектов клуба заглавными буквами, если они содержат в названии слово ‘Tennis’
SELECT upper(f.facility)
  FROM facilities f
  WHERE instr(lower(f.facility), 'tennis') > 0
  