-- =========================================================
-- Retail Supply Chain & Sales Performance Analysis
-- Author: Bindu Burla
-- Tool: SQLite (DB Browser for SQLite)
-- Dataset: Retail Supply Chain Sales Dataset (Superstore-style)
-- =========================================================

-- ---------------------------------------------------------
-- 0. DATA CLEANING
-- Dates were imported as text in M/D/YYYY format, which
-- SQLite's date functions cannot parse directly. These steps
-- add cleaned columns in YYYY-MM-DD format for date math.
-- ---------------------------------------------------------

ALTER TABLE orders ADD COLUMN Order_Date_Clean TEXT;
ALTER TABLE orders ADD COLUMN Ship_Date_Clean TEXT;

UPDATE orders
SET Order_Date_Clean = 
    substr("Order Date", -4) || '-' ||
    substr('00' || substr("Order Date", 1, instr("Order Date", '/') - 1), -2) || '-' ||
    substr('00' || substr(substr("Order Date", instr("Order Date", '/') + 1), 1, 
           instr(substr("Order Date", instr("Order Date", '/') + 1), '/') - 1), -2);

UPDATE orders
SET Ship_Date_Clean = 
    substr("Ship Date", -4) || '-' ||
    substr('00' || substr("Ship Date", 1, instr("Ship Date", '/') - 1), -2) || '-' ||
    substr('00' || substr(substr("Ship Date", instr("Ship Date", '/') + 1), 1, 
           instr(substr("Ship Date", instr("Ship Date", '/') + 1), '/') - 1), -2);


-- ---------------------------------------------------------
-- 1. SALES & PROFIT BY REGION
-- Business question: Which regions generate the most sales
-- and profit, and how many distinct orders come from each?
-- ---------------------------------------------------------

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- ---------------------------------------------------------
-- 2. PROFIT / LOSS BY SUB-CATEGORY
-- Business question: Which product sub-categories are
-- profitable, and which are losing money despite sales volume?
-- ---------------------------------------------------------

SELECT 
    Category,
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Category, "Sub-Category"
ORDER BY Total_Profit ASC;


-- ---------------------------------------------------------
-- 3. DISCOUNT vs PROFIT (FURNITURE DEEP-DIVE)
-- Business question: Does high discounting explain why
-- certain Furniture sub-categories operate at a loss?
-- ---------------------------------------------------------

SELECT 
    "Sub-Category",
    ROUND(AVG(Discount), 3) AS Avg_Discount,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
WHERE Category = 'Furniture'
GROUP BY "Sub-Category"
ORDER BY Avg_Discount DESC;


-- ---------------------------------------------------------
-- 4. AVERAGE SHIPPING TIME BY REGION & SHIP MODE
-- Business question: How does shipping time vary by region
-- and shipping method? Are any combinations unusually slow?
-- ---------------------------------------------------------

SELECT 
    Region,
    "Ship Mode",
    ROUND(AVG(JULIANDAY(Ship_Date_Clean) - JULIANDAY(Order_Date_Clean)), 2) AS Avg_Shipping_Days
FROM orders
GROUP BY Region, "Ship Mode"
ORDER BY Region, Avg_Shipping_Days;


-- ---------------------------------------------------------
-- 5. TOP 10 PRODUCTS BY SALES
-- Business question: Which products generate the most revenue?
-- ---------------------------------------------------------

SELECT 
    "Product Name",
    Category,
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;


-- ---------------------------------------------------------
-- 6. TOP 10 PRODUCTS BY PROFIT
-- Business question: Which products are most profitable?
-- (Compared against Query 5 to see if top sellers = top earners)
-- ---------------------------------------------------------

SELECT 
    "Product Name",
    Category,
    "Sub-Category",
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;


-- ---------------------------------------------------------
-- 7. TOP CUSTOMERS BY SPEND (WINDOW FUNCTION)
-- Business question: Who are the highest-value customers,
-- and are they concentrated in any particular region?
-- Uses RANK() OVER() to rank customers by total spend.
-- ---------------------------------------------------------

SELECT 
    "Customer Name",
    Region,
    ROUND(SUM(Sales), 2) AS Total_Spend,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM orders
GROUP BY "Customer Name", Region
ORDER BY Customer_Rank
LIMIT 15;


-- ---------------------------------------------------------
-- 8. MONTHLY SALES & PROFIT TREND
-- Business question: How have sales and profit trended
-- over time? Has profit growth kept pace with sales growth?
-- ---------------------------------------------------------

SELECT 
    strftime('%Y-%m', Order_Date_Clean) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Month
ORDER BY Month;

-- =========================================================
-- END OF QUERIES
-- =========================================================
