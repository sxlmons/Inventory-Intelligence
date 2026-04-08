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

--  _______VEGETABLE_VENDOR_______________________________________________VEGETABLE_VENDOR_________________________________________________VEGETABLE_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Green Valley Produce', 'Vegetables', 'sales@greenvalleyproduce.com')
    RETURNING vendor_id
),
vegcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Vegetables'
)
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'Carrots', 'kg', 0.10, 1.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Potatoes', 'kg', 0.20, 1.49 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Sweet Potatoes', 'kg', 0.25, 2.49 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Onions', 'kg', 0.15, 1.79 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Lettuce', 'kg', 0.30, 2.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Spinach', 'kg',  0.05, 4.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Kale', 'kg', 0.08, 3.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Broccoli', 'kg', 0.40, 2.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Cauliflower', 'kg', 0.80, 3.49 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Bell Peppers', 'kg', 0.15, 4.49 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Zucchini', 'kg', 0.20, 2.79 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Cucumber', 'kg', 0.30, 1.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Tomatoes', 'kg', 0.12, 3.99 FROM vendors v
CROSS JOIN vegcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Mushrooms', 'kg', 0.02, 6.99 FROM vendors v
CROSS JOIN vegcat c;



-- _______SEAFOOD_VENDOR_______________________________________________SEAFOOD_VENDOR_________________________________________________SEAFOOD_VENDOR________________________________________________________

INSERT INTO vendor (name, dominant_product, contact_email)
VALUES ('OceanCatch Supplies', 'Seafood', 'info@oceancatch.com');

--  _______MEAT_VENDOR_______________________________________________MEAT_VENDOR_________________________________________________MEAT_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Prime Meat Distributors', 'Beef', 'support@primemeat.com')
    RETURNING vendor_id
),
beefcat AS (
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
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'Ground Beef', 'kg',  0.50, 8.99 FROM vendors v
CROSS JOIN beefcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Ribeye Steak', 'kg', 0.30, 24.99 FROM vendors v
CROSS JOIN beefcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Sirloin Steak', 'kg', 0.28, 19.99 FROM vendors v
CROSS JOIN beefcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Venison Steak', 'kg', 0.30, 29.99 FROM vendors v
CROSS JOIN vencat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Ground Venison', 'kg', 0.50, 22.99 FROM vendors v
CROSS JOIN vencat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Pork Chops', 'kg', 0.25, 9.49 FROM vendors v
CROSS JOIN porkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Bacon', 'kg', 0.20, 12.99 FROM vendors v
CROSS JOIN porkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Pork Shoulder', 'kg', 1.50, 7.99 FROM vendors v
CROSS JOIN porkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Whole Chicken', 'kg', 1.60, 5.49 FROM vendors v
CROSS JOIN chickencat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Chicken Breast', 'kg', 0.25, 11.99 FROM vendors v
CROSS JOIN chickencat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Chicken Thighs', 'kg', 0.20, 8.99 FROM vendors v
CROSS JOIN chickencat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Turkey Slices', 'kg', 0.01, 18.99 FROM vendors v
CROSS JOIN delicat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Ham Slices', 'kg', 0.01, 16.99 FROM vendors v
CROSS JOIN delicat c;

-- _______DAIRY_VENDOR_______________________________________________DAIRY_VENDOR_________________________________________________DAIRY_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('DairyBest Ltd', 'Dairy', 'hello@dairybest.com')
    RETURNING vendor_id
),
milkcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Dairy'
)
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'Whole Milk', 'L', 1.00, 2.49 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, '2% Milk', 'L', 1.00, 2.39 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Skim Milk', 'L', 1.00, 2.29 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Heavy Cream', 'L', 0.50, 4.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Half-and-Half Cream', 'L', 0.50, 3.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Butter', 'kg', 0.25, 8.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Cheddar Cheese', 'kg', 0.30, 12.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Mozzarella Cheese', 'kg', 0.30, 11.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Greek Yogurt', 'kg', 0.50, 6.49 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Regular Yogurt', 'kg', 0.50, 4.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Sour Cream', 'kg', 0.25, 5.49 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Cottage Cheese', 'kg', 0.50, 5.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Ice Cream', 'L', 1.00, 7.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Evaporated Milk', 'L', 0.35, 3.49 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Condensed Milk', 'L', 0.35, 3.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Large Eggs (Dozen)', 'kg', 0.70, 3.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Free-Range Eggs (Dozen)', 'kg', 0.70, 4.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Brown Eggs (Dozen)', 'kg', 0.70, 4.49 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Organic Eggs (Dozen)', 'kg', 0.70, 5.99 FROM vendors v
CROSS JOIN milkcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Hard-Boiled Eggs Pack', 'kg', 0.30, 4.49 FROM vendors v
CROSS JOIN milkcat c;

-- _______GRAINS_VENDOR_______________________________________________GRAINS_VENDOR_________________________________________________GRAINS_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Stone Mills Waterloo', 'Bread and Pastry', 'stonemillsKW@gmail.com')
    RETURNING vendor_id
),
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
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'White Bread Loaf', 'kg', 0.60, 2.99 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Whole Wheat Bread Loaf', 'kg', 0.60, 3.49 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Multigrain Bread', 'kg', 0.65, 3.79 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Baguette', 'kg', 0.30, 2.49 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Croissant', 'kg', 0.08, 1.99 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Bagels (Pack of 6)', 'kg', 0.50, 4.49 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Muffins (Pack of 4)', 'kg', 0.40, 3.99 FROM vendors v
CROSS JOIN breadcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Spaghetti', 'kg', 0.50, 2.49 FROM vendors v
CROSS JOIN noodlecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Penne Pasta', 'kg', 0.50, 2.59 FROM vendors v
CROSS JOIN noodlecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Fusilli Pasta', 'kg', 0.50, 2.69 FROM vendors v
CROSS JOIN noodlecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Macaroni', 'kg', 0.50, 2.39 FROM vendors v
CROSS JOIN noodlecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Lasagna Sheets', 'kg', 0.50, 3.29 FROM vendors v
CROSS JOIN noodlecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'White Rice', 'kg', 1.00, 2.19 FROM vendors v
CROSS JOIN ricecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Brown Rice', 'kg', 1.00, 2.79 FROM vendors v
CROSS JOIN ricecat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Corn Flakes', 'kg', 0.50, 4.49 FROM vendors v
CROSS JOIN cerealcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Oatmeal', 'kg', 1.00, 3.29 FROM vendors v
CROSS JOIN cerealcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Granola', 'kg', 0.50, 5.99 FROM vendors v
CROSS JOIN cerealcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Bran Cereal', 'kg', 0.50, 4.79 FROM vendors v
CROSS JOIN cerealcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Rice Cereal', 'kg', 0.50, 4.29 FROM vendors v
CROSS JOIN cerealcat c;

-- _______FISH_AND_SEAFOOD_VENDOR_______________________________________________FISH_AND_SEAFOOD_VENDOR_________________________________________________FISH_AND_SEAFOOD_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Canadian Fish Farm', 'Fish', 'CFFNational@gmail.com')
    RETURNING vendor_id
),
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
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'Walleye Fillet', 'kg', 0.30, 21.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Yellow Perch Fillet', 'kg', 0.25, 19.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Lake Trout Fillet', 'kg', 0.35, 18.49 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Whitefish Fillet', 'kg', 0.30, 16.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Northern Pike Fillet', 'kg', 0.40, 14.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Rainbow Trout', 'kg', 0.35, 15.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Atlantic Salmon', 'kg', 0.30, 17.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Haddock Fillet', 'kg', 0.30, 14.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id,  'Canadian Lobster', 'kg', 1.20, 28.99 FROM vendors v
CROSS JOIN seacat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Snow Crab Legs', 'kg', 0.80, 26.99 FROM vendors v
CROSS JOIN seacat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'PEI Mussels', 'kg', 1.00, 6.49 FROM vendors v
CROSS JOIN seacat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Atlantic Clams', 'kg', 1.00, 7.49 FROM vendors v
CROSS JOIN seacat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Bay Scallops', 'kg', 0.30, 23.99 FROM vendors v
CROSS JOIN seacat c
UNION ALL
SELECT v.vendor_id, c.category_id,  'Smoked Lake Whitefish', 'kg', 0.25, 29.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Smoked Salmon', 'kg', 0.25, 32.99 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Canned Sockeye Salmon', 'kg', 0.20, 12.49 FROM vendors v
CROSS JOIN fishcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Pollock Fish Sticks', 'kg', 0.40, 8.49 FROM vendors v
CROSS JOIN fishcat c;

-- _______BAKE_SUPPLIES_VENDOR_______________________________________________BAKE_SUPPLIES_VENDOR_________________________________________________BAKE_SUPPLIES_VENDOR________________________________________________________

WITH vendors AS (
    INSERT INTO vendor (name, dominant_product, contact_email)
    VALUES ('Bakers of Waterloo', 'Baking', 'ComeNBake@icloud.com')
    RETURNING vendor_id
),
bakedcat AS (
    SELECT category_id 
    FROM category 
    WHERE category_name = 'Baking'
)
INSERT INTO product (vendor_id, category_id, product_name, unit_of_measure, avg_weight_per, price_per_unit_of_weight)
SELECT v.vendor_id, c.category_id, 'All-Purpose Flour (Stone-Milled)', 'kg', 1.00, 3.49 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Whole Wheat Flour', 'kg', 1.00, 3.79 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Rye Flour', 'kg', 1.00, 4.29 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Spelt Flour', 'kg', 1.00, 4.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Cornmeal', 'kg', 1.00, 3.29 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Rolled Oats', 'kg', 1.00, 2.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Maple Syrup (Ontario)', 'L', 0.50, 12.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Honey (Local Wildflower)', 'kg', 0.50, 9.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Beeswax Honeycomb', 'kg', 0.30, 14.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id, 'Black Walnuts', 'kg', 0.40, 12.99 FROM vendors v
CROSS JOIN bakedcat c
UNION ALL
SELECT v.vendor_id, c.category_id,  'Hazelnuts (Ontario)', 'kg', 0.40, 11.99 FROM vendors v
CROSS JOIN bakedcat c;

-- SEED INVENTORY TABLE

INSERT INTO inventory (product_id, total_stored_quantity, price_per_unit, last_stock_date)
SELECT 
    product_id,
    1 AS total_stored_quantity,
    price_per_unit_of_weight AS price_per_unit,
    CURRENT_TIMESTAMP AS last_stock_date
FROM product;

-- SEED VENDOR INVENTORY LOT TABLE

INSERT INTO vendorinventorylot (
    vendor_id,
    product_id,
    quantity_on_hand,
    unit_of_measurement,
    total_weight,
    last_restocked_date
)
SELECT 
    vendor_id,
    product_id,
    1,
    unit_of_measure,
    avg_weight_per * 1,
    CURRENT_TIMESTAMP
FROM product;



