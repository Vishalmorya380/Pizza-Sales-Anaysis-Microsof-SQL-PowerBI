# 🍕 Pizza Sales Analysis (SQL + Power BI Project)

This repository contains a **Pizza Sales Analysis Project** that combines **SQL Server queries** for data exploration and a **Microsoft Power BI dashboard** for interactive visualization.  

The focus of this project is on **SQL-based data analysis** while leveraging Power BI to present insights with a dynamic dashboard.

![Dashboard Screenshot](Pizza%202.png)

---

## 📌 Project Overview

The project demonstrates how raw transactional pizza sales data can be analyzed using **SQL queries** to answer business questions, and then visualized using a **Power BI dashboard**.  

Key aspects include:
- Writing **SQL queries** to analyze sales, revenue, categories, and customer behavior.
- Creating **views, aggregations, joins, window functions, and CTEs** in SQL.
- Building a **Power BI dashboard** with KPIs, charts, and a **slicer hide/show toggle** for interactivity.

---

## ✅ SQL Analysis

The core of this project is the **SQL analysis**, which answers real business questions such as:

1. Count total unique pizzas available.  
2. Find the top 5 most sold pizzas by quantity.  
3. Get the monthly revenue generated.  
4. Show the average quantity sold per category.  
5. List pizzas sold more than the average quantity.  
6. Get the latest order for each pizza size.  
7. Find pizza categories with more than 100 orders.  
8. Count pizzas sold for each size.  
9. Identify the 3 most profitable pizzas.  
10. Find all orders containing **Mushrooms** as an ingredient.  
11. Use **CTE** to list all large pizzas sold after July 2025.  
12. Get unique pizzas per category.  
13. Find the pizza size with the highest average revenue per order.  
14. Rank pizzas by revenue using **window functions**.  
15. Compare pizzas in the same category using a **self join**.  
16. Create a **summary view** (`vw_pizza_summary`) of key insights.  

📄 Full SQL script: [`Pizza Project.sql`](Pizza%20Project.sql)

---

## 📊 Power BI Dashboard

The **Power BI dashboard** complements SQL analysis with visual insights:

- 📍 **KPI Cards**: Total Sales, Orders, Quantity, Avg Price, Category Count, Size Count  
- 🍕 **Top & Bottom Pizzas**: Best and least-selling products  
- 🥧 **Sales by Category & Size**: Donut charts for contribution analysis  
- 📈 **Monthly Sales Trend**: Revenue trends across months  
- 📆 **Weekday Sales**: Which days perform best  
- 🎛 **Interactive Slicers**:
  - Month  
  - Weekday  
  - Pizza Size  
  - Pizza Category  
  - Order Date  
- ⚙️ **Slicer Hide/Show Toggle** via a settings icon  

---

## 🧠 Insights You Can Derive

- Which pizzas are the **top sellers** and which underperform  
- The **most profitable categories and sizes**  
- Seasonal and **weekly sales patterns**  
- **Customer preferences** by ingredients and pizza type  
- Summary view for **executive decision-making**  

---

## 🛠️ Built With

- **Microsoft SQL Server**  
  - DDL, DML, Joins, Aggregations, CTEs, Window Functions, Self Joins, Views  

- **Microsoft Power BI**  
  - KPI Cards, Bar/Line/Donut Charts  
  - DAX Measures  
  - Interactive Slicers with **Hide/Show Toggle**  

---

