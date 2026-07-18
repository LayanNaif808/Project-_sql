# 🛒 Small Store Database System

A comprehensive, relational database system designed for a retail storefront using SQLite. This project includes a normalized database schema, custom analytics queries, and a complete Entity-Relationship Diagram (ERD).

---

## 🗺️ Entity-Relationship Diagram (ERD)

Here is the structural blueprint of the database mapping relationships, Primary Keys (PK), and Foreign Keys (FK):

![Entity Relationship Diagram](<img width="591" height="799" alt="1000043386" src="https://github.com/user-attachments/assets/484a34df-45a0-4ce2-ae07-1c7e72fc06f6" />
)

---

## 📊 Database Queries & Output Results

Below are the key analytical queries executed on the store's data along with their verified outputs:<img width="1280" height="960" alt="1000043385" src="https://github.com/user-attachments/assets/395ae631-0cd8-49de-95a5-df55031c45c2" />


### 1. Total Revenue Per City
This query calculates the financial performance of the store across different geographic regions.

```sql
SELECT c.city, SUM(o.total_amount) AS 'Total Revenue Per City'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.city;
