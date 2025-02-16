-- insert sample data
INSERT INTO product (name, manufacture, price)
VALUES
    ('Smartphone', 'TechCo', 800),               -- 1
    ('Smartphone', 'GadgetWorks', 850),          -- 2
    ('Laptop', 'TechCo', 1200),                  -- 3
    ('Laptop', 'GadgetWorks', 1150),             -- 4
    ('Tablet', 'GadgetWorks', 500),              -- 5
    ('Tablet', 'TechCo', 450),                   -- 6
    ('Washing Machine', 'HomeTech', 400),        -- 7
    ('Washing Machine', 'CleanMaster', 380),     -- 8
    ('Headphones', 'AudioTech', 200),            -- 9
    ('Headphones', 'TechCo', 220);               -- 10

INSERT INTO store (address, city, zip_code)
VALUES
    ('123 Main St', 'New York', '10001'),        -- 1
    ('456 Oak Rd', 'Chicago', '60601'),          -- 2
    ('789 Pine Ave', 'Los Angeles', '90001');    -- 3

INSERT INTO category (name)
VALUES
    ('Smartphones'),                     -- 1
    ('Computers'),                       -- 2
    ('Electronics'),                     -- 3
    ('Home Appliances'),                 -- 4
    ('Audio');                           -- 5

INSERT INTO quantity (product_id, store_id, quantity)
VALUES
    (1, 1, 10),
    (2, 1, 5),
    (1, 2, 7),
    (2, 2, 12),
    (3, 2, 7),
    (4, 2, 10),
    (5, 1, 15),
    (6, 1, 20),
    (7, 3, 25),
    (8, 3, 30),
    (9, 2, 50),
    (10, 2, 40);

INSERT INTO store_category (store_id, category_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 5),
    (3, 4);

INSERT INTO product_category (product_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 2),
    (5, 3),
    (6, 2),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 3),
    (9, 5),
    (10, 3),
    (10, 5);