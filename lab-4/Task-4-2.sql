use cd;
-- Task-4-2: Добавить (одновременно)  два сквош-корта (2 и 3 == ‘Squash Court 2’, ‘Squash Court 3’) 
-- со стоимостью создания = 5000, стоимостью обслуживания = 80, стоимостью аренды для членов клуба = 3.5, а гостей - 17.5.
INSERT INTO facilities(FACID, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
  SELECT MAX(FACID) + 1,'Squash Court 2', 3.5, 17.5,  5000,  80
    FROM facilities
  UNION
  SELECT MAX(FACID) + 2,'Squash Court 3', 3.5, 17.5,  5000,  80
    FROM facilities;
COMMIT;