# E-Commerce Customer Retention & Revenue Intelligence

## Executive Summary

**E-Commerce Customer Retention & Revenue Intelligence** is an end-to-end data analytics project focused on understanding customer retention, revenue performance, purchasing behavior, product performance, and operational efficiency in an e-commerce business.

The project combines **PostgreSQL, SQL analytics, Power BI, and DAX** to transform raw transactional data into actionable business insights.

The analysis covers **January 2023 to December 2025** and evaluates:

- Revenue and order growth
- Customer acquisition and retention
- New vs. returning customer behavior
- Customer purchasing frequency
- RFM-based customer segmentation
- Customer lifetime value
- At-risk customers
- Product category performance
- Return and cancellation behavior
- Return reasons
- Operational performance
- Delivery and return-cycle efficiency

The final Power BI dashboard is designed as a business intelligence solution that allows decision-makers to identify growth opportunities, improve customer retention, reduce revenue leakage, and optimize operational performance.

---

# Business Problem

E-commerce businesses generate large volumes of transactional and customer data, but raw data alone does not provide clear answers to important business questions.

This project addresses questions such as:

- How is revenue growing over time?
- Which customer segments generate the most value?
- How much revenue comes from returning customers?
- What percentage of customers are repeat buyers?
- Which customers are at risk of becoming inactive?
- Which product categories contribute the most revenue?
- Which categories have the highest return rates?
- What are the most common reasons for product returns?
- How significant are cancellations?
- How efficiently are orders being fulfilled?
- Where should the business focus retention and operational improvement efforts?

The objective is to move from **descriptive reporting to actionable business intelligence**.

---

# Project Objectives

The main objectives of this project are to:

1. Analyze overall revenue and order performance.
2. Understand customer acquisition and retention behavior.
3. Identify high-value and at-risk customers.
4. Segment customers using RFM analysis.
5. Evaluate category-level revenue and customer performance.
6. Identify return and cancellation patterns.
7. Understand operational inefficiencies.
8. Build an executive-level Power BI dashboard.
9. Translate analytical findings into practical business recommendations.

---

# Dataset

### Analysis Period

**January 2023 – December 2025**

The dataset contains e-commerce transactional and customer information used to analyze:

- Customers
- Orders
- Products/categories
- Revenue
- Order status
- Payment methods
- Returns
- Return reasons
- Customer purchasing behavior

The analysis was performed using PostgreSQL before being modeled and visualized in Power BI.

---

# Key Business KPIs

| KPI | Value |
|---|---:|
| Delivered Revenue | ₹1.45B |
| Delivered Orders | 63.4K |
| Delivered Customers | 11.0K |
| Average Order Value | ₹22.91K |
| Repeat Customer Rate | 88.03% |
| At-Risk Customers | 1,694 |
| Average Customer Lifetime Value | ₹132.57K |
| Purchase Frequency | 5.79 |
| Return Rate | 9.98% |
| Cancellation Rate | 6.04% |
| Average Return Cycle | 11 Days |
| Top Revenue Category | Electronics |

> KPI values represent the final analytical results used in the Power BI dashboard.

---

# Dashboard Overview

The final Power BI dashboard contains three analytical pages.

## 1. Executive Overview

Provides a high-level view of the overall business performance.

### Key areas covered:

- Delivered Revenue
- Delivered Orders
- Delivered Customers
- Average Order Value
- Repeat Customer Rate
- Revenue trends
- Order trends
- Customer growth
- New vs. returning customers
- Revenue performance over time

### Business purpose

This page enables executives and decision-makers to quickly understand the company's overall growth, revenue performance, and customer retention position.

---

## 2. Customer Intelligence

Focuses on customer behavior, retention, value, and segmentation.

### Key areas covered:

- Customer growth
- Repeat customer behavior
- New vs. returning customers
- Customer retention
- Customer lifetime value
- Purchase frequency
- RFM segmentation
- At-risk customers
- Customer-level purchasing behavior

### RFM Segmentation

Customers were analyzed using:

- **Recency** – How recently a customer purchased
- **Frequency** – How often a customer purchased
- **Monetary** – How much revenue a customer generated

Key customer segments include:

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Lost Customers
- Other

### Business purpose

The objective is to identify valuable customers, strengthen retention strategies, and prioritize customers who may be at risk of becoming inactive.

---

## 3. Product & Operations Intelligence

Focuses on category performance and operational efficiency.

### Key areas covered:

- Revenue by category
- Orders by category
- Customers by category
- Average order value by category
- Return rate by category
- Return reasons
- Cancellation behavior
- Delivery performance
- Return-cycle efficiency

### Business purpose

This page helps identify high-performing categories, product-level issues, and operational problems that may affect revenue and customer experience.

---

# Key Business Insights

## 1. Strong Revenue Growth

Revenue increased substantially during the analysis period.

- **2023 Revenue:** ₹108.17M
- **2024 Revenue:** ₹412.73M
- **2025 Revenue:** ₹932.71M

This indicates significant business expansion across the three-year period.

At the same time, Average Order Value remained relatively stable at approximately **₹23K**, suggesting that revenue growth was driven primarily by increasing order volume rather than a major increase in average transaction size.

---

## 2. Returning Customers Drive the Majority of Revenue

Returning customers generated approximately **82.63% of delivered revenue**.

This highlights the importance of customer retention as a major revenue driver.

### Business implication

The business should continue investing in:

- Loyalty programs
- Personalized offers
- Repeat-purchase campaigns
- Customer engagement
- Re-engagement strategies

---

## 3. High Repeat Customer Rate

The project identifies a **Repeat Customer Rate of approximately 88.03%**.

This indicates strong repeat-purchase behavior among customers who have transacted with the business.

However, retention should not be viewed only as a historical success metric.

The business should also identify customers whose purchasing behavior is declining.

---

## 4. At-Risk Customers Represent a Retention Opportunity

The analysis identifies approximately **1,694 at-risk customers**.

These customers represent a potential revenue opportunity because targeted retention campaigns may reactivate customers before they become permanently inactive.

### Recommended actions

- Personalized offers
- Re-engagement campaigns
- Loyalty incentives
- Category-specific recommendations
- Limited-time discounts
- Personalized communication based on previous purchases

---

## 5. Electronics Is the Largest Revenue Contributor

Electronics generated approximately:

**₹968.9M in revenue**

making it the strongest-performing category in the dataset.

This category contributes a significant share of overall delivered revenue.

### Business implication

The business should:

- Protect availability of high-performing electronics products
- Monitor customer satisfaction
- Track returns closely
- Maintain strong fulfillment performance
- Identify high-value electronics customers for retention campaigns

---

## 6. Fashion Has the Highest Return Rate

Fashion recorded the highest category-level return rate at approximately **12.73%**.

This indicates a potential product-experience or expectation gap.

Possible contributing factors may include:

- Size/fit problems
- Product description differences
- Customer expectations
- Product quality
- Incorrect product selection

### Recommended actions

The business could improve:

- Size guides
- Product measurements
- Product descriptions
- Images
- Customer reviews
- Fit recommendations

---

# Return Analysis

The project analyzed the major reasons behind returned orders.

| Return Reason | Returned Orders |
|---|---:|
| Size/Fit Issue | 1,569 |
| Changed Mind | 1,267 |
| Quality Issue | 1,260 |
| Wrong Item | 1,150 |
| Product Damaged | 1,090 |
| Late Delivery | 698 |

### Key observation

**Size/Fit Issue** is the most common return reason.

This makes product sizing and fit information an important area for operational improvement, particularly for categories such as Fashion.

---

# Customer Analytics & RFM

Customer-level analysis was performed to understand purchasing behavior beyond basic order counts.

The analysis includes:

### Recency

Measures how recently a customer made a purchase.

Customers with long periods since their last purchase can indicate potential churn risk.

### Frequency

Measures how often customers purchase.

Higher-frequency customers generally demonstrate stronger engagement with the business.

### Monetary

Measures how much revenue a customer has generated.

This helps identify high-value customers.

### RFM Segmentation

Combining Recency, Frequency, and Monetary behavior allows customers to be grouped into actionable segments.

This provides a stronger foundation for targeted customer strategies than treating all customers equally.

---

# Analytical Approach

The project followed a structured data analytics workflow.

## Step 1 — Data Preparation

Raw customer and transaction data was imported into PostgreSQL.

Data quality checks were performed to identify:

- Missing values
- Duplicate records
- Invalid values
- Inconsistent statuses
- Data inconsistencies
- Transaction-level anomalies

---

## Step 2 — Data Quality Validation

The dataset was validated before analytical queries were developed.

Examples include:

- Duplicate customer checks
- Order status validation
- Payment method analysis
- Revenue consistency checks
- Transaction-level calculations
- Order and customer validation

---

## Step 3 — Exploratory SQL Analysis

SQL was used to analyze:

- Monthly revenue
- Yearly revenue
- Order trends
- Customer growth
- Category performance
- Customer behavior
- New vs. returning customers
- Return behavior
- Cancellation behavior

---

## Step 4 — Customer Segmentation

Customer-level metrics were calculated to support:

- Repeat customer analysis
- Purchase frequency
- Customer lifetime value
- RFM segmentation
- At-risk customer identification

---

## Step 5 — Power BI Data Modeling

The cleaned analytical data was brought into Power BI.

DAX measures and calculated logic were created for key business metrics such as:

- Revenue
- Orders
- Customers
- Average Order Value
- Repeat Customer %
- Return Rate
- Cancellation Rate
- Customer Lifetime Value
- Purchase Frequency
- Average Return Cycle

---

## Step 6 — Dashboard Development

The final dashboard was structured around three business perspectives:

**Executive → Customer → Product & Operations**

This structure allows users to move from high-level business performance into deeper customer and operational analysis.

---

## Step 7 — Business Recommendations

The final stage translates analytical findings into actionable recommendations for:

- Customer retention
- Customer reactivation
- Category optimization
- Return reduction
- Operational improvement
- Revenue protection

---

# Important Metric Definitions

## Delivered Revenue

Revenue generated from orders with:

**Order Status = Delivered**

---

## Delivered Orders

Count of orders where:

**Order Status = Delivered**

---

## Delivered Customers

Unique customers associated with delivered orders.

---

## Average Order Value

Calculated as:

**Delivered Revenue ÷ Delivered Orders**

---

## Repeat Customer Rate

Percentage of customers who made more than one purchase.

A customer is considered a repeat customer when their purchase frequency is greater than one.

---

## At-Risk Customers

Customers classified into the **At Risk** segment through customer-level behavioral/RFM analysis.

---

## Customer Lifetime Value

Represents the historical value generated by customers based on their purchasing behavior during the analyzed period.

---

## Purchase Frequency

Average number of purchases made by customers during the analyzed period.

---

## Return Rate

Return rate is calculated using return-eligible completed transactions, excluding cancelled orders from the return base.

This prevents cancelled orders from being incorrectly treated as orders that could have been returned.

---

## Cancellation Rate

Percentage of total orders that were cancelled.

**Cancelled Orders ÷ Total Orders**

---

## Average Return Cycle

Average number of days associated with the return cycle for returned orders.

---

# Technology Stack

### Database & SQL

- PostgreSQL
- pgAdmin
- SQL
- CTEs
- Window Functions
- Aggregations
- Joins
- Subqueries
- Date & Time Functions

### Business Intelligence

- Microsoft Power BI
- DAX
- Power BI Data Modeling
- Interactive Dashboard Design

### Analytical Techniques

- Customer Segmentation
- RFM Analysis
- Retention Analysis
- Cohort/Customer Trend Analysis
- Revenue Analysis
- Return Analysis
- Operational Analysis

---

# SQL Skills Demonstrated

The project demonstrates practical SQL skills including:

- SELECT statements
- Filtering
- GROUP BY
- HAVING
- CASE statements
- Aggregate functions
- INNER JOIN
- LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- DENSE_RANK
- ROW_NUMBER
- Date calculations
- DATE_TRUNC
- Customer-level aggregation
- Conditional aggregation
- Revenue calculations
- Data quality validation

---

# DAX Skills Demonstrated

The Power BI solution demonstrates:

- CALCULATE
- FILTER
- DIVIDE
- COUNTROWS
- DISTINCTCOUNT
- SUM
- AVERAGE
- Variables
- Conditional logic
- Customer-level calculations
- KPI measures
- Time-based analysis
- Business metric creation

---

# Business Recommendations

Based on the analysis, the following actions are recommended.

## 1. Strengthen Customer Retention

Since returning customers contribute the majority of delivered revenue, the business should prioritize customer retention through:

- Loyalty programs
- Personalized recommendations
- Repeat-purchase incentives
- Customer engagement campaigns

---

## 2. Target At-Risk Customers

The **1,694 at-risk customers** should be prioritized for targeted reactivation campaigns.

Potential strategies include:

- Personalized discounts
- Reminder campaigns
- Loyalty rewards
- Product recommendations
- Limited-time offers

---

## 3. Reduce Fashion Returns

Fashion has the highest return rate.

The business should investigate:

- Size/fit issues
- Product descriptions
- Size charts
- Customer reviews
- Product photography

Reducing avoidable returns can improve both customer satisfaction and profitability.

---

## 4. Address Size/Fit Returns

Since **Size/Fit Issue** is the leading return reason, improving sizing information could reduce preventable returns.

Possible improvements include:

- Detailed measurement charts
- Fit recommendations
- Customer feedback
- Standardized sizing information

---

## 5. Protect Electronics Revenue

Electronics is the strongest revenue-generating category.

The business should closely monitor:

- Inventory availability
- Product quality
- Returns
- Customer satisfaction
- Delivery performance

Because of its large revenue contribution, operational issues in this category could have a significant financial impact.

---

## 6. Monitor Operational Performance

Return cycle and cancellation behavior should be monitored regularly to identify potential operational bottlenecks.

Improving fulfillment and delivery performance can contribute to:

- Better customer experience
- Lower returns
- Lower cancellations
- Higher retention

---

# Repository Structure

```text
ecommerce-customer-retention-revenue-intelligence/
│
├── README.md
│
├── sql/
│   ├── 01_data_quality.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_rfm_analysis.sql
│   └── 05_operations_analysis.sql
│
├── powerbi/
│   └── ecommerce_customer_retention_revenue_intelligence.pbix
│
└── screenshots/
    ├── executive-overview.png
    ├── customer-intelligence.png
    └── product-operations-intelligence.png 
```

Dashboard Design Philosophy
The dashboard was designed around a business-first analytical flow:

Page 1 — Executive Overview

What is happening?
Provides the overall health and growth of the business.

Page 2 — Customer Intelligence

Who is driving the business?
Identifies valuable, loyal, new, and at-risk customers.

Page 3 — Product & Operations Intelligence

Where are the opportunities and operational problems?
Highlights category performance, returns, cancellations, and operational efficiency.

This structure enables stakeholders to move from:

Business Performance → Customer Behavior → Operational Action
Business Impact Perspective
This project is not limited to reporting historical numbers.

The analysis is designed to support business decisions such as:
- Which customers should receive retention campaigns?
- Which customers are at risk of churn?
- Which categories should receive more attention?
- Where are returns creating potential revenue leakage?
- What operational issues may be affecting customer experience?
- Which category contributes the most revenue?
- How can customer lifetime value be improved?
The objective is to demonstrate how a Data Analyst can transform transactional data into business recommendations and measurable decision support.
Skills Demonstrated
This project demonstrates practical experience in:
- Data Cleaning
- Data Validation
- SQL Analytics
- PostgreSQL
- Advanced SQL
- Customer Analytics
- Retention Analysis
- RFM Segmentation
- Revenue Analysis
- Business Intelligence
- Power BI
- DAX
- Data Visualization
- KPI Development
- Dashboard Design
- Business Storytelling
- Insight Generation
- Data-Driven Decision Making
Project Outcome
The final solution transforms raw e-commerce transaction data into a structured analytics platform that provides visibility into:

Revenue → Customers → Retention → Products → Returns → Operations

The project demonstrates an end-to-end analytical workflow:

Raw Data

↓

PostgreSQL Data Validation

↓

SQL Analysis

↓

Customer & RFM Analytics

↓

Power BI Data Modeling

↓

DAX Measures

↓

Interactive Dashboard

↓

Business Insights

↓

Actionable Recommendations
Portfolio Value
This project demonstrates the ability to work across the complete Data Analytics lifecycle rather than focusing only on SQL queries or dashboard creation.

It combines:
- Data preparation
- SQL analysis
- Customer analytics
- Advanced segmentation
- Business intelligence
- Dashboard development
- KPI design
- Business interpretation
- Actionable recommendations
This makes the project relevant to Data Analyst, Business Analyst, BI Analyst, and Analytics roles where technical skills must be combined with business understanding.
Author
Dilshad

Data Analyst Portfolio Project

Project: E-Commerce Customer Retention & Revenue Intelligence
Final Note
This project was built to demonstrate how data can be transformed into meaningful business intelligence using SQL, PostgreSQL, Power BI, and DAX.

The focus is not only on what happened, but also on understanding:

why it happened, who is affected, where the opportunities exist, and what the business can do next.


