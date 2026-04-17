-- V1__create_category_table.sql

-- Create table
CREATE TABLE category (
    category_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    parent_category_id INT,
    category_name VARCHAR(30) NOT NULL,
    level_of_category INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Self-referencing foreign key (parent-child hierarchy)
ALTER TABLE category
ADD CONSTRAINT fk_category_parent
FOREIGN KEY (parent_category_id) REFERENCES category(category_id);

-- Check constraint to prevent self-parenting
ALTER TABLE category
ADD CONSTRAINT chk_no_self_parent
CHECK (parent_category_id IS NULL OR parent_category_id != category_id);

-- Index on parent_category_id
CREATE INDEX idx_category_parent
ON category(parent_category_id);