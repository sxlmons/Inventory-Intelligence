-- V5__create_vendorinventorylot_table.sql

-- Create table
CREATE TABLE vendorinventorylot (
    lot_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vendor_id INT NOT NULL,
    product_id INT,
    quantity_on_hand INT NOT NULL DEFAULT 0,
    unit_of_measurement VARCHAR(3) NOT NULL DEFAULT 'kg',
    total_weight DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    last_restocked_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Foreign key: product
ALTER TABLE vendorinventorylot
ADD CONSTRAINT vendorinventorylot_product_id_fkey
FOREIGN KEY (product_id) REFERENCES product(product_id);

-- Foreign key: vendor
ALTER TABLE vendorinventorylot
ADD CONSTRAINT vendorinventorylot_vendor_id_fkey
FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id);

-- Indexes
CREATE INDEX idx_vil_vendor
ON vendorinventorylot(vendor_id);

CREATE INDEX idx_vil_product
ON vendorinventorylot(product_id);