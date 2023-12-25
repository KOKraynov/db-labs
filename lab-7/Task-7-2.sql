USE cd;
CREATE TABLE payments(
  payid INT PRIMARY KEY AUTO_INCREMENT, 
  bookid integer not null,
  FOREIGN KEY (bookid) REFERENCES bookings (bookid),
  payment DECIMAL
  );
  
ALTER TABLE bookings ADD COLUMN payed BINARY(1) DEFAULT 0;

DELIMITER //

DROP TRIGGER IF EXISTS TD_bookings //

CREATE TRIGGER TD_bookings BEFORE DELETE ON bookings 
  FOR EACH ROW 
BEGIN
  IF (OLD.payed = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Can not delete a paid booking!';
  END IF;
END//

DROP TRIGGER IF EXISTS TU_bookings //

CREATE TRIGGER TU_bookings BEFORE UPDATE ON bookings
FOR EACH ROW
BEGIN
  CASE
	WHEN (NEW.payed = 1) AND (OLD.payed = 0) THEN
	  INSERT INTO payments(bookid, payment)
		VALUES(NEW.bookid, F_GET_AREND(new.bookid, NEW.memid, NEW.facid, NEW.slots));
	WHEN (NEW.payed = 0) AND (OLD.payed = 1) THEN
	  DELETE FROM payments p 
        WHERE p.bookid = NEW.bookid;
  END CASE;
END //

DROP TRIGGER IF EXISTS TI_bookings //

CREATE TRIGGER TI_bookings AFTER INSERT ON bookings 
FOR EACH ROW
BEGIN
  IF NEW.payed = 1 THEN
	INSERT INTO payments(bookid, payment)
	  VALUES(NEW.bookid, F_GET_AREND(new.bookid, NEW.memid, NEW.facid, NEW.slots));
  END IF;
END //

DELIMITER ;

UPDATE bookings 
  SET payed = 1
  WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;
SELECT SUM(payment) as Arend201207
  FROM payments;
SELECT SUM(F_GET_AREND(bookid, memid, facid, slots)) as Arend201207
  FROM bookings 
  WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;