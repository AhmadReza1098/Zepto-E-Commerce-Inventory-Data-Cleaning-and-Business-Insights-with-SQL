# Zepto-E-Commerce-Inventory-Data-Cleaning-and-Business-Insights-with-SQL

## Project Overview
This SQL project analyzes a Zepto-style grocery inventory dataset (from Kaggle) that mimics a real e-commerce catalog with duplicate products, inconsistent values, and missing or incorrect information. The work is done end-to-end in MySQL: from schema creation and raw CSV import, through data cleaning and flagging, to business-driven analysis of inventory value, discount strategies, and stockouts.

**1. Setting up a messy inventory database**
The project starts by designing and creating a zepto_inventory table in MySQL, then importing the raw CSV scraped from Zepto’s product listings.
​
Columns include: category, name, mrp, discountPercent, discountedSellingPrice, availableQuantity, weightInGms, outOfStock, quantity, and a synthetic sku_id primary key.
​

Import issues such as booleans stored as text (TRUE/FALSE), mis-typed numeric columns, and extra blank rows are handled during setup.

A synthetic sku_id is added to uniquely identify each SKU, even when product names repeat across categories or pack sizes.

**2. Exploratory Data Analysis (EDA) in SQL**
Once the table is populated, the project runs EDA queries to understand the catalog and expose quality problems.
​
Counts and samples: total SKUs, SELECT * LIMIT 10, and distinct category lists to see catalog breadth.

Stock status: in-stock vs out-of-stock counts using outOfStock, plus duplicate product names to identify multi-SKU items.

Pricing patterns: min, max, and average mrp and discountPercent to understand price ranges and discount behavior by category.

**3. Data cleaning and validation logic**
To make the data analysis-ready, the project adds explicit data-quality flags and a combined validity indicator.
​
Flags created:

is_invalid_stock – SKUs with zero stock or zero weight (availableQuantity = 0 or weightInGms = 0).

is_invalid_price – SKUs with mrp or discountedSellingPrice missing or equal to zero.

is_invalid_qty – SKUs with quantity missing or <= 0.
​

A unified is_valid_row flag is built with a CASE expression to mark rows as valid only when none of the invalid flags are set.
​

Prices are standardized from paise to rupees by dividing mrp and discountedSellingPrice by 100 for readability and consistency.

**4. Business-driven SQL insights**
With is_valid_row = 1 as the clean subset, the project answers core inventory and pricing questions using SQL.
​
Stock availability:

In-stock vs out-of-stock SKUs and a breakdown of out-of-stock rows by validity.

Identification of high-MRP products that are currently out of stock, highlighting restocking priorities.

Revenue and inventory value:

Estimated inventory value by category using discountedSellingPrice * availableQuantity.

Top SKUs by potential revenue, sorted by total value at selling price.
​
Pricing and discount strategy:

Top 10 SKUs by discount percentage and categories with the highest average discounts.

Expensive products (MRP > ₹500) offering minimal discounts, indicating premium or overpriced items.

Value for money and weight-based analysis:

Price-per-gram calculations to find best value products for customers.

Bucketing SKUs into Low, Medium, and Bulk weight categories, and computing total inventory weight by category.

