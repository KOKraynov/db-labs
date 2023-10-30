-- Task-2-12: Найдите дату последней регистрации члена клуба.
use cd;
SELECT max(joindate)
  FROM members;