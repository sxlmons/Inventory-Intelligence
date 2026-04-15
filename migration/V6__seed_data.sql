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

WITH fruitcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Fruit'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'Gala Apples', 'kg', 3.49 FROM fruitcat c
UNION ALL
SELECT c.category_id, 'Granny Smith Apples', 'kg', 3.79 FROM fruitcat c
UNION ALL
SELECT c.category_id, 'Honeycrisp Apples', 'kg',  4.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Fuji Apples', 'kg',  3.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Red Delicious Apples', 'kg',  2.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Bananas', 'kg',  1.29 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Oranges', 'kg',   2.49 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Strawberries', 'kg',  6.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Blueberries', 'kg',  8.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Grapes', 'kg',  5.49 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Pineapple', 'kg', 3.99 FROM fruitcat c
UNION ALL 
SELECT c.category_id, 'Mango', 'kg',  4.49 FROM fruitcat c
UNION ALL
SELECT c.category_id, 'Granny Smith Apples', 'kg',  3.79 FROM fruitcat c
UNION ALL
SELECT c.category_id, 'Avocado', 'kg',  2.99 FROM fruitcat c
UNION ALL
SELECT c.category_id, 'Granny Smith Apples', 'kg',  3.79 FROM fruitcat c;

--  _______VEGETABLE_VENDOR_______________________________________________VEGETABLE_VENDOR_________________________________________________VEGETABLE_VENDOR________________________________________________________

WITH vegcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Vegetables'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'Carrots', 'kg',  1.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Potatoes', 'kg',  1.49 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Sweet Potatoes', 'kg',  2.49 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Onions', 'kg',  1.79 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Lettuce', 'kg',  2.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Spinach', 'kg',   4.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Kale', 'kg',  3.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Broccoli', 'kg',  2.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Cauliflower', 'kg',  3.49 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Bell Peppers', 'kg',  4.49 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Zucchini', 'kg',  2.79 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Cucumber', 'kg',  1.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Tomatoes', 'kg',  3.99 FROM vegcat c
UNION ALL
SELECT c.category_id, 'Mushrooms', 'kg',  6.99 FROM vegcat c;



-- _______SEAFOOD_VENDOR_______________________________________________SEAFOOD_VENDOR_________________________________________________SEAFOOD_VENDOR________________________________________________________

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('OceanCatch Supplies', 'Seafood', 'info@oceancatch.com');

--  _______MEAT_VENDOR_______________________________________________MEAT_VENDOR_________________________________________________MEAT_VENDOR________________________________________________________

WITH beefcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Beef'
),
vencat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Venison'
),
porkcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Pork'
),
chickencat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Chicken'
),
delicat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Deli'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'Ground Beef', 'kg',   8.99 FROM beefcat c
UNION ALL
SELECT c.category_id, 'Ribeye Steak', 'kg',  24.99 FROM beefcat c
UNION ALL
SELECT c.category_id, 'Sirloin Steak', 'kg',  19.99 FROM beefcat c
UNION ALL
SELECT c.category_id, 'Venison Steak', 'kg',  29.99 FROM vencat c
UNION ALL
SELECT c.category_id, 'Ground Venison', 'kg',  22.99 FROM vencat c
UNION ALL
SELECT c.category_id, 'Pork Chops', 'kg',  9.49 FROM porkcat c
UNION ALL
SELECT c.category_id, 'Bacon', 'kg',  12.99 FROM porkcat c
UNION ALL
SELECT c.category_id, 'Pork Shoulder', 'kg', 7.99 FROM porkcat c
UNION ALL
SELECT c.category_id, 'Whole Chicken', 'kg', 5.49 FROM chickencat c
UNION ALL
SELECT c.category_id, 'Chicken Breast', 'kg',  11.99 FROM chickencat c
UNION ALL
SELECT c.category_id, 'Chicken Thighs', 'kg',  8.99 FROM chickencat c
UNION ALL
SELECT c.category_id, 'Turkey Slices', 'kg',  18.99 FROM delicat c
UNION ALL
SELECT c.category_id, 'Ham Slices', 'kg',  16.99 FROM delicat c;

-- _______DAIRY_VENDOR_______________________________________________DAIRY_VENDOR_________________________________________________DAIRY_VENDOR________________________________________________________

WITH milkcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Dairy'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'Whole Milk', 'L', 2.49 FROM milkcat c
UNION ALL
SELECT c.category_id, '2% Milk', 'L',  2.39 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Skim Milk', 'L',  2.29 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Heavy Cream', 'L',  4.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Half-and-Half Cream', 'L',  3.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Butter', 'kg',  8.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Cheddar Cheese', 'kg',  12.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Mozzarella Cheese', 'kg',  11.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Greek Yogurt', 'kg',  6.49 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Regular Yogurt', 'kg',  4.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Sour Cream', 'kg',  5.49 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Cottage Cheese', 'kg',  5.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Ice Cream', 'L',  7.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Evaporated Milk', 'L',  3.49 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Condensed Milk', 'L',  3.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Large Eggs (Dozen)', 'kg',  3.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Free-Range Eggs (Dozen)', 'kg',  4.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Brown Eggs (Dozen)', 'kg',  4.49 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Organic Eggs (Dozen)', 'kg',  5.99 FROM  milkcat c
UNION ALL
SELECT c.category_id, 'Hard-Boiled Eggs Pack', 'kg',  4.49 FROM milkcat c;

-- _______GRAINS_VENDOR_______________________________________________GRAINS_VENDOR_________________________________________________GRAINS_VENDOR________________________________________________________

WITH 
breadcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Bread and Pastry'
),
noodlecat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Pasta'
),
ricecat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Rice'
),
cerealcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Cereal'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'White Bread Loaf', 'kg',  2.99 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Whole Wheat Bread Loaf', 'kg',  3.49 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Multigrain Bread', 'kg',  3.79 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Baguette', 'kg',  2.49 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Croissant', 'kg',  1.99 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Bagels (Pack of 6)', 'bag',  4.49 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Muffins (Pack of 4)', 'bag',  3.99 FROM breadcat c
UNION ALL
SELECT c.category_id, 'Spaghetti', 'kg',  2.49 FROM noodlecat c
UNION ALL
SELECT c.category_id, 'Penne Pasta', 'kg',  2.59 FROM noodlecat c
UNION ALL
SELECT c.category_id, 'Fusilli Pasta', 'kg',  2.69 FROM noodlecat c
UNION ALL
SELECT c.category_id, 'Macaroni', 'kg',  2.39 FROM noodlecat c
UNION ALL
SELECT c.category_id, 'Lasagna Sheets', 'kg',  3.29 FROM noodlecat c
UNION ALL
SELECT c.category_id, 'White Rice', 'kg', 2.19 FROM ricecat c
UNION ALL
SELECT c.category_id, 'Brown Rice', 'kg', 2.79 FROM ricecat c
UNION ALL
SELECT c.category_id, 'Corn Flakes', 'kg',  4.49 FROM cerealcat c
UNION ALL
SELECT c.category_id, 'Oatmeal', 'kg',  3.29 FROM cerealcat c
UNION ALL
SELECT c.category_id, 'Granola', 'kg',  5.99 FROM cerealcat c
UNION ALL
SELECT c.category_id, 'Bran Cereal', 'kg',  4.79 FROM cerealcat c
UNION ALL
SELECT c.category_id, 'Rice Cereal', 'kg',  4.29 FROM cerealcat c;

-- _______FISH_AND_SEAFOOD_VENDOR_______________________________________________FISH_AND_SEAFOOD_VENDOR_________________________________________________FISH_AND_SEAFOOD_VENDOR________________________________________________________

WITH 
fishcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Fish'
),
seacat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Seafood'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'Walleye Fillet', 'kg',  21.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Yellow Perch Fillet', 'kg',  19.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Lake Trout Fillet', 'kg',  18.49 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Whitefish Fillet', 'kg',  16.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Northern Pike Fillet', 'kg',  14.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Rainbow Trout', 'kg',  15.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Atlantic Salmon', 'kg',  17.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Haddock Fillet', 'kg',  14.99 FROM fishcat c
UNION ALL
SELECT c.category_id,  'Canadian Lobster', 'kg',  28.99 FROM seacat c
UNION ALL
SELECT c.category_id, 'Snow Crab Legs', 'kg',  26.99 FROM seacat c
UNION ALL
SELECT c.category_id, 'PEI Mussels', 'kg',  6.49 FROM seacat c
UNION ALL
SELECT c.category_id, 'Atlantic Clams', 'kg',  7.49 FROM seacat c
UNION ALL
SELECT c.category_id, 'Bay Scallops', 'kg',  23.99 FROM seacat c
UNION ALL
SELECT c.category_id,  'Smoked Lake Whitefish', 'kg',  29.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Smoked Salmon', 'kg',  32.99 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Canned Sockeye Salmon', 'kg',  12.49 FROM fishcat c
UNION ALL
SELECT c.category_id, 'Pollock Fish Sticks', 'kg',  8.49 FROM fishcat c;

-- _______BAKE_SUPPLIES_VENDOR_______________________________________________BAKE_SUPPLIES_VENDOR_________________________________________________BAKE_SUPPLIES_VENDOR________________________________________________________

WITH 
bakedcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Baking'
)
INSERT INTO product (category_id, product_name, unit_of_measure, price_per_unit)
SELECT c.category_id, 'All-Purpose Flour (Stone-Milled)', 'kg',  3.49 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Whole Wheat Flour', 'kg', 3.79 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Rye Flour', 'kg',  4.29 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Spelt Flour', 'kg',  4.99 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Cornmeal', 'kg',  3.29 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Rolled Oats', 'kg',  2.99 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Maple Syrup (Ontario)', 'L',  12.99 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Honey (Local Wildflower)', 'kg',  9.99 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Beeswax Honeycomb', 'kg',  14.99 FROM bakedcat c
UNION ALL
SELECT c.category_id, 'Black Walnuts', 'kg',  12.99 FROM bakedcat c
UNION ALL
SELECT c.category_id,  'Hazelnuts (Ontario)', 'kg',  11.99 FROM bakedcat c;

-- SEED INVENTORY TABLE

INSERT INTO inventory (product_id, total_stored_quantity, price_per_unit, last_stock_date)
SELECT 
    product_id,
    1 AS total_stored_quantity,
    price_per_unit,
    CURRENT_TIMESTAMP AS last_stock_date
FROM product;

-- SEED VENDOR INVENTORY LOT TABLE
-- Needs manual population



