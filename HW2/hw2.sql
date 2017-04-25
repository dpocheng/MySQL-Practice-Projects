CREATE TABLE flights
(
projected_departure	DATETIME,
projected_arrival DATETIME,
actual_departure DATETIME,
actual_arrival DATETIME,
flight_number VARCHAR(10),
departure_IATA VARCHAR(10) NOT NULL,
arrival_IATA VARCHAR(10) NOT NULL,
registration_number	VARCHAR(20),
PRIMARY KEY(projected_departure, flight_number),
FOREIGN KEY(registration_number) REFERENCES airplane ON DELETE SET NULL,
FOREIGN KEY(departure_IATA) REFERENCES airports(iataCode) ON DELETE CASCADE,
FOREIGN KEY(arrival_IATA) REFERENCES airports(iataCode) ON DELETE CASCADE
);

CREATE TABLE airplane
(
capacity INTEGER,
manufactured_year INTEGER,
purchased_year INTEGER,
registration_number VARCHAR(20),
model_number VARCHAR(20),
PRIMARY KEY(registration_number)
);

CREATE TABLE employee 
(
eid	VARCHAR(6),
phone_number CHAR(10),
birthday DATE,
SSN	CHAR(11),
e_job_title VARCHAR(11),
e_street VARCHAR(20),
e_city VARCHAR(20),
e_state	CHAR(2),
e_zipcode CHAR(10),
PRIMARY KEY(eid)
);

CREATE TABLE maintenance_engineer
(
eid	VARCHAR(6),
skill VARCHAR(15),
PRIMARY KEY(eid),
FOREIGN KEY(eid) REFERENCES employee ON DELETE CASCADE
);

CREATE TABLE pilot
(
eid VARCHAR(6),
since INTEGER,
PRIMARY KEY(eid),
FOREIGN KEY(eid) REFERENCES employee ON DELETE CASCADE
);

CREATE TABLE flight_attendant
(
eid VARCHAR(6),
service_year INTEGER,
PRIMARY KEY(eid),
FOREIGN KEY(eid) REFERENCES employee ON DELETE CASCADE
);

CREATE TABLE operation_staff
(
eid VARCHAR(6),
department VARCHAR(20),
PRIMARY KEY(eid),
FOREIGN KEY(eid) REFERENCES employee ON DELETE CASCADE
);


CREATE TABLE maintains
(
eid VARCHAR(6),
registration_number VARCHAR(20),
PRIMARY KEY(eid,registration_number),
FOREIGN KEY(eid) REFERENCES maintenance_engineer ON DELETE CASCADE,
FOREIGN KEY(registration_number) REFERENCES airplane ON DELETE CASCADE



);


CREATE TABLE operates
(
eid VARCHAR(6),
projected_departure DATETIME,
flight_number VARCHAR(10),
PRIMARY KEY(eid,projected_departure,flight_number),
FOREIGN KEY(eid) REFERENCES pilot ON DELETE CASCADE,
FOREIGN KEY(projected_departure,flight_number) REFERENCES flights ON DELETE CASCADE



);


CREATE TABLE participates
(
eid VARCHAR(6),
projected_departure DATETIME,
flight_number VARCHAR(10),
PRIMARY KEY(eid,projected_departure,flight_number),
FOREIGN KEY(eid) REFERENCES flight_attendants ON DELETE CASCADE,
FOREIGN KEY(projected_departure,flight_number) REFERENCES flights ON DELETE CASCADE



);


CREATE TABLE airports
(
 iataCode VARCHAR(10),
 airport_name VARCHAR(50),
 airport_city VARCHAR(20),
 state CHAR(2),
 PRIMARY KEY(iataCode)
);


CREATE TABLE customer
(
email VARCHAR(30),
gender CHAR(1),
c_street VARCHAR(20),
c_city VARCHAR(20),
c_zipcode CHAR(10),
c_state CHAR(2),
c_SSN CHAR(11),
cid VARCHAR(10),
PRIMARY KEY(cid)
);

CREATE TABLE credit_card
(
    card_number VARCHAR(30),
    card_expiration_data DATE
    cid VARCHAR(10) NOT NULL,
    PRIMARY KEY(card_number),
    FOREIGN KEY(cid) REFERENCES customer ON DELETE CASCADE
);

CREATE TABLE lounge
(
lid VARCHAR(10),
lounge_location VARCHAR(10),
iataCode VARCHAR(10) NOT NULL,
PRIMARY KEY(lid),
FOREIGN KEY(iataCode) REFERENCES airport ON DELETE CASCADE
);


CREATE TABLE reserves
(
projectedDeparture DATETIME,
flight_number VARCHAR(10),
cid VARCHAR(10),
quanity INTEGER,
purchase_date DATETIME,
purchase_price DECIMAL(6,2),
PRIMARY KEY(projectedDeparture,flight_number,cid),
FOREIGN KEY(projectedDeparture,flight_number) REFERENCES flights ON DELETE CASCADE,
FOREIGN KEY(cid) REFERENCES customer ON DELETE CASCADE
);


CREATE TABLE dish
(
dish_name VARCHAR(15),
price DECIMAL(4,2),
lid VARCHAR(10) NOT NULL,
PRIMARY KEY(lid,dish_name),
FOREIGN KEY(lid) REFERENCES lounge ON DELETE CASCADE
);


CREATE TABLE dish_order
(
total_amount DECIMAL(6,2),
doid VARCHAR(10),
order_date DATETIME,
cid VARCHAR(10) NOT NULL,
lid VARCHAR(10),
PRIMARY KEY(doid),
FOREIGN KEY(cid) REFERENCES customer ON DELETE CASCADE,
FOREIGN KEY(lid) REFERENCES lounge ON DELETE SET NULL
);


CREATE TABLE contain
(
lid VARCHAR(10),
did VARCHAR(10),
doid VARCHAR(10),
quantity INTEGER,
PRIMARY KEY(lid,did,doid),
FOREIGN KEY(lid,did) REFERENCES dish ON DELETE CASCADE,
FOREIGN KEY(doid) REFERENCES dish_order ON DELETE CASCADE
);







