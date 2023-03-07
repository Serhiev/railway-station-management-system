INSERT INTO stations
VALUES (1, 'Залізничний вокзал Красне', 'Lviv', 'Krasne', 'Nezaleshnosti st., 15'),
       (2, 'Головний залізничний вокзал Львів', 'Lviv', 'Lviv', 'Dvirtseva Square, 1'),
       (3, 'Залізничний вокзал Шепетівка', 'Khmelnytskyii', 'Shepetivka', 'Ihoria Sikorskoho st., 49'),
       (4, 'Бродівський вузловий вокзал', 'Lviv', 'Brody', 'Nepokirnoho st., 21'),
       (5, 'Київський головний вокзал', 'Kyiv', 'Kyiv', 'Peremohy st., 43'),
       (6, 'Стрийська колія', 'Lviv', 'Stryy', 'Petlyury st., 8'),
       (7, 'Головний вокзал м. Чоп', 'Zakarpatska', 'Chop', 'Didyshuchi st., 43');

INSERT INTO coach_types
VALUES (1, 'Berth / 3-cl. sleeper'),
       (2, 'Compartment / 2-cl. sleeper'),
       (3, 'De Luxe / 1-cl. sleeper'),
       (4, 'Seating first class'),
       (5, 'Seating second class');

INSERT INTO stops
VALUES (1, 2, 1, '150L', '2022-06-03 19:55:00', '2022-06-03 20:10:00'),
       (2, 1, 1, '150L', '2022-06-03 20:37:00', '2022-06-03 20:41:00'),
       (3, 4, 1, '150L', '2022-06-03 21:55:00', '2022-06-03 23:12:00'),
       (4, 3, 1, '150L', '2022-06-03 23:58:00', '2022-06-04 00:06:00'),
       (5, 5, 1, '150L', '2022-06-04 07:34:00', '2022-06-04 07:57:00');

INSERT INTO coaches
VALUES (1, 1, 1, 1),
       (2, 1, 2, 1),
       (3, 1, 3, 1),
       (4, 1, 4, 2),
       (5, 1, 5, 3);

INSERT INTO order_seats
VALUES (1, 1, 1, 1, True),
       (2, 1, 2, 1, True),
       (3, 1, 3, 1, True),
       (4, 1, 4, 1, True),
       (5, 1, 5, 1, True),

       (6, 2, 1, 1, True),
       (7, 2, 2, 1, True),
       (8, 2, 3, 1, True),
       (9, 2, 4, 1, True),
       (10, 2, 5, 1, True),

       (11, 3, 1, 1, True),
       (12, 3, 2, 1, True),
       (13, 3, 3, 1, True),
       (14, 3, 4, 1, True),
       (15, 3, 5, 1, True),

       (16, 4, 1, 1, True),
       (17, 4, 2, 1, True),
       (18, 4, 3, 1, True),
       (19, 4, 4, 1, True),
       (20, 4, 5, 1, True);
