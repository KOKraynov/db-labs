use cd;
-- Task-4-3: Добавьте еще одно spa с такими же характеристиками как в задании 1, сгенерировав новое ID.
INSERT INTO facilities(FACID, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
  SELECT MAX(FACID) + 1,'spa', 20, 30,  100000,  800
    FROM facilities;
COMMIT;
-- Эта конструкция может бесконечно добавлять с новыми ID