/*sql/01_create_tables.sql*/

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    gender VARCHAR(20),
    age INTEGER,
    city VARCHAR(100),
    state VARCHAR(100),
    signup_date DATE
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    base_price NUMERIC(12,2),
    cost NUMERIC(12,2)
);

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    product_id INTEGER,
    quantity INTEGER,
    unit_price NUMERIC(12,2),
    discount_pct NUMERIC(5,3),
    discount_amount NUMERIC(12,2),
    order_value NUMERIC(12,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(30)
);

CREATE TABLE returns (
    order_id BIGINT PRIMARY KEY,
    purchase_date DATE,
    return_date DATE,
    return_reason VARCHAR(100),
    refund_amount NUMERIC(12,2)
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

/* To Check Duplicate Customers:*/

SELECT customer_id,COUNT(*)AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) >1;

/* To Check Duplicate Orders:*/

SELECT order_id,COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

/* To Check Missing Important Order Data:*/

SELECT
    COUNT(*) AS total_orders,
    COUNT(customer_id) AS customer_id_present,
    COUNT(product_id) AS product_id_present,
    COUNT(order_date) AS order_date_present,
    COUNT(order_value) AS order_value_present
FROM orders;

/* To Check Invalid Customer Ages:*/
 
SELECT *
FROM customers
WHERE age < 18 OR age > 100;

/* To Check Negative Financial Values:*/

SELECT *
FROM orders
WHERE unit_price < 0
   OR order_value < 0
   OR discount_amount < 0;
   
/* To Check Order Status Distribution:*/

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

/* To Check Order Value:*/

SELECT order_id,quantity,unit_price,discount_amount,order_value, 
    ROUND(
        (quantity * unit_price - discount_amount)::numeric,
        2
    ) AS calculated_order_value
FROM orders
WHERE ABS(
    order_value -
    (quantity * unit_price - discount_amount)
) > 0.01
LIMIT 20;

/***ANALYSIS***/

/*1. Overall Business Performance

How many orders, customers, revenue, and average order value does the business have?*/

SELECT COUNT(*)AS total_orders,
       COUNT(DISTINCT customer_id)AS total_customers,
	   ROUND(SUM(order_value),2) AS total_revenue,
	   ROUND(AVG(order_value),2) AS average_order_revenue
FROM orders
WHERE order_status = 'Delivered';


/*2.Monthly Revenue Trend

Is the business growing, declining, or fluctuating over time?*/

SELECT DATE_TRUNC('month',order_date)::date AS month,
       COUNT(*) AS delivered_orders,
	   ROUND(sum(order_value),2) AS revenue
FROM orders
WHERE order_status ='Delivered'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

/*3 — Year-over-Year Performance

"Are we reaching a growth plateau?"
Before we investigate customers and products, let's summarize the business year by year.*/

SELECT EXTRACT (YEAR FROM order_date) AS year,
       COUNT(*) AS delivered_orders,
	   COUNT(DISTINCT customer_id) AS customers,
	   ROUND(SUM(order_value),2) AS revenue,
       ROUND(AVG(order_value),2) AS average_order_value
FROM orders
WHERE order_status = 'Delivered'
GROUP BY EXTRACT (YEAR FROM order_date)
ORDER BY year;

/* 4 — Category Performance

Now we're going to answer a business question:
Which product categories are generating the most revenue, 
and how many orders/customers are contributing to that revenue?*/

SELECT
    p.category,
    COUNT(*) AS delivered_orders,
    COUNT(DISTINCT o.customer_id) AS customers,
    ROUND(SUM(o.order_value), 2) AS revenue,
    ROUND(AVG(o.order_value), 2) AS average_order_value
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

/*5.Top Products

Now we'll go one level deeper:
Which individual products generate the most revenue?*/

SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(*) AS delivered_orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(o.order_value), 2) AS revenue,
    ROUND(AVG(o.order_value), 2) AS average_order_value
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC
LIMIT 10;

/*6 — Order Status & Business Impact

Now we're going to answer:
How many orders are Delivered, Returned, and Cancelled, and what is the value associated with each status?*/

SELECT
    order_status,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(order_value), 2) AS order_value,
    ROUND(AVG(order_value), 2) AS average_order_value
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

/*7 — Return & Refund Analysis

We'll use the returns table and answer:
Why are customers returning products, and how much money is being refunded?*/

SELECT
    return_reason,
    COUNT(*) AS returned_orders,
    ROUND(SUM(refund_amount), 2) AS total_refund,
    ROUND(AVG(refund_amount), 2) AS average_refund
FROM returns
GROUP BY return_reason
ORDER BY returned_orders DESC;

/*8 — Which categories have the most returns?*/

SELECT
    p.category,
    COUNT(*) AS returned_orders,
    ROUND(SUM(r.refund_amount), 2) AS total_refund,
    ROUND(AVG(r.refund_amount), 2) AS average_refund
FROM returns r
JOIN orders o
    ON r.order_id = o.order_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_refund DESC;


/*9 — Return Reasons by Category*/

SELECT
    p.category,
    r.return_reason,
    COUNT(*) AS returned_orders,
    ROUND(SUM(r.refund_amount), 2) AS total_refund
FROM returns r
JOIN orders o
    ON r.order_id = o.order_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.category,
    r.return_reason
ORDER BY
    p.category,
    total_refund DESC;

/*10.Return Rate by Category*/
	
SELECT
    p.category,
    COUNT(*) AS total_orders,
    COUNT(r.order_id) AS returned_orders,
    ROUND(
        COUNT(r.order_id) * 100.0 / COUNT(*),
        2
    ) AS return_rate_pct
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
LEFT JOIN returns r
    ON o.order_id = r.order_id
WHERE o.order_status IN ('Delivered', 'Returned')
GROUP BY p.category
ORDER BY return_rate_pct DESC;

/*11 - Part A: Customer Purchase Frequency

How many customers are one-time buyers versus repeat buyers?*/

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY total_orders DESC;

/*11 — Part B: One-time vs Repeat Customers*/

SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        WHEN total_orders BETWEEN 2 AND 3 THEN 'Low-repeat'
        ELSE 'Frequent'
    END AS customer_type,
    COUNT(*) AS customers
FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
) customer_orders
GROUP BY
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        WHEN total_orders BETWEEN 2 AND 3 THEN 'Low-repeat'
        ELSE 'Frequent'
    END
ORDER BY customers DESC;

/*12.New vs Returning Customer Revenue

Now we're going to answer a very important business question:
How much revenue comes from new customers versus returning customers?*/

WITH customer_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        order_value,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS purchase_number
    FROM orders
    WHERE order_status = 'Delivered'
)

SELECT
    CASE
        WHEN purchase_number = 1 THEN 'New Customer'
        ELSE 'Returning Customer'
    END AS customer_type,
    COUNT(*) AS orders,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(order_value), 2) AS revenue,
    ROUND(AVG(order_value), 2) AS average_order_value
FROM customer_orders
GROUP BY
    CASE
        WHEN purchase_number = 1 THEN 'New Customer'
        ELSE 'Returning Customer'
    END
ORDER BY revenue DESC;

/*13.Customer Retention

Step 1 — Find each customer's first purchase month*/

SELECT
    customer_id,
    DATE_TRUNC('month', MIN(order_date))::date AS first_purchase_month
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY first_purchase_month, customer_id;

/*Step 2 — Build the actual retention view*/

WITH customer_first_purchase AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(order_date))::date AS first_purchase_month
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),

customer_activity AS (
    SELECT DISTINCT
        customer_id,
        DATE_TRUNC('month', order_date)::date AS purchase_month
    FROM orders
    WHERE order_status = 'Delivered'
)

SELECT
    c.first_purchase_month,
    COUNT(DISTINCT c.customer_id) AS cohort_customers,
    COUNT(DISTINCT CASE
        WHEN a.purchase_month > c.first_purchase_month
        THEN a.customer_id
    END) AS retained_customers,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN a.purchase_month > c.first_purchase_month
            THEN a.customer_id
        END) * 100.0
        / COUNT(DISTINCT c.customer_id),
        2
    ) AS retention_rate_pct
FROM customer_first_purchase c
LEFT JOIN customer_activity a
    ON c.customer_id = a.customer_id
GROUP BY c.first_purchase_month
ORDER BY c.first_purchase_month;

/*13 — Step 1: Calculate RFM metrics*/

SELECT
    customer_id,

    -- Recency: days since last purchase
    DATE '2025-12-31' - MAX(order_date) AS recency_days,

    -- Frequency: number of delivered orders
    COUNT(order_id) AS frequency,

    -- Monetary: total amount spent
    ROUND(SUM(order_value), 2) AS monetary_value

FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY monetary_value DESC;

/*step-2 — Give each customer an R, F, and M score*/

WITH rfm AS (
    SELECT
        customer_id,

        DATE '2025-12-31' - MAX(order_date) AS recency_days,

        COUNT(order_id) AS frequency,

        ROUND(SUM(order_value), 2) AS monetary_value

    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),

rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary_value,

        -- Lower recency is better, so reverse the ranking
        6 - NTILE(5) OVER (
            ORDER BY recency_days
        ) AS recency_score,

        NTILE(5) OVER (
            ORDER BY frequency
        ) AS frequency_score,

        NTILE(5) OVER (
            ORDER BY monetary_value
        ) AS monetary_score

    FROM rfm
)

SELECT *
FROM rfm_scores
ORDER BY monetary_value DESC;

/*Step 3 — Create the RFM segments*/

WITH rfm AS (
    SELECT
        customer_id,
        DATE '2025-12-31' - MAX(order_date) AS recency_days,
        COUNT(order_id) AS frequency,
        ROUND(SUM(order_value), 2) AS monetary_value
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary_value,

        6 - NTILE(5) OVER (
            ORDER BY recency_days
        ) AS recency_score,

        NTILE(5) OVER (
            ORDER BY frequency
        ) AS frequency_score,

        NTILE(5) OVER (
            ORDER BY monetary_value
        ) AS monetary_score

    FROM rfm
)
SELECT
    customer_id,
    recency_days,
    frequency,
    monetary_value,
    recency_score,
    frequency_score,
    monetary_score,

    CASE
        WHEN recency_score >= 4
             AND frequency_score >= 4
             AND monetary_score >= 4
            THEN 'Champions'

        WHEN recency_score >= 3
             AND frequency_score >= 4
            THEN 'Loyal Customers'

        WHEN recency_score >= 4
             AND frequency_score BETWEEN 2 AND 3
            THEN 'Potential Loyalists'

        WHEN recency_score BETWEEN 2 AND 3
             AND frequency_score >= 3
            THEN 'At Risk'

        WHEN recency_score <= 2
             AND frequency_score <= 2
            THEN 'Lost Customers'

        ELSE 'Other'
    END AS customer_segment

FROM rfm_scores
ORDER BY monetary_value DESC;

/*Step 4 — Segment-level summary*/

WITH rfm AS (
    SELECT
        customer_id,
        DATE '2025-12-31' - MAX(order_date) AS recency_days,
        COUNT(order_id) AS frequency,
        ROUND(SUM(order_value), 2) AS monetary_value
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary_value,

        6 - NTILE(5) OVER (
            ORDER BY recency_days
        ) AS recency_score,

        NTILE(5) OVER (
            ORDER BY frequency
        ) AS frequency_score,

        NTILE(5) OVER (
            ORDER BY monetary_value
        ) AS monetary_score

    FROM rfm
),
segmented_customers AS (
    SELECT
        *,
        CASE
            WHEN recency_score >= 4
                 AND frequency_score >= 4
                 AND monetary_score >= 4
                THEN 'Champions'

            WHEN recency_score >= 3
                 AND frequency_score >= 4
                THEN 'Loyal Customers'

            WHEN recency_score >= 4
                 AND frequency_score BETWEEN 2 AND 3
                THEN 'Potential Loyalists'

            WHEN recency_score BETWEEN 2 AND 3
                 AND frequency_score >= 3
                THEN 'At Risk'

            WHEN recency_score <= 2
                 AND frequency_score <= 2
                THEN 'Lost Customers'

            ELSE 'Other'
        END AS customer_segment
    FROM rfm_scores
)
SELECT
    customer_segment,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_share_pct,
    ROUND(SUM(monetary_value), 2) AS total_customer_value,
    ROUND(AVG(monetary_value), 2) AS average_customer_value,
    ROUND(AVG(frequency), 2) AS average_frequency,
    ROUND(AVG(recency_days), 2) AS average_recency_days
FROM segmented_customers
GROUP BY customer_segment
ORDER BY total_customer_value DESC;

/*Step 5 — Customer Lifetime Value*/

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_value), 2) AS lifetime_value,
    ROUND(AVG(order_value), 2) AS average_order_value,
    MAX(order_date) AS last_purchase_date
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY lifetime_value DESC;


/*Customer Value Segmentation*/

SELECT
    CASE
        WHEN lifetime_value >= 500000 THEN 'High Value'
        WHEN lifetime_value >= 200000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value_segment,
    COUNT(*) AS customers,
    ROUND(SUM(lifetime_value), 2) AS total_lifetime_value,
    ROUND(AVG(lifetime_value), 2) AS average_lifetime_value
FROM (
    SELECT
        customer_id,
        SUM(order_value) AS lifetime_value
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
) customer_value
GROUP BY
    CASE
        WHEN lifetime_value >= 500000 THEN 'High Value'
        WHEN lifetime_value >= 200000 THEN 'Medium Value'
        ELSE 'Low Value'
    END
ORDER BY total_lifetime_value DESC;

/*Regional / Geographic Performance*/

SELECT
    c.state,
    COUNT(*) AS delivered_orders,
    COUNT(DISTINCT o.customer_id) AS customers,
    ROUND(SUM(o.order_value), 2) AS revenue,
    ROUND(AVG(o.order_value), 2) AS average_order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.state
ORDER BY revenue DESC;

/*State-level Customer Value*/

SELECT
    c.state,
    COUNT(DISTINCT o.customer_id) AS customers,
    ROUND(SUM(o.order_value), 2) AS revenue,
    ROUND(
        SUM(o.order_value) / COUNT(DISTINCT o.customer_id),
        2
    ) AS revenue_per_customer
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.state
ORDER BY revenue_per_customer DESC;

























