-- Task 8: Create a materialized view for product info
-- Used by the marketing consultant's MySQL database

CREATE MATERIALIZED VIEW "product_info_m-view" AS
SELECT product.product_name,
       product.description,
       product_type.product_category
FROM product
JOIN product_type ON product.product_type_id = product_type.product_type_id;

-- Refresh the materialized view with data
REFRESH MATERIALIZED VIEW "product_info_m-view";
