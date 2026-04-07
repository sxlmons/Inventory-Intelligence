-- SEED CATEGORY TABLE

-- Common
WITH parent AS (
    INSERT INTO Category (category_name)
    VALUES ('Most Common')
    RETURNING category_id
),
meat AS (
    INSERT INTO Category (parent_category_id, category_name, level_of_category)
    SELECT category_id, 'Meat', 2 FROM parent
    RETURNING category_id
)
INSERT INTO Category (parent_category_id, category_name, level_of_category)
SELECT category_id, 'Fruit', 2 FROM parent
UNION ALL
SELECT category_id, 'Vegetables', 2 FROM parent
UNION ALL
SELECT category_id, 'Canned Goods', 2 FROM parent
UNION ALL
SELECT category_id, 'Dairy', 2 FROM parent
UNION ALL

-- Meats
SELECT category_id, 'Beef', 3 FROM meat
UNION ALL
SELECT category_id, 'Vension', 3 FROM meat
UNION ALL
SELECT category_id, 'Pork', 3 FROM meat
UNION ALL
SELECT category_id, 'Chicken', 3 FROM meat
UNION ALL
SELECT category_id, 'Deli', 3 FROM meat;


-- Fish/Seafood
INSERT INTO Category (category_name)VALUES('Fish');
INSERT INTO Category (category_name)VALUES('Seafood');


-- Misc
INSERT INTO Category (category_name)VALUES('Spices');
INSERT INTO Category (category_name)VALUES('Condiments');
INSERT INTO Category (category_name)VALUES('Snacks');
INSERT INTO Category (category_name)VALUES('Baking');
INSERT INTO Category (category_name)VALUES('Frozen Foods');

-- Grains
WITH parent AS (
    INSERT INTO Category (category_name)
    VALUES ('Grains')
    RETURNING category_id
)
INSERT INTO Category (parent_category_id, category_name, level_of_category)
SELECT category_id, 'Bread and Pastry', 2 FROM parent
UNION ALL
SELECT category_id, 'Pasta', 2 FROM parent
UNION ALL
SELECT category_id, 'Rice', 2 FROM parent
UNION ALL
SELECT category_id, 'Cereal', 2 FROM parent;

--  _______FRUIT_VENDOR_______________________________________________FRUIT_VENDOR_________________________________________________FRUIT_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Martins Family Fruit Farm', 'Fruit', 'MartinsApples@gmail.com')
    RETURNING vendor_id
),
fruitcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Fruit'
)
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'Gala Apples', 'kg', 0.18, 3.49 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Granny Smith Apples', 'kg', 0.20, 3.79 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Honeycrisp Apples', 'kg', 0.22, 4.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Fuji Apples', 'kg', 0.21, 3.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Red Delicious Apples', 'kg', 0.19, 2.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Bananas', 'kg', 0.15, 1.29 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Oranges', 'kg',  0.25, 2.49 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Strawberries', 'kg', 0.02, 6.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Blueberries', 'kg', 0.0015, 8.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Grapes', 'kg', 0.005, 5.49 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Pineapple', 'kg', 1.20, 3.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL 
SELECT v.vendor_id, c.category_id, 'Mango', 'kg', 0.30, 4.49 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Granny Smith Apples', 'kg', 0.20, 3.79 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Avocado', 'kg', 0.20, 2.99 FROM vendors v
CROSS JOIN fruitcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Granny Smith Apples', 'kg', 0.20, 3.79 FROM vendors v
CROSS JOIN fruitcat c;

VALUES ("Martin's Family Fruit Farm", 'Fruit', 'MartinsApples@gmail.com');

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (6, 2, 'Gala Apples', 'kg', 0.18, 3.49);

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('Green Valley Produce', 'Vegetables', 'sales@greenvalleyproduce.com');

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('OceanCatch Supplies', 'Seafood', 'info@oceancatch.com');

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('Prime Meat Distributors', 'Beef', 'support@primemeat.com');

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('DairyBest Ltd', 'Dairy', 'hello@dairybest.com');



--  _______FRUITS________________________________________________FRUITS_________________________________________________FRUITS________________________________________________
-- Apples

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 2, 'Gala Apples', 'kg', 0.18, 3.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (6, 2, 'Granny Smith Apples', 'kg', 0.20, 3.79);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (6, 2, 'Honeycrisp Apples', 'kg', 0.22, 4.99);
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 2, 'Honeycrisp Apples', 'kg', 0.22, 4.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 2, 'Fuji Apples', 'kg', 0.21, 3.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (6, 2, 'Red Delicious Apples', 'kg', 0.19, 2.99);

-- Other fruits
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Bananas', 'kg', 0.15, 1.29);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Oranges', 'kg', 0.25, 2.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Strawberries', 'kg', 0.02, 6.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Blueberries', 'kg', 0.0015, 8.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Grapes', 'kg', 0.005, 5.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Pineapple', 'kg', 1.20, 3.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Mango', 'kg', 0.30, 4.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (1, 2, 'Avocado', 'kg', 0.20, 7.99);

-- _______MEAT________________________________________________MEAT_________________________________________________MEAT________________________________________________
--     Beef (category_id = 7)

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 7, 'Ground Beef', 'kg', 0.50, 8.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 7, 'Ribeye Steak', 'kg', 0.30, 24.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 7, 'Sirloin Steak', 'kg', 0.28, 19.99);
-- Venison (category_id = 8)

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 8, 'Venison Steak', 'kg', 0.30, 29.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 8, 'Ground Venison', 'kg', 0.50, 22.99);

-- Pork (category_id = 9)

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 9, 'Pork Chops', 'kg', 0.25, 9.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 9, 'Bacon', 'kg', 0.20, 12.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 9, 'Pork Shoulder', 'kg', 1.50, 7.99);


-- Chicken (category_id = 10)

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 10, 'Whole Chicken', 'kg', 1.60, 5.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 10, 'Chicken Breast', 'kg', 0.25, 11.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 10, 'Chicken Thighs', 'kg', 0.20, 8.99);


-- Deli (category_id = 11)

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 11, 'Turkey Slices', 'kg', 0.01, 18.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (4, 11, 'Ham Slices', 'kg', 0.01, 16.99);



-- _______VEGETABLES________________________________________________VEGETABLES_________________________________________________VEGETABLES_______________________________

-- Root vegetables

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Carrots', 'kg', 0.10, 1.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Potatoes', 'kg', 0.20, 1.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Sweet Potatoes', 'kg', 0.25, 2.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Onions', 'kg', 0.15, 1.79);


-- Leafy greens

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Lettuce', 'kg', 0.30, 2.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Spinach', 'kg', 0.05, 4.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Kale', 'kg', 0.08, 3.99);


-- Other common vegetables

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Broccoli', 'kg', 0.40, 2.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Cauliflower', 'kg', 0.80, 3.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Bell Peppers', 'kg', 0.15, 4.49);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Zucchini', 'kg', 0.20, 2.79);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Cucumber', 'kg', 0.30, 1.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Tomatoes', 'kg', 0.12, 3.99);

INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
VALUES (2, 3, 'Mushrooms', 'kg', 0.02, 6.99);


-- SEED INVENTORY TABLE


-- SEED VENDOR INVENTORY LOT TABLE



