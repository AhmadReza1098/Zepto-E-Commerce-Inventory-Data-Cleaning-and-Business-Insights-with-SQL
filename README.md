# 🛒 data-analysis-zepto-inventory-sql

Analyzing Zepto-style inventory data using **SQL** to uncover pricing, discount, and stock insights for real-world e‑commerce decision-making.

---

## 📌 Table of Contents

- [Overview](#overview)  
- [Business Problem](#business-problem)  
- [Dataset](#dataset)  
- [Tools & Technologies](#tools--technologies)  
- [Project Structure](#project-structure)  
- [Data Cleaning & Preparation](#data-cleaning--preparation)  
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)  
- [Research Questions & Key Findings](#research-questions--key-findings)  
- [How to Run This Project](#how-to-run-this-project)  
- [Future Enhancements](#future-enhancements)  
- [Author & Contact](#author--contact)  

---

## Overview

This project performs end-to-end **SQL analysis on Zepto inventory data**, focusing on product pricing, discounts, stock availability, and potential revenue. The goal is to simulate how a data analyst works with a real e‑commerce inventory table to generate business-ready insights. [web:63][web:61]

---

## Business Problem

Retail inventory teams need to understand:

- Which products and categories drive **maximum value**.  
- Where **discounts** and **stock levels** are not aligned (e.g., high price but out of stock).  
- How much **revenue is locked** in current inventory.  

This project aims to:

- Identify best-value products based on **discountPercent**. [web:61]  
- Detect **high-MRP products** that are out of stock. [web:61]  
- Estimate **potential revenue** using price and availableQuantity. [web:63]  
- Analyze **price-per-gram** and weight-based segmentation to find value products. [web:61]

---

## Dataset

- Source: Zepto inventory–style CSV (one row per SKU). [web:296][web:304]  
- Table used: `zepto_inventory` (created in MySQL).  

Key columns (example):

- `sku_id` – Synthetic primary key for each SKU. [web:61]  
- `name` – Product name from the app. [web:63]  
- `category` – Category such as Fruits, Snacks, Beverages, etc. [web:61]  
- `mrp` – Maximum Retail Price (stored in rupees after conversion). [web:63]  
- `discountPercent` – Discount applied on MRP. [web:61]  
- `availableQuantity` – Current stock units in inventory. [web:63]  
- `discountedSellingPrice` – Effective selling price after discount. [web:61]  
- `weightInGms` – Product weight in grams. [web:61]  
- `outOfStock` – Flag indicating whether the SKU is out of stock. [web:63]  
- `quantity` – Units per pack (for multi-pack products). [web:61]

---

## Tools & Technologies

- **SQL / MySQL** – Database, data cleaning, and analysis queries. [web:63]  
- **GitHub** – Version control and project documentation. [web:294]  
- (Optional) **Power BI / Excel** – For building dashboards from SQL outputs. [web:259][web:262]

---

## Project Structure

Suggested folder layout for this project:

data-analysis-zepto-inventory-sql/
│
├── README.md # Project documentation
├── zepto_inventory.sql # All SQL (table creation + analysis queries)
│
├── sql/
│ ├── 01_create_table.sql
│ ├── 02_data_cleaning.sql
│ ├── 03_eda_queries.sql
│ └── 04_business_insights.sql
│
└── exports/
└── query_results.csv # Optional exports of SQL outputs


This structure follows common patterns used in Zepto inventory SQL portfolio projects. [web:63][web:61]

---

## Data Cleaning & Preparation

Main cleaning and preparation steps performed in SQL:

- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** by dividing by 100. [web:63]  
- Flagged rows with **invalid stock** (availableQuantity = 0 or weightInGms = 0). [web:61]  
- Flagged **invalid prices** (mrp or discountedSellingPrice = 0 or NULL). [web:61]  
- Flagged **invalid quantity** (quantity <= 0 or NULL). [web:61]  
- Created an `is_valid_row` indicator to keep only clean records for analysis. [web:61]

These steps ensure all later EDA and insights use reliable inventory data.

---

## Exploratory Data Analysis (EDA)

Using only valid rows (`is_valid_row = 1`), the EDA explores: [web:63][web:61]

- **Row counts**: total SKUs vs valid SKUs.  
- **Category coverage**: number of SKUs per category.  
- **Price ranges**: min, max, and average MRP by category.  
- **Stock status**: in‑stock vs out‑of‑stock distribution.  

The SQL queries analyze distinct categories, duplicate product names with multiple SKUs, and overall stock volume per category. [web:61][web:63]

---

## Research Questions & Key Findings

Typical business questions answered:

- Which products have the **highest discountPercent** (top 10 best-value items)? [web:61]  
- Which high‑MRP products are **currently out of stock** (missed sales opportunities)? [web:63]  
- What is the **estimated inventory value** by category (discountedSellingPrice × availableQuantity)? [web:61]  
- Which categories provide the **highest average discounts** to customers? [web:61]  
- How does **price per gram** vary across SKUs to identify best value? [web:61]

These insights help identify value products, risky stockouts, and pricing strategies.

---

## How to Run This Project

1. **Set up database**

   - Create a new MySQL database (for example: `zepto`). [web:204]  
   - Run the table creation script from `zepto_inventory.sql` to create `zepto_inventory`. [web:63]

2. **Load data**

   - Import the Zepto CSV into `zepto_inventory` using MySQL Workbench / CLI import. [web:63][web:304]  

3. **Run cleaning queries**

   - Execute the **Data Cleaning** section in `zepto_inventory.sql` to set flags and convert prices. [web:61]  

4. **Run EDA & insight queries**

   - Run EDA queries to check counts, categories, and distributions. [web:63]  
   - Run business insight queries to get discount, revenue, and price-per-gram analysis. [web:61]

5. **(Optional) Build dashboard**

   - Connect Power BI / Excel to the MySQL database. [web:256][web:259]  
   - Use cleaned tables or SQL views as data sources to create visuals like category revenue, stock status, and discount analysis. [web:262]

---

## Future Enhancements

- Add **SQL views** (e.g., `vw_clean_inventory`, `vw_category_summary`) for easier reporting. [web:64][web:61]  
- Build a **Power BI dashboard** to visualize inventory value, discount patterns, and stockouts. [web:262]  
- Extend analysis to **time-based trends** if timestamp data is added. [web:305]

---

## Author & Contact

**Your Name**  
Aspiring Data Analyst – SQL & BI  

- 📧 Email: ahmadreza6122@gmail.com  
- 🔗 LinkedIn: www.linkedin.com/in/ahmad-reza-econ  
- 🔗 https://github.com/AhmadReza1098  

Feel free to use or adapt this project as part of your analytics portfolio.


