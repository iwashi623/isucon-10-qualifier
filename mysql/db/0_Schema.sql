DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;
DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.estate;
CREATE TABLE isuumo.estate (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    address VARCHAR(128) NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    rent INTEGER NOT NULL,
    door_height INTEGER NOT NULL,
    door_width INTEGER NOT NULL,
    features VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL,
    popularity_desc INTEGER AS (- popularity) NOT NULL
);
CREATE TABLE isuumo.chair (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    price INTEGER NOT NULL,
    height INTEGER NOT NULL,
    width INTEGER NOT NULL,
    depth INTEGER NOT NULL,
    color VARCHAR(64) NOT NULL,
    features VARCHAR(64) NOT NULL,
    kind VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL,
    stock INTEGER NOT NULL
);
ALTER TABLE isuumo.chair
ADD INDEX stock_index(stock);
ALTER TABLE isuumo.chair
ADD INDEX price_index(price);
ALTER TABLE isuumo.estate
ADD INDEX door_widt_height_index(door_width, door_height);
ALTER TABLE isuumo.estate
ADD INDEX door_height_index(door_height);
ALTER TABLE isuumo.estate
ADD INDEX estate_rent_popularity_desc_id_idx(rent, popularity_desc, id);
ALTER TABLE isuumo.estate
ADD INDEX estate_rent_popularity_id_idx(rent, popularity, id);
