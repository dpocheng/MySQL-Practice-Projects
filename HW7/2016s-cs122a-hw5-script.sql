# Drop and Create database
DROP DATABASE IF EXISTS CS122a;
CREATE DATABASE CS122a;
USE CS122a;


# Dump of table Airplane

DROP TABLE IF EXISTS `Airplane`;

CREATE TABLE `Airplane` (
  `registration_number` varchar(10) NOT NULL,
  `model_number` varchar(10) DEFAULT NULL,
  `purchased_year` int(11) DEFAULT NULL,
  `manufactured_year` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Airplane` (`registration_number`, `model_number`, `purchased_year`, `manufactured_year`, `capacity`)
VALUES
	('N12345','B747',2007,2005,467),
	('N17523','A380',2010,2009,555),
	('N23456','B787',2009,2008,290),
	('N98765','B737',2013,1990,190),
	('N90001','A320',2011,1999,150),
	('N90002','A330',2012,2000,400),
	('N90003','A340',2013,2001,350),
	('N90004','A380',2015,2015,850),
	('N90005','B777',2014,2012,310);


# Dump of table Airport

DROP TABLE IF EXISTS `Airport`;

CREATE TABLE `Airport` (
  `IATA_code` char(3) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `airport_city` varchar(20) DEFAULT NULL,
  `airport_state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IATA_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Airport` (`IATA_code`, `name`, `airport_city`, `airport_state`)
VALUES
	('JFK','John F. Kennedy International Airport','New York ','NY'),
	('LAX','Los Angeles International Airport','Los Angeles','CA'),
	('SAT','San Antonio International Airport  ','San Antonio','TX'),
	('SNA','John Wayne Airport','Santa Ana','CA'),
	('LGB','Long Beach Airport','Long Beach','CA'),
	('SAN','San Diego International Airport','San Diego','CA'),
	('SJC','San Jose International Airport','San Jose','CA'),
	('SFO','San Francisco International Airport','San Francisco','CA');




# Dump of table Customer

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `cid` int(11) NOT NULL,
  `ssn` char(9) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_state` varchar(20) DEFAULT NULL,
  `address_zipcode` char(5) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Customer` (`cid`, `ssn`, `gender`, `email`, `address_street`, `address_city`, `address_state`, `address_zipcode`)
VALUES
	(1,'988843736','M','153m@4bjsvkd6f.com','9091 Spectrum Pointe Drive','Lake Forest','CA','92630'),
	(2,'582902877','F','gimodc@qg5a543.com','9091 Watermarke Place','Irvine','CA','92612'),
	(3,'455171051','F','l91bi@rds0z4ct9n2d.com','9091290 North Hancock Street','Anaheim','CA','92807'),
	(4,'117911362','F','r1d0800121@8w-4lb.com','90914780 Pipeline Avenue','Chino Hills','CA','91709'),
	(5,'813694086','M','eu3@4l4ligbm2d4.com','90914851 Jeffrey Road','Irvine','CA','92618'),
	(6,'830930154','F','2ldx.6l9@pk11l2s.com','90915241 Laguna Canyon Road','Irvine','CA','92618'),
	(7,'481161938','F','ijvbv5hx@e0z8o6w.com','9091536 East Warner Avenue','Santa Ana','CA','92705'),
	(8,'340130873','M','iz4tvg5j0e.@otiw34ymv68z.com','9091536 West Warner Avenue','Santa Ana','CA','92705'),
	(9,'140686813','M','xhrh8pptf0bm2@ki4jwmsiek.com','90915661 Red Hill Avenue','Tustin','CA','92780'),
	(10,'670322800','M','93nwu_g3pow65d@0zekopshz.com','90916470 Bake Parkway','Irvine','CA','92618'),
	(11,'145282363','M','gmzs@hdm9q8rpd.com','90924367 Von Karman Avenue','Irvine','CA','92606'),
	(12,'459777569','F','s4yk8@v006nomucpd.com','90917772 17th Street','Tustin','CA','92780'),
	(13,'891455675','F','42-8b8@l0m1bttskf3.com','909195 North Euclid Avenue','Upland','CA','91786'),
	(14,'958708596','M','3ewd@s8xum24csra.com','90937654 Savi Ranch Pkwy','Yorba Linda','CA','92887'),
	(15,'662905075','M','9zsiot3@8aab4f3tj.com','90923046 Avenida De La Carlota','Laguna Hills','CA','92653'),
	(16,'390453600','F','4ikmvae@xsvx5etrv2.com','90923726 Birtcher Drive','Lake Forest','CA','92630'),
	(17,'908856821','M','s3et50zvq-9b1@dlayle.com','9092603 Main Street','Irvine','CA','92614'),
	(18,'989812336','M','2-z6sf@oh-sz1whst6.com','90927261 Las Ramblas','Mission Viejo','CA','92691'),
	(19,'22152601','F','5-.@rblrzxw-ql9c.com','90931 Creek Road','Irvine','CA','92604'),
	(20,'261504907','M','iuxh@al8wsoem.com','90932565 Golden Lantern St.','Dana Point','CA','92629');


# Dump of table Credit_Card

DROP TABLE IF EXISTS `Credit_Card`;

CREATE TABLE `Credit_Card` (
  `cid` int(11) DEFAULT NULL,
  `card_number` varchar(20) NOT NULL,
  `expr_date` char(6) DEFAULT NULL,
  PRIMARY KEY (`card_number`),
  KEY `cid` (`cid`),
  CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Credit_Card` (`cid`, `card_number`, `expr_date`)
VALUES
	(1,'6304024332622300','201812'),
	(2,'630412174737258','202004'),
	(3,'6304429389692652','201808'),
	(4,'6304679458477656','202103'),
	(5,'670606318399688','201910'),
	(6,'6706128880281791','202107'),
	(7,'6706132245942255','201801'),
	(8,'6706765266242193','201805'),
	(9,'6706781561247840','202102'),
	(10,'6706968896765021','202010'),
	(11,'6709243479317623','202107'),
	(12,'670948959313969','202109'),
	(13,'6709897613915008','202104'),
	(14,'6709951136973132','202008'),
	(15,'6709954900858513','201909'),
	(16,'6709973267001367','201903'),
	(17,'6771091258473167','202002'),
	(18,'6771613848432668','202101'),
	(19,'6771750197139891','202109'),
	(20,'6771881004597828','201803'),
	(1,'6771881224597828','201804'),
	(1,'6771881224597800','201805'),
	(1,'7718812245978280','201806');


# Dump of table Flight

DROP TABLE IF EXISTS `Flight`;

CREATE TABLE `Flight` (
  `flight_number` varchar(8) NOT NULL,
  `projected_departure_datetime` datetime NOT NULL,
  `projected_arrival_datetime` datetime DEFAULT NULL,
  `aiplane_registration_number` varchar(10) DEFAULT NULL,
  `departure_airport_IATA_code` char(3) DEFAULT NULL,
  `actual_departure_datetime` datetime DEFAULT NULL,
  `arrival_airport_IATA_code` char(3) DEFAULT NULL,
  `actual_arrival_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`flight_number`,`projected_departure_datetime`),
  KEY `aiplane_registration_number` (`aiplane_registration_number`),
  KEY `departure_airport_IATA_code` (`departure_airport_IATA_code`),
  KEY `arrival_airport_IATA_code` (`arrival_airport_IATA_code`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`aiplane_registration_number`) REFERENCES `Airplane` (`registration_number`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`departure_airport_IATA_code`) REFERENCES `Airport` (`IATA_code`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`arrival_airport_IATA_code`) REFERENCES `Airport` (`IATA_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Flight` (`flight_number`, `projected_departure_datetime`, `projected_arrival_datetime`, `aiplane_registration_number`, `departure_airport_IATA_code`, `actual_departure_datetime`, `arrival_airport_IATA_code`, `actual_arrival_datetime`)
VALUES
	('N124','2015-08-09 08:21:00','2015-08-09 08:41:00','N23456','LAX','2015-08-09 08:51:00','SNA','2015-08-09 09:21:00'),
	('N124','2015-09-07 08:21:00','2015-09-07 08:41:00','N23456','LAX','2015-09-07 08:21:00','SNA','2015-09-07 08:41:00'),
	('N124','2015-10-07 08:21:00','2015-10-07 08:41:00','N23456','LAX','2015-09-07 08:21:00','SNA','2015-09-07 08:51:00'),
	('U987','2015-06-07 10:23:00','2015-06-07 21:23:00','N17523','SNA','2015-06-07 10:23:00','JFK','2015-06-07 21:25:00'),
	('U987','2015-07-07 10:23:00','2015-07-07 21:23:00','N17523','SNA','2015-07-07 10:23:00','JFK','2015-07-07 22:25:00'),
	('U987','2015-08-07 10:23:00','2015-08-07 21:23:00','N17523','SNA','2015-08-07 10:23:00','JFK','2015-08-07 21:55:00'),
	('U987','2015-09-07 10:23:00','2015-09-07 21:23:00','N17523','SNA','2015-09-07 10:24:00','JFK','2015-09-07 21:24:00'),
	('U987','2015-10-07 10:23:00','2015-10-07 21:23:00','N17523','SNA','2015-10-07 10:27:00','JFK','2015-10-07 21:27:00'),
	('UC725','2015-10-11 11:25:00','2015-10-11 12:25:00','N98765','SNA','2015-10-11 11:19:00','SFO','2015-10-11 12:19:00'),
	('UC725','2015-10-12 11:25:00','2015-10-12 12:25:00','N98765','SNA','2015-10-12 11:29:00','SFO','2015-10-12 12:29:00'),
	('UC725','2015-10-13 11:25:00','2015-10-13 12:25:00','N98765','SNA','2015-10-13 11:39:00','SFO','2015-10-13 12:39:00'),
	('UC725','2015-10-14 11:25:00','2015-10-14 12:25:00','N98765','SNA','2015-10-14 11:49:00','SFO','2015-10-14 12:49:00'),
	('UC725','2015-10-15 11:25:00','2015-10-15 12:25:00','N98765','SNA','2015-10-15 11:59:00','SFO','2015-10-15 12:59:00'),
	('UC6024','2016-01-02 06:45:00','2016-01-02 08:30:00','N90001','SFO','2016-01-02 06:40:00','SNA','2016-01-02 08:10:00'),
	('UC6024','2016-01-03 06:45:00','2016-01-03 08:30:00','N90002','SFO','2016-01-03 06:45:00','SNA','2016-01-03 08:20:00'),
	('UC6024','2016-01-04 06:45:00','2016-01-04 08:30:00','N90003','SFO','2016-01-04 06:55:00','SNA','2016-01-04 08:45:00'),
	('UC6024','2016-01-05 06:45:00','2016-01-05 08:30:00','N90003','SFO','2016-01-05 06:55:00','SNA','2016-01-05 08:55:00'),
	('UC2084','2016-02-01 10:35:00','2016-02-01 11:50:00','N90004','SJC','2016-02-01 10:35:00','SNA','2016-02-01 11:50:00'),
	('UC2084','2016-02-02 10:35:00','2016-02-02 11:50:00','N90004','SJC','2016-02-02 10:45:00','SNA','2016-02-02 11:58:00'),
	('UC2084','2016-02-03 10:35:00','2016-02-03 11:50:00','N90004','SJC','2016-02-03 10:55:00','SNA','2016-02-03 11:57:00'),
	('UC2084','2016-02-04 10:35:00','2016-02-04 11:50:00','N90004','SJC','2016-02-04 10:15:00','SNA','2016-02-04 11:40:00'),
	('UC2084','2016-02-05 10:35:00','2016-02-05 11:50:00','N90004','SJC','2016-02-05 10:25:00','SNA','2016-02-05 11:20:00'),
	('UC2084','2016-02-06 10:35:00','2016-02-06 11:50:00','N90004','SJC','2016-02-06 10:25:00','SNA','2016-02-06 12:40:00');


# Dump of table FlightAttendant

DROP TABLE IF EXISTS `FlightAttendant`;

CREATE TABLE `FlightAttendant` (
  `faid` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_state` varchar(20) DEFAULT NULL,
  `address_zipcode` char(5) DEFAULT NULL,
  `service_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`faid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `FlightAttendant` (`faid`, `phone_number`, `birthdate`, `ssn`, `job_title`, `address_street`, `address_city`, `address_state`, `address_zipcode`, `service_year`)
VALUES
	(990301,'314-471-6335','1991-10-21','388667456','Purser','234 Valley View Drive','Holly Springs','FL','33010',1),
	(990302,'623-217-2561','1992-01-05','546373819','Chief Purser','349 Devon Court','Lutherville Timonium','NC','27540',7),
	(990303,'623-217-2562','1992-01-06','546373810','Purser','350 Devoni Court','Irvine','CA','92697',2),
	(990304,'623-217-2563','1992-01-07','546373811','Purser','2350 Ion Dr','Long Beach','CA','91693',3);



# Dump of table Lounge

DROP TABLE IF EXISTS `Lounge`;

CREATE TABLE `Lounge` (
  `lid` int(11) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `airport_IATA_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `airport_IATA_code` (`airport_IATA_code`),
  CONSTRAINT `lounge_ibfk_1` FOREIGN KEY (`airport_IATA_code`) REFERENCES `Airport` (`IATA_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Lounge` (`lid`, `location`, `airport_IATA_code`)
VALUES
	(112,'section D32','SNA'),
	(113,'section E21','SNA'),
	(212,'section C12','SAT'),
	(213,'section C24','SAT'),
	(314,'section A12','JFK'),
	(315,'section D12','JFK'),
	(409,'section B15','LAX'),
	(501,'section A01','SFO'),
	(502,'section A02','SFO'),
	(503,'section A03','SFO'),
	(601,'section K09','SJC'),
	(404,'section D19','LGB'),
	(84,'section B06','SAN');


# Dump of table MaintenanceEngineer

DROP TABLE IF EXISTS `MaintenanceEngineer`;

CREATE TABLE `MaintenanceEngineer` (
  `meid` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_state` varchar(20) DEFAULT NULL,
  `address_zipcode` char(5) DEFAULT NULL,
  `skill` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`meid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `MaintenanceEngineer` (`meid`, `phone_number`, `birthdate`, `ssn`, `job_title`, `address_street`, `address_city`, `address_state`, `address_zipcode`, `skill`)
VALUES
	(990001,'804-543-7860','1989-12-23','187826814','Senior Engineer','984 Wood Street','Bolingbrook','IL','60440','Engines, Mechanincal'),
	(990002,'219-775-7988','1987-03-21','281653141','junior engineer','847 Route 44','Orange','NJ','07050','Airframes, Engines'),
	(990003,'817-712-3731','1989-12-25','968920642','senior engineer','216 Washington Avenue','Worcester','MA','01604','Electrical Systems'),
	(990004,'850-338-7148','1983-12-22','461306391','Speicialist','262 Aspen Court','Far Rockaway','NY','11691','Physics'),
	(990005,'724-938-6285','1989-08-09','811035535','Principal Engineer','232 Locust Street','Palm Bay','FL','32907','Mechanical'),
	(990006,'724-938-6286','1989-08-10','811035536','Engineer','233 Locus Street','Palm Bay','FL','32908','Engines, Airframes');


# Dump of table OperationStaff

DROP TABLE IF EXISTS `OperationStaff`;

CREATE TABLE `OperationStaff` (
  `osid` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_state` varchar(20) DEFAULT NULL,
  `address_zipcode` char(5) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`osid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `OperationStaff` (`osid`, `phone_number`, `birthdate`, `ssn`, `job_title`, `address_street`, `address_city`, `address_state`, `address_zipcode`, `department`)
VALUES
	(990101,'954-465-7930','1989-06-28','282462223','Senior Staff','557 Warren Avenue','Shepherdsville','KY','40165','Customer Service'),
	(990102,'847-647-4341','1989-05-29','929040801','Junior Staff','223 Mulberry Lane','Asbury Park','GA','30075','Quality Ensurance'),
	(990103,'508-983-8873','1984-07-30','650572255','Officer','19 Riverside Drive','Gettysburg','NJ','07712','Administration'),
	(990104,'712-834-4242','1989-12-31','793285475','Classified','525 Route 6','Moncks Corner','PA','17325','Secret Service');


# Dump of table Pilot

DROP TABLE IF EXISTS `Pilot`;

CREATE TABLE `Pilot` (
  `pid` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_city` varchar(20) DEFAULT NULL,
  `address_state` varchar(20) DEFAULT NULL,
  `address_zipcode` char(5) DEFAULT NULL,
  `since` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Pilot` (`pid`, `phone_number`, `birthdate`, `ssn`, `job_title`, `address_street`, `address_city`, `address_state`, `address_zipcode`, `since`)
VALUES
	(990201,'941-655-5246','1974-01-01','854666700','Chief Pilot','155 Locust Street','Howard Beach','SC','29461',1997),
	(990202,'510-896-8715','1990-01-02','913281306','captain','231 York Road','Sun City','NY','11414',2000),
	(990203,'765-548-8980','1995-02-05','979417494','Navigator','427 Delaware Avenue','Hialeah','AZ','85351',2001),
	(990204,'765-548-8981','1995-02-06','979417495','Pilot','428 Delaware Avenue','Hialeah','AZ','85351',2002),
	(990205,'765-548-8982','1995-02-07','979417496','Pilot','429 Dela Avenue','Hialeah','AZ','85351',2008),
	(990206,'765-548-8983','1995-02-08','979417497','Pilot','430 Dela Dr','Hialeah','AZ','85351',2013);


# Dump of table Dish

DROP TABLE IF EXISTS `Dish`;

CREATE TABLE `Dish` (
  `lid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`lid`,`name`),
  CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `Lounge` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Dish` (`lid`, `name`, `price`)
VALUES
	(112,'alioi spanish',19.00),
	(112,'japchae mari',6.50),
	(112,'kalbi burger',7.95),
	(112,'tacos',7.50),
	(113,'grilled free range chicken',10.50),
	(113,'grilled steak',10.50),
	(113,'oven baked salmon',12.50),
	(113,'tempura',31.50),
	(212,'grilled steak',49.00),
	(212,'salmon',13.00),
	(212,'skewered shrimp',10.99),
	(212,'swordfish',11.50),
	(212,'wafu steak',45.99),
	(213,'bacon relish',35.50),
	(213,'seafood salad',12.00),
	(213,'surf and turf',23.99),
	(213,'wafu steak',14.00),
	(314,'burger',11.99),
	(314,'galbitang',16.00),
	(314,'samgyetang',29.99),
	(314,'yukgejang',12.99),
	(315,'hummus',13.99),
	(315,'king prawn',97.10),
	(315,'seafood salad',17.99),
	(315,'the burger combo',32.99),
	(315,'the karma burger',18.00),
	(409,'fresh lemonade',12.99),
	(409,'sandwich',16.99),
	(409,'sesame chicken',11.00),
	(409,'the thai wrap',13.00),
	(501,'hamburger',19.12),
	(502,'hamburger',17.12),
	(503,'hamburger',13.12),
	(601,'sandwich',9.12),
	(404,'hamburger',15.19),
	(404,'seafood salad',20.09),
	(84,'hamburger',12.92),
	(84,'salmon',15.19);

# Dump of table DishOrder

DROP TABLE IF EXISTS `DishOrder`;

CREATE TABLE `DishOrder` (
  `oid` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `total_amount` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `cid` (`cid`),
  KEY `lid` (`lid`),
  CONSTRAINT `dishorder_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Customer` (`cid`),
  CONSTRAINT `dishorder_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `Lounge` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `DishOrder` (`oid`, `cid`, `lid`, `order_datetime`, `total_amount`)
VALUES
	(1,1,112,'2015-01-01 12:34:34',22.50),
	(2,2,212,'2015-01-02 11:11:11',115.00),
	(3,5,212,'2015-01-03 12:22:22',96.50),
	(4,1,409,'2015-01-04 13:33:33',85.96),
	(5,2,314,'2015-01-05 16:33:33',153.97),
	(6,3,113,'2015-01-06 17:17:17',62.50),
	(7,12,213,'2015-01-07 15:34:34',22.50),
	(8,14,315,'2015-01-08 18:34:34',358.85),
	(12,1,212,'2015-01-12 09:22:22',709.80),
	(13,1,213,'2015-01-13 11:45:45',1199.50),
	(15,1,314,'2015-01-15 14:22:22',129.90),
	(16,1,315,'2015-01-16 15:31:31',41.97),
	(19,3,112,'2015-01-19 21:12:12',32.50),
	(20,1,113,'2015-01-20 20:54:54',210.00),
	(22,1,501,'2015-01-15 14:22:22',19.12),
	(23,1,601,'2015-01-16 15:31:31',27.36),
	(24,1,404,'2015-01-28 14:22:22',20.09),
	(25,1,84,'2015-08-16 03:03:03',30.38);


# Dump of table DishOrder_Contains_Dish

DROP TABLE IF EXISTS `DishOrder_Contains_Dish`;

CREATE TABLE `DishOrder_Contains_Dish` (
  `oid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`,`lid`,`name`),
  KEY `lid` (`lid`,`name`),
  CONSTRAINT `dishorder_contains_dish_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `DishOrder` (`oid`),
  CONSTRAINT `dishorder_contains_dish_ibfk_2` FOREIGN KEY (`lid`, `name`) REFERENCES `Dish` (`lid`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `DishOrder_Contains_Dish` (`oid`, `lid`, `name`, `quantity`)
VALUES
	(1,112,'tacos',3),
	(2,212,'swordfish',10),
	(3,212,'salmon',3),
	(3,212,'swordfish',5),
	(4,409,'fresh lemonade',2),
	(4,409,'sandwich',2),
	(4,409,'the thai wrap',2),
	(5,314,'galbitang',4),
	(5,314,'samgyetang',3),
	(6,113,'oven baked salmon',5),
	(7,213,'wafu steak',1),
	(8,315,'hummus',10),
	(8,315,'the burger combo',5),
	(8,315,'the karma burger',3),
	(12,212,'salmon',20),
	(12,212,'skewered shrimp',20),
	(12,212,'swordfish',20),
	(13,213,'surf and turf',50),
	(15,314,'yukgejang',10),
	(16,315,'hummus',3),
	(19,112,'japchae mari',5),
	(20,113,'grilled free range chicken',20),
	(22,501,'hamburger',1),
	(23,601,'sandwich',3),
	(24,404,'seafood salad',1),
	(25,84,'salmon',2);
	


# Dump of table Customer_Reserves_Flight

DROP TABLE IF EXISTS `Customer_Reserves_Flight`;

CREATE TABLE `Customer_Reserves_Flight` (
  `cid` int(11) NOT NULL,
  `flight_number` varchar(8) NOT NULL,
  `projected_departure_datetime` datetime NOT NULL,
  `purchased_datetime` datetime DEFAULT NULL,
  `purchased_price` decimal(7,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`,`flight_number`,`projected_departure_datetime`),
  KEY `flight_number` (`flight_number`,`projected_departure_datetime`),
  CONSTRAINT `customer_reserves_flight_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Customer` (`cid`),
  CONSTRAINT `customer_reserves_flight_ibfk_2` FOREIGN KEY (`flight_number`, `projected_departure_datetime`) REFERENCES `Flight` (`flight_number`, `projected_departure_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Customer_Reserves_Flight` (`cid`, `flight_number`, `projected_departure_datetime`, `purchased_datetime`, `purchased_price`, `quantity`)
VALUES
	(13,'U987','2015-06-07 10:23:00','2015-04-27 13:22:00',2821.00,4),
	(1,'U987','2015-06-07 10:23:00','2015-06-06 01:01:00',137.22,1),
	(1,'U987','2015-07-07 10:23:00','2015-07-06 01:01:00',137.22,555),
	(1,'N124','2015-09-07 08:21:00','2015-08-01 18:11:00',531.00,2),
	(1,'U987','2015-08-07 10:23:00','2015-08-06 01:01:00',137.22,1),
	(1,'N124','2015-08-09 08:21:00','2015-08-06 07:21:00',1135.00,2),
	(14,'N124','2015-09-07 08:21:00','2015-08-06 21:21:00',473.00,1),
	(15,'N124','2015-10-07 08:21:00','2015-08-07 21:19:00',44730.00,198),
	(16,'N124','2015-10-07 08:21:00','2015-08-08 13:19:00',13530.00,40),
	(17,'N124','2015-10-07 08:21:00','2015-08-09 13:39:00',9672.88,40),
	(1,'U987','2015-09-07 10:23:00','2015-09-06 01:01:00',137.22,1),
	(18,'N124','2015-10-07 08:21:00','2015-09-09 13:39:00',1572.34,5),
	(19,'N124','2015-10-07 08:21:00','2015-10-01 13:49:00',1572.34,5),
	(2,'U987','2015-10-07 10:23:00','2015-10-02 01:01:00',137.22,1),
	(3,'U987','2015-10-07 10:23:00','2015-10-02 02:01:00',250.00,2),
	(4,'U987','2015-10-07 10:23:00','2015-10-02 03:01:00',500.00,4),
	(5,'U987','2015-10-07 10:23:00','2015-10-02 04:01:00',400.00,3),
	(6,'U987','2015-10-07 10:23:00','2015-10-02 05:01:00',125.00,1),
	(7,'U987','2015-10-07 10:23:00','2015-10-02 06:01:00',150.00,1),
	(8,'U987','2015-10-07 10:23:00','2015-10-02 07:01:00',2500.00,10),
	(9,'U987','2015-10-07 10:23:00','2015-10-02 08:01:00',2800.00,12),
	(20,'N124','2015-10-07 08:21:00','2015-10-02 13:32:00',420.98,1),
	(1,'N124','2015-10-07 08:21:00','2015-10-02 18:32:00',430.00,1),
	(1,'U987','2015-10-07 10:23:00','2015-10-06 01:01:00',137.22,1),
	(10,'U987','2015-10-07 10:23:00','2015-10-02 09:01:00',290.00,2);





# Dump of table FlightAttendant_Participates_Flight
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FlightAttendant_Participates_Flight`;

CREATE TABLE `FlightAttendant_Participates_Flight` (
  `faid` int(11) NOT NULL,
  `flight_number` varchar(8) NOT NULL,
  `projected_departure_datetime` datetime NOT NULL,
  PRIMARY KEY (`faid`,`flight_number`,`projected_departure_datetime`),
  KEY `flight_number` (`flight_number`,`projected_departure_datetime`),
  CONSTRAINT `flightattendant_participates_flight_ibfk_1` FOREIGN KEY (`faid`) REFERENCES `FlightAttendant` (`faid`),
  CONSTRAINT `flightattendant_participates_flight_ibfk_2` FOREIGN KEY (`flight_number`, `projected_departure_datetime`) REFERENCES `Flight` (`flight_number`, `projected_departure_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `FlightAttendant_Participates_Flight` (`faid`, `flight_number`, `projected_departure_datetime`)
VALUES
	(990301,'N124','2015-08-09 08:21:00'),
	(990302,'N124','2015-08-09 08:21:00'),
	(990303,'N124','2015-08-09 08:21:00'),
	(990301,'N124','2015-09-07 08:21:00'),
	(990304,'N124','2015-09-07 08:21:00'),
	(990301,'N124','2015-10-07 08:21:00'),
	(990304,'N124','2015-10-07 08:21:00'),
	(990301,'U987','2015-06-07 10:23:00'),
	(990303,'U987','2015-06-07 10:23:00'),
	(990301,'U987','2015-07-07 10:23:00'),
	(990302,'U987','2015-07-07 10:23:00'),
	(990301,'U987','2015-08-07 10:23:00'),
	(990304,'U987','2015-08-07 10:23:00'),
	(990301,'U987','2015-09-07 10:23:00'),
	(990304,'U987','2015-09-07 10:23:00'),
	(990301,'U987','2015-10-07 10:23:00'),
	(990302,'U987','2015-10-07 10:23:00'),
	(990301,'UC725','2015-10-11 11:25:00'),
	(990302,'UC725','2015-10-11 11:25:00'),
	(990303,'UC725','2015-10-11 11:25:00'),
	(990301,'UC725','2015-10-12 11:25:00'),
	(990304,'UC725','2015-10-12 11:25:00'),
	(990301,'UC725','2015-10-13 11:25:00'),
	(990303,'UC725','2015-10-13 11:25:00'),
	(990301,'UC725','2015-10-14 11:25:00'),
	(990303,'UC725','2015-10-14 11:25:00'),
	(990301,'UC725','2015-10-15 11:25:00'),
	(990302,'UC725','2015-10-15 11:25:00'),
	(990304,'UC725','2015-10-15 11:25:00'),
	(990301,'UC6024','2016-01-02 06:45:00'),
	(990302,'UC6024','2016-01-02 06:45:00'),
	(990304,'UC6024','2016-01-02 06:45:00'),
	(990301,'UC6024','2016-01-03 06:45:00'),
	(990302,'UC6024','2016-01-03 06:45:00'),
	(990304,'UC6024','2016-01-03 06:45:00'),
	(990301,'UC6024','2016-01-04 06:45:00'),
	(990302,'UC6024','2016-01-04 06:45:00'),
	(990304,'UC6024','2016-01-04 06:45:00'),
	(990301,'UC6024','2016-01-05 06:45:00'),
	(990302,'UC6024','2016-01-05 06:45:00'),
	(990304,'UC6024','2016-01-05 06:45:00'),
	(990301,'UC2084','2016-02-01 10:35:00'),
	(990302,'UC2084','2016-02-01 10:35:00'),
	(990303,'UC2084','2016-02-01 10:35:00'),
	(990301,'UC2084','2016-02-02 10:35:00'),
	(990304,'UC2084','2016-02-02 10:35:00'),
	(990301,'UC2084','2016-02-03 10:35:00'),
	(990302,'UC2084','2016-02-03 10:35:00'),
	(990301,'UC2084','2016-02-04 10:35:00'),
	(990303,'UC2084','2016-02-04 10:35:00'),
	(990304,'UC2084','2016-02-04 10:35:00'),
	(990301,'UC2084','2016-02-05 10:35:00'),
	(990304,'UC2084','2016-02-05 10:35:00'),
	(990301,'UC2084','2016-02-06 10:35:00'),
	(990302,'UC2084','2016-02-06 10:35:00'),
	(990303,'UC2084','2016-02-06 10:35:00');


# Dump of table MaintenanceEngineer_Maintains_Airplane

DROP TABLE IF EXISTS `MaintenanceEngineer_Maintains_Airplane`;

CREATE TABLE `MaintenanceEngineer_Maintains_Airplane` (
  `meid` int(11) NOT NULL,
  `Aiplane_registration_number` varchar(10) NOT NULL,
  PRIMARY KEY (`meid`,`Aiplane_registration_number`),
  KEY `Aiplane_registration_number` (`Aiplane_registration_number`),
  CONSTRAINT `maintenanceengineer_maintains_airplane_ibfk_1` FOREIGN KEY (`meid`) REFERENCES `MaintenanceEngineer` (`meid`),
  CONSTRAINT `maintenanceengineer_maintains_airplane_ibfk_2` FOREIGN KEY (`Aiplane_registration_number`) REFERENCES `Airplane` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `MaintenanceEngineer_Maintains_Airplane` (`meid`, `Aiplane_registration_number`)
VALUES
	(990001,'N12345'),
	(990002,'N12345'),
	(990003,'N12345'),
	(990004,'N12345'),
	(990005,'N12345'),
	(990006,'N12345'),
	(990002,'N17523'),
	(990003,'N17523'),
	(990004,'N23456'),
	(990005,'N23456'),
	(990006,'N23456'),
	(990001,'N98765'),
	(990002,'N98765'),
	(990003,'N98765'),
	(990004,'N98765'),
	(990001,'N90001'),
	(990002,'N90001'),
	(990003,'N90001'),
	(990001,'N90002'),
	(990002,'N90002'),
	(990003,'N90002'),
	(990004,'N90003'),
	(990005,'N90003'),
	(990002,'N90004'),
	(990004,'N90004'),
	(990006,'N90004'),
	(990001,'N90005'),
	(990002,'N90005'),
	(990006,'N90005');


# Dump of table Pilot_Operates_Flight
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pilot_Operates_Flight`;

CREATE TABLE `Pilot_Operates_Flight` (
  `pid` int(11) NOT NULL,
  `flight_number` varchar(8) NOT NULL,
  `projected_departure_datetime` datetime NOT NULL,
  PRIMARY KEY (`pid`,`flight_number`,`projected_departure_datetime`),
  KEY `flight_number` (`flight_number`,`projected_departure_datetime`),
  CONSTRAINT `pilot_operates_flight_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `Pilot` (`pid`),
  CONSTRAINT `pilot_operates_flight_ibfk_2` FOREIGN KEY (`flight_number`, `projected_departure_datetime`) REFERENCES `Flight` (`flight_number`, `projected_departure_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Pilot_Operates_Flight` (`pid`, `flight_number`, `projected_departure_datetime`)
VALUES
	(990201,'N124','2015-08-09 08:21:00'),
	(990202,'N124','2015-08-09 08:21:00'),
	(990203,'N124','2015-08-09 08:21:00'),
	(990201,'N124','2015-09-07 08:21:00'),
	(990204,'N124','2015-09-07 08:21:00'),
	(990205,'N124','2015-09-07 08:21:00'),
	(990201,'N124','2015-10-07 08:21:00'),
	(990204,'N124','2015-10-07 08:21:00'),
	(990201,'U987','2015-06-07 10:23:00'),
	(990203,'U987','2015-06-07 10:23:00'),
	(990205,'U987','2015-06-07 10:23:00'),
	(990201,'U987','2015-07-07 10:23:00'),
	(990202,'U987','2015-07-07 10:23:00'),
	(990206,'U987','2015-07-07 10:23:00'),
	(990201,'U987','2015-08-07 10:23:00'),
	(990204,'U987','2015-08-07 10:23:00'),
	(990206,'U987','2015-08-07 10:23:00'),
	(990201,'U987','2015-09-07 10:23:00'),
	(990204,'U987','2015-09-07 10:23:00'),
	(990201,'U987','2015-10-07 10:23:00'),
	(990202,'U987','2015-10-07 10:23:00'),
	(990201,'UC725','2015-10-11 11:25:00'),
	(990202,'UC725','2015-10-11 11:25:00'),
	(990203,'UC725','2015-10-11 11:25:00'),
	(990201,'UC725','2015-10-12 11:25:00'),
	(990204,'UC725','2015-10-12 11:25:00'),
	(990205,'UC725','2015-10-12 11:25:00'),
	(990201,'UC725','2015-10-13 11:25:00'),
	(990203,'UC725','2015-10-13 11:25:00'),
	(990206,'UC725','2015-10-13 11:25:00'),
	(990201,'UC725','2015-10-14 11:25:00'),
	(990203,'UC725','2015-10-14 11:25:00'),
	(990206,'UC725','2015-10-14 11:25:00'),
	(990201,'UC725','2015-10-15 11:25:00'),
	(990202,'UC725','2015-10-15 11:25:00'),
	(990204,'UC725','2015-10-15 11:25:00'),
	(990201,'UC6024','2016-01-02 06:45:00'),
	(990202,'UC6024','2016-01-02 06:45:00'),
	(990204,'UC6024','2016-01-02 06:45:00'),
	(990201,'UC6024','2016-01-03 06:45:00'),
	(990202,'UC6024','2016-01-03 06:45:00'),
	(990204,'UC6024','2016-01-03 06:45:00'),
	(990201,'UC6024','2016-01-04 06:45:00'),
	(990202,'UC6024','2016-01-04 06:45:00'),
	(990204,'UC6024','2016-01-04 06:45:00'),
	(990201,'UC6024','2016-01-05 06:45:00'),
	(990202,'UC6024','2016-01-05 06:45:00'),
	(990204,'UC6024','2016-01-05 06:45:00'),
	(990201,'UC2084','2016-02-01 10:35:00'),
	(990202,'UC2084','2016-02-01 10:35:00'),
	(990203,'UC2084','2016-02-01 10:35:00'),
	(990201,'UC2084','2016-02-02 10:35:00'),
	(990204,'UC2084','2016-02-02 10:35:00'),
	(990205,'UC2084','2016-02-02 10:35:00'),
	(990201,'UC2084','2016-02-03 10:35:00'),
	(990202,'UC2084','2016-02-03 10:35:00'),
	(990206,'UC2084','2016-02-03 10:35:00'),
	(990201,'UC2084','2016-02-04 10:35:00'),
	(990203,'UC2084','2016-02-04 10:35:00'),
	(990204,'UC2084','2016-02-04 10:35:00'),
	(990201,'UC2084','2016-02-05 10:35:00'),
	(990204,'UC2084','2016-02-05 10:35:00'),
	(990205,'UC2084','2016-02-05 10:35:00'),
	(990201,'UC2084','2016-02-06 10:35:00'),
	(990202,'UC2084','2016-02-06 10:35:00'),
	(990203,'UC2084','2016-02-06 10:35:00');
