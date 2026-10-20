# Retail Supply Chain & Sales Performance Analysis

> SQL + Excel analytics project focused on profitability, discount strategy, shipping performance, customer value, and management-ready reporting.

## Project Overview

This project analyzes a multi-year retail supply-chain dataset using **SQLite and Microsoft Excel**. The objective is to turn raw transactional data into clear business findings that can support pricing, product, customer, and logistics decisions.

### Skills Demonstrated

`SQL` · `SQLite` · `Excel` · `PivotTables` · `Data Cleaning` · `Exploratory Data Analysis` · `KPI Reporting` · `Business Analysis`

## Business Questions

- Which regions generate the most sales and profit?
- Which product sub-categories are profitable and which are losing money?
- How does discounting relate to profitability?
- How does shipping time vary by region and shipping method?
- Which products and customers contribute the most revenue and profit?
- How have sales and profit changed over time?

## Key Findings

| Area | Finding |
|---|---|
| Product profitability | Tables (-$17,725) and Bookcases (-$3,472) were loss-making, while Copiers (+$55,617) and Phones (+$44,516) led profitability. |
| Discount strategy | Loss-making Furniture sub-categories also showed average discounts above 20%, indicating margin pressure associated with heavier discounting. |
| Shipping | Same Day shipping averaged under 0.3 days, while Standard Class averaged roughly 30–44 days depending on region. |
| Regional operations | Central had the longest average Standard Class shipping time at about 44 days, highlighting a potential logistics bottleneck. |
| Customer value | Three of the six highest-spending customers identified in the analysis were in Central. |
| Trend | Sales increased over the analyzed period while profit remained comparatively flatter and more volatile. |

## Dashboard Preview

![Retail Analysis Dashboard](https://github.com/user-attachments/assets/82da3287-b681-417c-be9f-a575234326fc)

The interactive Excel workbook contains PivotTable-based analysis and charts for business performance monitoring.

## Analysis Workflow

1. Loaded the retail dataset into SQLite.
2. Used SQL for filtering, aggregation, joins, KPI calculation, and business-question analysis.
3. Validated and summarized results for reporting.
4. Built Excel PivotTables and charts.
5. Created a dashboard to communicate the most important findings.

## Repository Structure

| File | Purpose |
|---|---|
| `queries.sql` | Documented SQL analysis queries |
| `retail_supply_chain.db` | SQLite database used for analysis |
| `Retail_Analysis_Dashboard.xlsx` | Excel analysis/dashboard workbook |
| `dashboard_preview.pdf` | Dashboard preview |
| `Retail_Analysis_Dashboard_made.xlsx` | Additional workbook version retained in the repository |

## How to Reproduce

1. Open `retail_supply_chain.db` using DB Browser for SQLite or another SQLite client.
2. Run the queries in `queries.sql`.
3. Open `Retail_Analysis_Dashboard.xlsx` in Microsoft Excel.
4. Review the PivotTables, charts, KPIs, and dashboard findings.

## Business Recommendations

- Review discount levels for loss-making Furniture sub-categories before expanding promotions.
- Investigate Standard Class shipping performance in Central.
- Prioritize retention and targeted offers for high-value customers.
- Track profit alongside sales growth so revenue gains do not hide margin deterioration.

## What This Project Demonstrates

This project shows my ability to move from **raw data → SQL analysis → Excel reporting → business recommendations**, with emphasis on communicating findings in a way that is useful to decision-makers.

---
**Author:** Bindu Burla  
**Focus:** Data Analytics · SQL · Excel · Business Intelligence
