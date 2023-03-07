-- 1) Creating database
create database railway;
use railway;

-- 2) Creating tables
CREATE TABLE `railway`.`stations`
(
    `id`       INT UNSIGNED NOT NULL,
    `title`    VARCHAR(128) NOT NULL,
    `region`   VARCHAR(128) NOT NULL,
    `location` VARCHAR(128) NOT NULL,
    `street`   VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `railway`.`stops`
(
    `id`                 INT UNSIGNED NOT NULL,
    `station_id`         INT UNSIGNED NOT NULL,
    `trip_num`           INT UNSIGNED NOT NULL,
    `train_num`          VARCHAR(8) NOT NULL,
    `arrival_datetime`   DATETIME   NOT NULL,
    `departure_datetime` DATETIME   NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `railway`.`coaches`
(
    `id`            INT UNSIGNED NOT NULL,
    `trip_num`      VARCHAR(8) NOT NULL,
    `coach_num`     SMALLINT UNSIGNED NOT NULL,
    `coach_type_id` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `railway`.`coach_types`
(
    `id`   SMALLINT UNSIGNED NOT NULL,
    `type` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `coach_type_UNIQUE` (`type` ASC) VISIBLE
);

CREATE TABLE `railway`.`order_seats`
(
    `id`       INT UNSIGNED NOT NULL,
    `stop_id`  INT UNSIGNED NOT NULL,
    `coach_id` INT UNSIGNED NOT NULL,
    `seat_num` SMALLINT UNSIGNED NOT NULL,
    `is_free`  TINYINT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `railway`.`tickets`
(
    `id`                       INT UNSIGNED NOT NULL,
    `order_seats_departure_id` INT UNSIGNED NOT NULL,
    `stop_arrival_id`          INT UNSIGNED NOT NULL,
    `passenger_first_name`     VARCHAR(128) NOT NULL,
    `passenger_last_name`      VARCHAR(128) NOT NULL,
    `price`                    FLOAT UNSIGNED NOT NULL,
    `booking_datetime`         DATETIME     NOT NULL,
    `cancelled_datetime`       DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
);

-- 3) Creating foreign keys
ALTER TABLE `railway`.`stops`
    ADD INDEX `station_id_idx` (`station_id` ASC) VISIBLE;
;

ALTER TABLE `railway`.`stops`
    ADD CONSTRAINT `station_id`
        FOREIGN KEY (`station_id`)
            REFERENCES `railway`.`stations` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `railway`.`order_seats`
    ADD INDEX `stop_id_idx` (`stop_id` ASC) VISIBLE,
ADD INDEX `coach_id_idx` (`coach_id` ASC) VISIBLE;
;

ALTER TABLE `railway`.`order_seats`
    ADD CONSTRAINT `stop_id`
        FOREIGN KEY (`stop_id`)
            REFERENCES `railway`.`stops` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
ADD CONSTRAINT `coach_id`
  FOREIGN KEY (`coach_id`)
  REFERENCES `railway`.`coaches` (`id`)
  ON
DELETE
NO ACTION
  ON
UPDATE NO ACTION;

ALTER TABLE `railway`.`coaches`
    ADD INDEX `coach_type_id_idx` (`coach_type_id` ASC) VISIBLE;
;

ALTER TABLE `railway`.`coaches`
    ADD CONSTRAINT `coach_type_id`
        FOREIGN KEY (`coach_type_id`)
            REFERENCES `railway`.`coach_types` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `railway`.`tickets`
    ADD CONSTRAINT `order_seats_departure_id`
        FOREIGN KEY (`order_seats_departure_id`) REFERENCES order_seats (`id`);

ALTER TABLE `railway`.`tickets`
    ADD CONSTRAINT `stop_arrival_id`
        FOREIGN KEY (`stop_arrival_id`) REFERENCES stops (`id`);
