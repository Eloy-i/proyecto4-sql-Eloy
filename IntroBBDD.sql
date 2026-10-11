---  1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time. (Nota: Como he interpretado que recuperar los Vuelos * ya mete el id que se pide luego, hago una busqueda completa )

SELECT * FROM flights
WHERE STATUS = 'On Time'

--- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

--- Aclaro que no hay resultados, el mayor se queda por debajo de 1millón
SELECT * FROM bookings
WHERE total_amount > 1000000

--- Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT model, speed 
FROM airplanes_data


--- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)

SELECT f.flight_id, a.model, a.airplane_code
FROM flights AS f
INNER JOIN routes AS r 
ON r.route_no = f.route_no
INNER JOIN airplanes_data AS a
ON a.airplane_code = r.airplane_code
WHERE a.airplane_code = '733'

--- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.

SELECT * FROM tickets
WHERE passenger_name LIKE 'Irina%'

--- 6. Mostrar las ciudades con más de un aeropuerto. 

/* (En esta busqueda voy a mostrar la cantidad de aeropuertos por ciudad y lo voy a ordenar descendentemente) */

SELECT city, COUNT(*) AS numbers_airports
FROM airports_data
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY numbers_airports DESC


--- 7. Mostrar el número de vuelos por modelo de avión.

SELECT a.model, COUNT(*) AS numbers_flights
FROM flights AS f
INNER JOIN routes AS r
ON f.route_no = r.route_no
INNER JOIN airplanes_data AS a
ON r.airplane_code = a.airplane_code
GROUP BY a.model
ORDER BY numbers_flights DESC



--- 8. Reservas con más de un billete (varios pasajeros).

SELECT book_ref, COUNT(*) AS numbers_tickets
FROM tickets
GROUP BY book_ref
HAVING COUNT(*) > 1


--- 9. Vuelos con retraso de salida superior a una hora.

SELECT * FROM flights
WHERE actual_departure - scheduled_departure > INTERVAL '1 HOUR'