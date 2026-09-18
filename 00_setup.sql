-- Create tables from Olist CSV files

CREATE OR REPLACE TABLE customers AS
SELECT * FROM read_csv_auto('olist_customers_dataset.csv');

CREATE OR REPLACE TABLE orders AS
SELECT * FROM read_csv_auto('olist_orders_dataset.csv');

CREATE OR REPLACE TABLE order_items AS
SELECT * FROM read_csv_auto('olist_order_items_dataset.csv');

CREATE OR REPLACE TABLE order_payments AS
SELECT * FROM read_csv_auto('olist_order_payments_dataset.csv');

CREATE OR REPLACE TABLE order_reviews AS
SELECT * FROM read_csv_auto('olist_order_reviews_dataset.csv');

CREATE OR REPLACE TABLE products AS
SELECT * FROM read_csv_auto('olist_products_dataset.csv');

CREATE OR REPLACE TABLE sellers AS
SELECT * FROM read_csv_auto('olist_sellers_dataset.csv');

CREATE OR REPLACE TABLE geolocation AS
SELECT * FROM read_csv_auto('olist_geolocation_dataset.csv');

CREATE OR REPLACE TABLE category_translation AS
SELECT * FROM read_csv_auto('product_category_name_translation.csv');

SHOW TABLES;
