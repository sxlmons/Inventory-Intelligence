-- V5__create_vendorinventorylot_table.sql

CREATE TABLE vendorinventorylot (
    vendor_id INT,
    product_id INT,
    quantity_on_hand INT NOT NULL DEFAULT 0,
    unit_of_measurement VARCHAR(10) NOT NULL DEFAULT 'kg',
    last_restocked_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (vendor_id, product_id)
);

-- Foreign key: product
ALTER TABLE vendorinventorylot
ADD CONSTRAINT vendorinventorylot_product_id_fkey
FOREIGN KEY (product_id) REFERENCES product(product_id);

-- Foreign key: vendor
ALTER TABLE vendorinventorylot
ADD CONSTRAINT vendorinventorylot_vendor_id_fkey
FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id);

-- index (mostly redundant since PK is indexed)
CREATE INDEX idx_vil_product
ON vendorinventorylot(product_id);