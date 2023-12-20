CREATE DATABASE potatos;

use potatos;

CREATE TABLE UNSORT_DATA(
  COLUMN_000 VARCHAR(10),
  COLUMN_001 VARCHAR(10),
  COLUMN_002 VARCHAR(10),
  COLUMN_003 VARCHAR(10),
  COLUMN_004 VARCHAR(10),
  COLUMN_005 VARCHAR(10),
  COLUMN_006 VARCHAR(10),
  COLUMN_007 VARCHAR(10),
  COLUMN_008 VARCHAR(10),
  COLUMN_009 VARCHAR(10)
  );
  
CREATE TABLE potatos(
  potato_id int primary key AUTO_INCREMENT,
  color varchar(100)
  );

CREATE TABLE waves(
  wave_id int primary key AUTO_INCREMENT,
  lyambda float NOT NULL
  );

CREATE TABLE exp_datas(
  id int primary key AUTO_INCREMENT,
  potato_id INT NOT NULL,
  FOREIGN KEY (potato_id) REFERENCES potatos(potato_id),
  wave_id INT NOT NULL,
  FOREIGN KEY (wave_id) REFERENCES waves(wave_id),
  measurement FLOAT NOT NULL
  );