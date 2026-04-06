-- V2__create_vendor_table.sql

-- Create table
CREATE TABLE vendor (
    vendor_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    dominant_product VARCHAR(30),
    contact_email VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);