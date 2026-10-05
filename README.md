Supply Chain Delivery Performance Analysis

📌 Project Overview

This project analyzes delivery performance in a supply chain using SQL and Power BI.

The objective is to identify the routes, transportation modes, shipping carriers, locations, and product types associated with higher delivery delays and provide clear insights that can help improve delivery performance.

The project focuses specifically on delivery performance, rather than analyzing the entire supply chain.

🎯 Business Problem

A company wants to improve its delivery performance and reduce delays. However, delivery performance may vary across different routes, transportation modes, shipping carriers, locations, and product categories.

The key business problem is:

How can the company identify the areas contributing to poor delivery performance and prioritize operational improvements?

🔎 Business Questions

The analysis answers the following questions:

How many total deliveries are recorded?

What is the average shipping time?

How many deliveries are classified as late?

What percentage of deliveries are late?

Which shipping carriers have the highest late-delivery rates?

Which locations have higher late-delivery rates?

Which product types have higher late-delivery rates?

Which routes have the highest late-delivery rates?

Which transportation modes have higher late-delivery rates?

How does delivery performance vary between routes and transportation modes?

What are the average shipping costs across routes?

Which routes should be prioritized for delivery-performance improvement?

🛠️ Tools & Technologies

SQL – Data exploration, aggregation, filtering, subqueries, CTEs, and window functions

Power BI – Data modeling, DAX measures, interactive visualizations, slicers, and dashboard development

GitHub – Project documentation and portfolio presentation

📊 Dashboard



Key KPIs

KPI

Result

Total Deliveries

100

Late Deliveries

57

Late Delivery Rate

57%

Average Shipping Time

5.75

Average Shipping Cost

5.55

📈 Key Dashboard Analysis

1. Shipping Carrier Performance

Late-delivery rates:

Carrier C – 66%

Carrier A – 61%

Carrier B – 49%

Carrier C has the highest late-delivery rate among the three carriers.

2. Location Performance

The highest late-delivery rate is observed in:

Chennai – 65%

Delhi – 60%

Kolkata – 60%

Bangalore – 50%

Mumbai – 50%

3. Product Type Performance

Late-delivery rates by product type:

Cosmetics – 77%

Skincare – 53%

Haircare – 47%

Cosmetics has the highest late-delivery rate among the product types.

4. Route Performance

Late-delivery rates:

Route A – 65%

Route B – 51%

Route C – 50%

Route A has the highest late-delivery rate.

5. Transportation Mode Performance

Late-delivery rates:

Sea – 76%

Rail – 75%

Air – 46%

Road – 38%

Sea and Rail show the highest late-delivery rates, while Road has the lowest.

6. Route × Transportation Mode

The dashboard includes a route and transportation-mode matrix to identify combinations with particularly high late-delivery rates.

Examples:

Route

Air

Rail

Road

Sea

Route A

55%

79%

45%

86%

Route B

29%

73%

38%

67%

Route C

50%

67%

20%

75%

This helps identify specific route/mode combinations that may require further investigation.

💡 Business Insights

Based on the dashboard:

57% of deliveries are classified as late, indicating a significant delivery-performance issue.

Route A has the highest overall late-delivery rate at 65%.

Sea transportation has the highest late-delivery rate at 76%, followed closely by Rail at 75%.

Carrier C has the highest late-delivery rate among carriers at 66%.

Cosmetics has the highest late-delivery rate among product types at 77%.

The route × transportation-mode analysis shows that some combinations perform substantially worse than others, such as Route A + Sea (86%).

Route-level shipping costs can be compared with late-delivery performance to identify areas where operational improvement may have the greatest value.

Important: These results identify patterns and associations in the available data. They do not prove that a particular carrier, route, or transportation mode causes delivery delays.

🧮 SQL Analysis

SQL was used as the analysis layer before visualization.

Key SQL concepts used in the project include:

SELECT

WHERE

GROUP BY

HAVING

Aggregate functions such as AVG(), SUM(), COUNT(), MAX(), and MIN()

Subqueries

Common Table Expressions (CTE)

Window functions

RANK()

PARTITION BY

Ordering and filtering analytical results

Examples of analysis performed:

Average shipping time by carrier

Average shipping cost by carrier

Average shipping time by route

Average shipping cost by route

Late-performance comparison across transportation modes

Routes with above-average shipping time

Carriers ranked by shipping performance

Highest-cost route within each transportation mode

📊 Power BI Analysis

Power BI was used to build the final interactive dashboard.

Dashboard Features

KPI cards

Late-delivery percentage charts

Carrier analysis

Location analysis

Product-type analysis

Route analysis

Transportation-mode analysis

Route × transportation-mode matrix

Route performance table

Interactive slicers

Available Filters

Users can filter the dashboard by:

Transportation Mode

Product Type

Shipping Carrier

Route

Location

🧠 Late Delivery Definition

For this project, a delivery is classified as late when its shipping time is greater than the overall average shipping time.

This provides a simple benchmark for identifying deliveries that take longer than the dataset's average shipping duration.

Note: This is an analytical definition created for this project. A real organization may define late delivery using a contractual SLA, promised delivery date, route-specific target, or customer commitment.

🧹 Data Quality Considerations

During analysis, potential data-quality/process inconsistencies were identified.

For example, some records contain an Inspection Result = Fail while also containing shipping information.

The dataset does not provide enough information to determine whether these products were reworked, re-inspected, rejected, or ultimately delivered.

Therefore, these records should be treated as potential data/process inconsistencies rather than proof that failed products were delivered.

Other useful data-quality checks include:

Missing shipping information

Invalid shipping times

Invalid shipping costs

Zero or negative quantities

Availability vs. products sold inconsistencies

Revenue vs. products sold inconsistencies

Missing carrier, route, or transportation-mode information

📁 Project Structure

Supply-Chain-Delivery-Performance-Analysis/
│
├── README.md
├── dashboard.png
│
├── data/
│   └── supply_chain_data.csv
│
├── sql/
│   └── supply_chain_analysis.sql
│
└── powerbi/
    └── supply_chain_delivery_performance.pbix

🚀 Project Workflow

Raw Supply Chain Data
        ↓
     Data Quality Checks
        ↓
        SQL
        ↓
Exploratory & Performance Analysis
        ↓
     Power BI
        ↓
   DAX + Visualizations
        ↓
Interactive Delivery Dashboard
        ↓
 Business Insights

📌 Recommendations

Based on the observed patterns, the company should:

Investigate Route A, which has the highest overall late-delivery rate.

Review Sea and Rail transportation, which show the highest late-delivery rates.

Investigate the performance of Carrier C.

Examine why Cosmetics has a substantially higher late-delivery rate than other product types.

Investigate high-risk route and transportation-mode combinations, particularly Route A + Sea.

Compare delivery performance with shipping costs before deciding where operational resources should be allocated.

Collect additional operational data such as promised delivery date, actual delivery date, distance, delivery attempts, warehouse/hub, and reason for delay to perform deeper root-cause analysis.

🎓 Skills Demonstrated

This project demonstrates practical skills in:

SQL data analysis

Data aggregation

Business-question-driven analysis

CTEs and subqueries

Window functions and ranking

Power BI dashboard development

DAX measures

KPI design

Interactive filtering

Data-quality analysis

Business insight generation

Data storytelling

👤 Project Type

Portfolio Project | Data Analytics | Supply Chain Analytics

Tools: SQL + Power BI

Focus: Delivery Performance Analysis
https://github.com/sushobhitnigam-commits/supply-chain-analysis/blob/main/delivery%20analysis%20dash
