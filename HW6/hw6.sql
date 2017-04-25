SELECT P.pid, MAX(F.actual_arrival_datetime - F.actual_departure_datetime) as maximum_duration
FROM Pilot_Operates_Flight P INNER JOIN Flight F ON P.flight_number = F.flight_number AND P.projected_departure_datetime = F.projected_departure_datetime
GROUP BY P.pid;

SELECT L.lid, COUNT(*) as number_of_AE_customers
FROM Lounge L INNER JOIN (DishOrder O INNER JOIN Credit_Card C ON O.cid = C.cid) ON L.lid = O.lid
WHERE length(C.card_number) = 15
GROUP BY L.lid;

SELECT C.cid
FROM Customer C INNER JOIN (DishOrder O INNER JOIN Lounge L ON O.lid = L.lid) ON C.cid = O.cid 
GROUP BY C.cid
HAVING COUNT(DISTINCT(L.airport_IATA_Code)) = (SELECT COUNT(DISTINCT(A.IATA_Code)) FROM Airport A) AND SUM(O.total_amount) > 100;

SELECT F.flight_number, F.projected_departure_datetime
FROM Customer_Reserves_Flight R INNER JOIN (Flight F INNER JOIN Airplane A ON F.aiplane_registration_number = A.registration_number) ON R.flight_number = F.flight_number AND R.projected_departure_datetime = F.projected_departure_datetime
GROUP BY F.flight_number, F.projected_departure_datetime
HAVING SUM(R.quantity) = MAX(A.capacity);


/* USE ON DELETE CASCADE */

CREATE VIEW Flights_offered_view (flight_number, departure_airport_IATA_code,arrival_airport_IATA_code) AS
SELECT DISTINCT(flight_number,departure_airport_IATA_code, arrival_airport_IATA_code)
FROM flights

/* Yes updates can be performed on the view above cause it can be updated in the base table */

/* GRANT SELECT ON Flights_offered_view TO "futurecustomer" WITH GRANT OPTION; */

DELIMITER $$
CREATE TRIGGER AmountUpdate
AFTER INSERT ON DishOrder_Contains_Dish
FOR EACH ROW
BEGIN
     UPDATE DishOrder O 
	 SET O.total_amount = O.total_amount + (NEW.quantity * (SELECT D.price FROM Dish D WHERE D.name = NEW.name AND D.lid = NEW.lid))
     WHERE NEW.oid = O.oid;
END;
	IF NEW



END;
DELIMITER;


/*                               
M -> N
ML -> NL
ML -> PQ
MLR -> PQR
NL -> PQ
NLR -> PQR
NLRM -> PQRM
MLR -> PQRM
MLR -> P
MLR -> QRM
MLR -> S
MLR -> PS
*/



