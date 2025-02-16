CREATE DATABASE IF NOT EXISTS Inventory
CHARACTER SET utf8mb4  
COLLATE utf8mb4_unicode_ci;
USE Inventory;

CREATE TABLE product
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NULL,
    manufacture VARCHAR(64) NULL,
    price INT UNSIGNED NULL,
    PRIMARY KEY (id)
);

CREATE TABLE store
(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    address VARCHAR(64) NULL,
    city VARCHAR(64) NULL,
    zip_code VARCHAR(10) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE category
(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NULL,
    description VARCHAR(128) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE store_category (
    store_id SMALLINT UNSIGNED NOT NULL,
    category_id SMALLINT UNSIGNED NOT NULL,
    UNIQUE (store_id, category_id),
    INDEX idx_store_id (store_id),
    INDEX idx_category_id (category_id),
    FOREIGN KEY (store_id) REFERENCES store (id) ON DELETE CASCADE, 
    FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE
);

CREATE TABLE product_category (
    product_id INT UNSIGNED NOT NULL,
    category_id SMALLINT UNSIGNED NOT NULL,
    UNIQUE (product_id, category_id),
    INDEX idx_product_id (product_id),
    INDEX idx_category_id (category_id),
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE, 
    FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE
);

CREATE TABLE quantity (
    product_id INT UNSIGNED NOT NULL,
    store_id SMALLINT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (product_id, store_id),
    INDEX idx_product_id (product_id),
    INDEX idx_store_id (store_id),
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE RESTRICT, 
    FOREIGN KEY (store_id) REFERENCES store (id) ON DELETE RESTRICT
);