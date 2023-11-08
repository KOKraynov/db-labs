use cd;
-- Task-4-1:  Добавить новый объект (‘spa’), стоимость создания (initialoutlay) = 100000, 
-- стоимость обслуживания (monthlymaintenance) = 800, стоимость аренды гостем = 30, членом клуба = 20.
INSERT INTO facilities(FACID, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
  SELECT MAX(FACID) + 1,'spa', 20, 30,  100000,  800
    FROM facilities;
COMMIT;