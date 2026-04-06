-- V4__create_inventory_table.sql

-- Create table
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    product_id INT,
    total_stored_quantity INT NOT NULL DEFAULT 0,
    last_stock_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    price_per_unit DOUBLE PRECISION NOT NULL DEFAULT 0.00
);

-- Foreign key: product
ALTER TABLE inventory
ADD CONSTRAINT inventory_product_id_fkey
FOREIGN KEY (product_id) REFERENCES product(product_id);