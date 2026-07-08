Retail Supply Chain & Sales Performance Analysis
Project Overview
This project analyzes retail sales, profitability, and shipping performance using SQL and Excel, based on a multi-year retail supply chain dataset. The goal was to answer real business questions around profitability, discounting strategy, shipping efficiency, and customer value — the kind of questions commonly asked in data analyst interviews.
Tools Used

SQLite (DB Browser) — data querying and cleaning
Microsoft Excel — pivot analysis, dashboard visualization

Business Questions Answered

Which regions generate the most sales and profit?
Which product sub-categories are profitable vs. losing money?
Does discounting strategy affect profitability?
How does shipping time vary by region and shipping method?
Which products and customers drive the most revenue and profit?

Key Insights

Furniture sub-categories are losing money: Tables (-$17,725) and Bookcases (-$3,472) are unprofitable despite meaningful sales volume, while Technology sub-categories like Copiers (+$55,617) and Phones (+$44,516) lead in profitability.
Discounting is directly linked to losses: Furniture sub-categories with average discounts above 20% (Tables, Bookcases) operate at a net loss, while sub-categories with discounts under 18% (Chairs, Furnishings) remain solidly profitable.
Shipping times vary significantly by method and region: "Same Day" shipping is near-instant (under 0.3 days), while "Standard Class" shipping averages 30-44 days depending on region, with Central region showing the longest average (44 days) — a potential logistics bottleneck.
Central region shows strong customer concentration: 3 of the top 6 highest-spending customers are based in the Central region, suggesting a valuable customer base worth targeted retention strategies.
Sales growth has outpaced profit growth over time: the multi-year trend shows sales climbing steadily, while profit remains comparatively flat and volatile — reinforcing the discount-driven margin erosion seen at the sub-category level.

Dashboard Preview
<img width="779" height="527" alt="dashboard" src="https://github.com/user-attachments/assets/82da3287-b681-417c-be9f-a575234326fc" />

Files in this Repository

retail_supply_chain.db — SQLite database
queries.sql — all analysis queries, commented
Retail_Analysis_Dashboard.xlsx — Excel dashboard with pivot tables and charts
dashboard_preview.pdf — preview image in pdf

How to Reproduce

Open retail_supply_chain.db in DB Browser for SQLite
Run queries from queries.sql to reproduce each analysis
Open Retail_Analysis_Dashboard.xlsx to view the interactive dashboard
