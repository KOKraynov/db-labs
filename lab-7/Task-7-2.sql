CREATE TABLE payments(
  payid INT PRIMARY KEY AUTO_INCREMENT, 
  bookid integer not null,
  FOREIGN KEY (bookid) REFERENCES bookings (bookid),
  payment DECIMAL
  );