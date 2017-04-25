/* Group ID: 76 */
/* SID1: 40598243, NAME: Cyrus Tabatabai-Yazdi */
/* SID2: 74157306, NAME: Pok On Cheng */
/* SID3: 73168728, NAME: Elliot Yan */
Use cs122a;

SELECT IATA_code, COUNT(*) AS number_of_lounges
FROM airport INNER JOIN lounge ON airport.IATA_code = lounge.airport_IATA_code
GROUP BY IATA_code/* Q1 */;

SELECT flight_number, TIMESTAMPDIFF(second, actual_departure_datetime, actual_arrival_datetime) AS actual_duration
FROM flight
WHERE flight.actual_departure_datetime = (SELECT MAX(f2.actual_departure_datetime) FROM flight f2)/* Q2 */;

SELECT MAX(ABS(TIMESTAMPDIFF(second,actual_departure_datetime,actual_arrival_datetime) - TIMESTAMPDIFF(second,projected_departure_datetime,projected_arrival_datetime))) AS maximum_absolute_difference
FROM flight/* Q3 */;

SELECT flight_number, MAX(ABS(TIMESTAMPDIFF(second,actual_departure_datetime,actual_arrival_datetime) - TIMESTAMPDIFF(second,projected_departure_datetime,projected_arrival_datetime))) AS maximum_absolute_difference, MIN(ABS(TIMESTAMPDIFF(second,actual_departure_datetime,actual_arrival_datetime) - TIMESTAMPDIFF(second,projected_departure_datetime,projected_arrival_datetime))) AS minimum_absolute_difference
FROM flight
GROUP BY flight_number/* Q4 */;

SELECT pid, Temp.count
FROM
(SELECT pid, COUNT(*) AS count
FROM Pilot_Operates_Flight P1 INNER JOIN Flight F1 ON P1.flight_number = F1.flight_number
GROUP BY pid) AS Temp
WHERE Temp.count = (SELECT MAX(Temp2.c) FROM (SELECT P2.pid, COUNT(*) AS c FROM (Pilot_Operates_Flight P2 INNER JOIN Flight F2 ON P2.flight_number = F2.flight_number)
GROUP BY pid) AS Temp2)/* Q5 */;

SELECT L.lid,AVG(D.price)
FROM Lounge L INNER JOIN Dish D ON L.lid = D.lid
GROUP BY L.lid
HAVING AVG(D.price) > (SELECT AVG(D2.price)
                       FROM Dish D2)/* Q6 */;

SELECT O.oid, name, quantity
FROM DishOrder O INNER JOIN DishOrder_Contains_Dish C ON O.oid = C.oid
WHERE 2 <= (SELECT COUNT(*)
			FROM DishOrder O1 INNER JOIN DishOrder_Contains_Dish C1 ON O1.oid = C1.oid
            WHERE O.oid = O1.oid)/* Q7 */;

SELECT C.cid, SUM(purchased_price * quantity)
FROM Customer C LEFT OUTER JOIN Customer_Reserves_Flight R ON C.cid = R.cid
GROUP BY C.cid
ORDER BY C.cid/* Q8 */;

SELECT A.IATA_Code, COUNT(*) AS num_orders
FROM Airport A INNER JOIN Lounge L INNER JOIN DishOrder_Contains_Dish C ON A.IATA_code = L.airport_IATA_code AND L.lid = C.lid
GROUP BY A.IATA_Code/* Q9 */;

SELECT L.lid, L.airport_IATA_code, COUNT(*) AS number_of_dishes, MIN(D.price) AS minimum_price, MAX(D.price) AS maximum_price, AVG(D.price) AS average_price
FROM Lounge L LEFT OUTER JOIN Dish D ON L.lid = D.lid
GROUP BY L.lid 
ORDER BY L.lid/* Q10 */;