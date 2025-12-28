-- 1) Convert prices from paise to rupees
UPDATE zepto_inventory
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

-- 2) Flag invalid stock (zero stock or zero weight)
ALTER TABLE zepto_inventory
ADD COLUMN is_invalid_stock TINYINT(1) DEFAULT 0;

UPDATE zepto_inventory
SET is_invalid_stock = 1
WHERE availableQuantity = 0
   OR weightInGms = 0;

-- 3) Flag invalid price (missing or zero price)
ALTER TABLE zepto_inventory
ADD COLUMN is_invalid_price TINYINT(1) DEFAULT 0;

UPDATE zepto_inventory
SET is_invalid_price = 1
WHERE mrp IS NULL
   OR mrp = 0
   OR discountedSellingPrice IS NULL
   OR discountedSellingPrice = 0;

-- 4) Flag invalid quantity (missing or <= 0)
ALTER TABLE zepto_inventory
ADD COLUMN is_invalid_qty TINYINT(1) DEFAULT 0;

UPDATE zepto_inventory
SET is_invalid_qty = 1
WHERE quantity IS NULL
   OR quantity <= 0;

-- 5) Combined valid-row flag
ALTER TABLE zepto_inventory
ADD COLUMN is_valid_row TINYINT(1) DEFAULT 1;

UPDATE zepto_inventory
SET is_valid_row = CASE
    WHEN is_invalid_stock = 1
      OR is_invalid_price = 1
      OR is_invalid_qty = 1
    THEN 0
    ELSE 1
END;
