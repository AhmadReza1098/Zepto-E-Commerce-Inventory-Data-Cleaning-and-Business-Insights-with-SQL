DROP TABLE IF EXISTS zepto_inventory;

use zepto;

-- Create table in database
CREATE TABLE zepto_inventory (
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(10 , 2 ),
    discountPercent DECIMAL(5 , 2 ),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(10 , 2 ),
    weightInGms INT,
    outOfStock VARCHAR(50),
    quantity INT
);
