-- The route Lviv - Krasne - Brody - Shepetivka - Kyiv on the date 2022-06-03 is entered in the database.
-- Script 1: Finding a train on the Krasne - Shepetivka route.

-- Search for the ID of the departure station
SELECT id as from_station_id
from stations
where location = 'krasne';
-- expected result: from_station_id=1

-- Search for the ID of the arrival station
SELECT id to_station_id
from stations
where location = 'shepetivka';
-- expected result: to_station_id=3

-- Search for a route where the departure station and date satisfy the initial data.
-- station_id = from_station_id = 1
select id as id_stop, trip_num
from stops
where station_id = 1 and DATE (arrival_datetime) = '2022-06-03'
-- expected result: id_stop=2, trip_num=1

-- If the route exists, then check whether there is an arrival station in the route.
-- Check whether the arrival time is later than the departure time.

-- Departure time from the departure station where trip_num=1
select departure_datetime
from stops
where station_id = 1
  and trip_num = 1;
-- expected result: 2022-06-03 20:41:00

-- Arrival time to the arrival station where trip_num=1
select arrival_datetime
from stops
where station_id = 3
  and trip_num = 1;
-- expected result: 2022-06-03 23:58:00

-- if (arrival_datetime > departure_datetime) then there is a route Krasne - Shepetivka;


-- Script 2: Finding a free seat on a train on the Krasne - Shepetivka route.
SELECT stop_id, coach_num, seat_num
from order_seats
         INNER JOIN coaches
                    ON order_seats.coach_id = coaches.id
where stop_id = 2
   or (stop_id > 2 and stop_id < 4) and is_free = True;


-- Script 3: Ordering a free seat (coach_num=1 and seat_num=1) on a train on the Krasne - Shepetivka route.
UPDATE order_seats
SET is_free = False
WHERE (stop_id = 2 or (stop_id > 2 and stop_id < 4))
  and coach_id = 1
  and seat_num = 1;

-- Query to check whether seats had been ordered
SELECT order_seats.id, stop_id, coach_num, seat_num
from order_seats
         INNER JOIN coaches
                    ON order_seats.coach_id = coaches.id
where (stop_id = 2 or stop_id > 2 and stop_id < 4)
  and is_free = False
  and coach_id = 1
  and seat_num = 1;

-- Insert values to tickets
INSERT INTO tickets
VALUES (1, 6, 4, 'Antonio', 'Koval', 312.23, '2022-05-20 13:51:23', null);
