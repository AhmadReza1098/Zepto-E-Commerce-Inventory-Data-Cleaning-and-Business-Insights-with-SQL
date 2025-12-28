-- 1) Stock availability on clean data
SELECT 
    outOfStock, 
    COUNT(*) AS SKUs_count
FROM 
    zepto_inventory
WHERE 
    is_valid_row = 1
GROUP BY 
    outOfStock;

-- 2) Inventory value by category (clean + in stock)
SELECT
    category,
    SUM(discountedSellingPrice * availableQuantity) AS total_inventory_value
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
    AND outOfStock = 'FALSE'
GROUP BY
    category
ORDER BY
    total_inventory_value DESC;

-- 3) Top SKUs by potential revenue (clean + in stock)
SELECT
    sku_id,
    name,
    category,
    discountedSellingPrice,
    availableQuantity,
    (discountedSellingPrice * availableQuantity) AS potential_revenue
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
    AND outOfStock = 'FALSE'
ORDER BY
    potential_revenue DESC
LIMIT 20;

-- 4) Category-wise discount behaviour (clean only)
SELECT
    category,
    COUNT(*) AS sku_count,
    AVG(discountPercent) AS avg_discount_pct,
    MAX(discountPercent) AS max_discount_pct,
    MIN(discountPercent) AS min_discount_pct
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
GROUP BY
    category
ORDER BY
    avg_discount_pct DESC;

-- 5) Top 10 best-value products by discount%
SELECT
    name,
    category,
    mrp,
    discountPercent,
    discountedSellingPrice
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
ORDER BY
    discountPercent DESC
LIMIT 10;

-- 6) High-MRP products that are out of stock
SELECT DISTINCT
    name,
    category,
    mrp
FROM
    zepto_inventory
WHERE
    outOfStock = 'TRUE'
    AND mrp > 300
ORDER BY
    mrp DESC;

-- 7) Expensive products (MRP > 500) with low discount (< 10%)
SELECT DISTINCT
    name,
    category,
    mrp,
    discountPercent
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
    AND mrp > 500
    AND discountPercent < 10
ORDER BY
    mrp DESC,
    discountPercent DESC;

-- 8) Top 5 categories by average discount
SELECT
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
GROUP BY
    category
ORDER BY
    avg_discount DESC
LIMIT 5;

-- 9) Price per gram (value for money)
SELECT
    name,
    category,
    weightInGms,
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gms
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
    AND weightInGms > 100
ORDER BY
    price_per_gms;

-- 10) Weight-based product buckets
SELECT DISTINCT
    name,
    category,
    weightInGms,
    CASE
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM
    zepto_inventory
WHERE
    is_valid_row = 1;

-- 11) Total inventory weight per category
SELECT
    category,
    SUM(weightInGms * availableQuantity) AS total_weight
FROM
    zepto_inventory
WHERE
    is_valid_row = 1
GROUP BY
    category
ORDER BY
    total_weight DESC;
