/*DDL 정보*/------------

drop table tbl_board;
CREATE TABLE tbl_board (
  idx INT(11) NOT NULL ,
  memID varchar(20) not null,
  title VARCHAR(100) NOT NULL,
  content VARCHAR(2000) NOT NULL,
  writer VARCHAR(30) NOT NULL,
  indate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  COUNT INT(11) DEFAULT 0,
  board_group int,
  board_sequence int,
  board_level int,
  board_available int,  
  PRIMARY KEY (idx)
) ENGINE=INNODB DEFAULT CHARSET=utf8

CREATE TABLE tbl_ (
  memIdx INT(11) NOT NULL,
  memID VARCHAR(20) NOT NULL,
  memPassword VARCHAR(68) NOT NULL,
  memName VARCHAR(20) NOT NULL,
  memAge INT(11) DEFAULT NULL,
  memGender VARCHAR(20) DEFAULT NULL,
  memEmail VARCHAR(50) DEFAULT NULL,
  memProfile VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (memIdx),
  UNIQUE KEY memID (memID)
) ENGINE=INNODB DEFAULT CHARSET=utf8