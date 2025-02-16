-- the total quantity of products across all stores
SELECT p.id, p.name, p.manufacture, p.price, SUM(q.quantity)
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
GROUP BY p.id;

-- the total quantity of products for a given category (`Smartphones`)
SELECT p.id, p.name, p.manufacture, p.price, SUM(q.quantity), c.name
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
LEFT JOIN product_category pc
ON p.id = pc.product_id
LEFT JOIN category c
ON pc.category_id = c.id
WHERE c.name = 'Smartphones'
GROUP BY p.id;

-- the quantity of a specific product (#1) in each store
SELECT p.id AS product_id, p.name, p.manufacture, p.price, q.quantity, c.name AS category, s.id AS store_id, s.address, s.city, s.zip_code
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
LEFT JOIN product_category pc
ON p.id = pc.product_id
LEFT JOIN category c
ON pc.category_id = c.id
LEFT JOIN store s
ON s.id = q.store_id
WHERE p.id = 1;

-- the list of stores selling products in a given category (`Smartphones`)
SELECT s.id, s.address, s.city, s.zip_code, c.name, c.description
FROM store s
LEFT JOIN store_category sc
ON s.id = sc.store_id
LEFT JOIN category c
ON c.id = sc.category_id
WHERE c.name = 'Smartphones';

-- the product availability in a specific store (#2)
SELECT p.id AS product_id, p.name, p.manufacture, p.price, q.quantity, s.id AS store_id, s.address, s.city, s.zip_code
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
LEFT JOIN store s
ON s.id = q.store_id
WHERE s.id = 2;

-- the availability of products from a specific category (`Electronics`) in a given store (#1)
SELECT p.id AS product_id, p.name, p.manufacture, p.price, c.name AS category, q.quantity, s.id AS store_id, s.address, s.city, s.zip_code
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
LEFT JOIN store s
ON s.id = q.store_id
LEFT JOIN product_category pc
ON p.id = pc.product_id
LEFT JOIN category c
ON c.id = pc.category_id
WHERE s.id = 1 AND c.name = 'Electronics';

-- the availability of a specific product (#8) in a given store (#3)
SELECT p.id AS product_id, p.name, p.manufacture, p.price, q.quantity, s.id AS store_id, s.address, s.city, s.zip_code
FROM product p
LEFT JOIN quantity q
ON p.id = q.product_id
LEFT JOIN store s
ON s.id = q.store_id
WHERE p.id = 8 AND s.id = 3;

-- the list of product categories available in a given store (#1)
SELECT s.id AS store_id, s.address, s.city, s.zip_code, c.name AS category, c.description AS category_desc
FROM store s
LEFT JOIN store_category sc
ON s.id = sc.store_id
LEFT JOIN category c
ON c.id = sc.category_id
WHERE s.id = 1;
