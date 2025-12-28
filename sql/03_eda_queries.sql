-- Quick check
SELECT 
    *
FROM
    zepto_inventory
LIMIT 10;

-- Check rows with any NULLs in important columns
SELECT 
    *
FROM
    zepto_inventory
WHERE
    name IS NULL OR category IS NULL
        OR mrp IS NULL
        OR discountPercent IS NULL
        OR availableQuantity IS NULL
        OR discountedSellingPrice IS NULL
        OR outOfStock IS NULL
        OR quantity IS NULL;

-- Count rows where ALL key columns are NULL
SELECT 
    COUNT(*) AS null_rows
FROM
    zepto_inventory
WHERE
    name IS NULL AND category IS NULL
        AND mrp IS NULL
        AND discountPercent IS NULL
        AND availableQuantity IS NULL
        AND discountedSellingPrice IS NULL
        AND outOfStock IS NULL
        AND quantity IS NULL;
