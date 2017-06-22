drop table if exists test.user;

CREATE TABLE user (
  id int(8) NOT NULL AUTO_INCREMENT,
  name varchar(25) NOT NULL,
  age int(11) NOT NULL,
  isAdmin bit(1) NOT NULL DEFAULT b'0',
  createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)
  ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;


INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Evan',23,0,'2017-01-05 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Dan',23,0,'2017-02-07 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Knut',22,0,'2016-03-23 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Mark',22,0,'2015-04-24 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Ivan',24,0,'2014-05-25 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Dmitry',25,0,'2013-06-26 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Elvin',24,0,'2017-07-02 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Elvis',22,0,'2017-08-01 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Kevin',25,0,'2017-09-11 00:00:00');
INSERT INTO `test`.`user`(`name`,`age`,`isAdmin`,`createdDate`) VALUES('Don',23,0,'2017-06-25 00:00:00');