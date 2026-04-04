-- V3__create_product_table.sql

-- Create table
CREATE TABLE product (
    product_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vendor_id INT NOT NULL,
    category_id INT NOT NULL,
    product_name VARCHAR(40) NOT NULL,
    unit_of_measure VARCHAR(3) NOT NULL DEFAULT 'kg',
    avg_weight_per DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    price_per_unit_of_weight DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    stocked_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Foreign key: category
ALTER TABLE product
ADD CONSTRAINT product_category_id_fkey
FOREIGN KEY (category_id) REFERENCES category(category_id);

-- Foreign key: vendor
ALTER TABLE product
ADD CONSTRAINT product_vendor_id_fkey
FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id);

-- Indexes
CREATE INDEX idx_product_category
ON product(category_id);

CREATE INDEX idx_product_vendor
ON product(vendor_id);