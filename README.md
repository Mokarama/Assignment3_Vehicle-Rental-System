#  Vehicle Rental System – Database Project

##  Project Overview
This project implements a **Vehicle Rental System database** using SQL.  
It focuses on **ERD design, relational integrity, and query writing** based on real-world rental business logic.

---

##  Technologies
- PostgreSQL
- SQL
- Lucidchart (ERD)

---

##  Database Tables
- **users** – stores customer and admin information
- **vehicles** – stores vehicle details and availability
- **bookings** – stores rental booking information

---

##  Relationships
- One user → many bookings  
- Many bookings → one vehicle  
- Each booking connects exactly one user and one vehicle

---

## 📄 `queries.sql` Explanation

In this file, I have written SQL queries to retrieve meaningful information from the Vehicle Rental System database. Each query is designed to solve a specific business requirement using standard SQL concepts.

---

### 🔹 Query 1: INNER JOIN  
**Purpose:**  
To retrieve booking information along with the customer name and vehicle name.

**Explanation:**  
In this query, I used `INNER JOIN` to combine data from the `bookings`, `users`, and `vehicles` tables. This ensures that only records that exist in all three tables are returned. As a result, I can see complete booking details including who made the booking and which vehicle was booked.

**Concepts Used:**  
- INNER JOIN  
- Foreign Key relationships  

---

###  Query 2: NOT EXISTS  
**Purpose:**  
To find all vehicles that have never been booked.

**Explanation:**  
Here, I used the `NOT EXISTS` clause with a subquery to check whether a vehicle has any related records in the `bookings` table. If no matching booking is found, the vehicle is included in the result. This helps identify vehicles that are currently unused.

**Concepts Used:**  
- NOT EXISTS  
- Subquery  

---

###  Query 3: WHERE Clause  
**Purpose:**  
To retrieve all available vehicles of a specific type, such as cars.

**Explanation:**  
In this query, I used the `WHERE` clause to filter vehicles based on their availability status and type. This allows me to display only those vehicles that are available for rent and match the required type.

**Concepts Used:**  
- SELECT  
- WHERE  

---

###  Query 4: GROUP BY and HAVING  
**Purpose:**  
To find vehicles that have been booked more than two times.

**Explanation:**  
In this query, I grouped booking records by vehicle and used the `COUNT()` function to calculate the total number of bookings for each vehicle. I then used the `HAVING` clause to filter the results and display only those vehicles that have more than two bookings. This helps identify high-demand vehicles.

**Used:**  
- GROUP BY  
- HAVING  
- COUNT  



