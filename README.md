

## 🚗 MotorCompany Database System – Theory & Overview

### 📌 Objective:

The **MotorCompany database** is designed to efficiently store, manage, and query employee, department, and payroll data for a motor vehicle company. The project simulates a real-world enterprise database that supports HR and administrative operations.

---

### 🏗️ Database Design:

The system includes the following key components:

#### 1. **Employees Table**

Stores employee details such as name, ID, salary, department, and manager relationships.

| Column         | Type     | Description               |
| -------------- | -------- | ------------------------- |
| employee\_id   | INT (PK) | Unique identifier         |
| first\_name    | VARCHAR  | Employee’s first name     |
| last\_name     | VARCHAR  | Employee’s last name      |
| salary         | DECIMAL  | Monthly salary            |
| department\_id | INT (FK) | Links to department       |
| manager\_id    | INT (FK) | Links to another employee |

#### 2. **Departments Table**

Defines all departments within the company.

| Column           | Type     | Description                  |
| ---------------- | -------- | ---------------------------- |
| department\_id   | INT (PK) | Department code              |
| department\_name | VARCHAR  | Name (e.g., Finance, HR, IT) |

---

### ⚙️ Features Implemented

* ✅ Calculate **average salary** of employees
* ✅ Identify employees **earning more than average**
* ✅ Count **employees per department**
* ✅ Use **subqueries**, `GROUP BY`, `HAVING`, `JOIN`, and `EXISTS`
* ✅ Realistic employee-manager hierarchy using self-joins

---

### 📄 Sample SQL Queries

#### 🔍 Query 1: Employees earning more than average

```sql
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

#### 📊 Query 2: Department-wise employee count

```sql
SELECT department_id, COUNT(*) as total_employees
FROM employees
GROUP BY department_id;
```

#### 🔗 Query 3: Employees who are managers

```sql
SELECT employee_id, first_name, last_name
FROM employees e
WHERE EXISTS (
  SELECT 1 FROM employees e2
  WHERE e2.manager_id = e.employee_id
);
```

---

### 💡 Use Cases

* HR reporting and salary analysis
* Department performance metrics
* Organizational hierarchy mapping
* Payroll calculations

---

### 📂 Files Included

* `table.sql` → Table creation & schema definition
* `queries.sql` → All project queries and logic

---


