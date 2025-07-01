# 📊 Task 6: Sales Trend Analysis Using Aggregations

## 🔍 Objective
Analyze **monthly revenue** and **order volume** from a sales dataset using SQL aggregation techniques.

---

## 🛠️ Tools Used
- MySQL 

---

## 🧾 Dataset Info
- **Table name:** `sales`
- **Schema name:** `offer`
- **Columns:**
  - `order_id` (TEXT)
  - `order_date` (DATETIME)
  - `amount` (DOUBLE)
  - `product_id` (INT)

---

## 🚀 Deliverables
- SQL Script with all analysis queries
- Screenshot or result table with query outputs

---

## 📌 Hints / Mini Guide
- Use `EXTRACT(MONTH FROM order_date)` to get the month
- Use `GROUP BY` to analyze per month or year
- Use `SUM(amount)` to calculate revenue
- Use `COUNT(DISTINCT order_id)` to calculate order volume
- Use `ORDER BY` to sort by month or year
- Use `LIMIT` to restrict results if needed

---

## 📂 Sample Queries

```sql
-- Use correct database
USE offer;

-- Total Revenue
SELECT SUM(amount) AS total_revenue FROM sales;

-- Total Number of Orders
SELECT COUNT(order_id) AS total_orders FROM sales;

-- Monthly Revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- Monthly Order Count
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- Revenue by Product
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM sales
GROUP BY product_id
ORDER BY total_revenue DESC;

-- Orders by Product
SELECT 
    product_id,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY product_id
ORDER BY total_orders DESC;
```

---

## 📈 Insights Expected
- Identify top-selling months and trends
- Detect peak revenue periods
- Analyze product-wise sales performance

---

## 🎯 Outcome
Learn to:
- Group data by time
- Use aggregation functions like `SUM`, `COUNT`
- Analyze and visualize revenue/order trends over time

