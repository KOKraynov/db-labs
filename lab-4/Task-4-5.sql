use cd;
-- Task-4-5: Стоимость аренды объектов 0 и 1 изменилась (член клуба == 6, гость = 30). Обновите данные в таблицах.
UPDATE facilities
  SET membercost = 6,
      guestcost = 30
  WHERE facid in (0, 1);
COMMIT;