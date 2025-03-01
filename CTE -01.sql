-- New SQL CTE Practice Questions with Datasets

-- Question 1: products table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category_id INT,
    stock INT
);

INSERT INTO products (product_id, product_name, category_id, stock) VALUES
(1, 'Laptop', 1, 25),
(2, 'Mouse', 2, 50),
(3, 'Monitor', 1, 10),
(4, 'Keyboard', 2, 30),
(5, 'Printer', 3, 15);

-- Question 1: Write a SQL query using a CTE to find categories with total stock greater than 40.
-- Name the CTE 'high_stock_categories'. Show 'category_id' and total stock as 'total_stock'.
with high_stock_categories AS
(select category_id, sum(stock) as total_stock from products GROUP BY category_id HAVING sum(stock)>40)
select category_id,total_stock from high_stock_categories

-- Question 2: bookings table
CREATE TABLE bookings (
    booking_id INT,
    guest_id INT,
    booking_date DATE,
    room_rate DECIMAL(10,2)
);

INSERT INTO bookings (booking_id, guest_id, booking_date, room_rate) VALUES
(1, 201, '2023-07-01', 100.00),
(2, 202, '2023-07-02', 120.50),
(3, 201, '2023-07-03', 100.00),
(4, 203, '2023-07-04', 150.75),
(5, 202, '2023-07-05', 120.50);

-- Question 2: Write a SQL query using a CTE to calculate the total room_rate per guest_id 
-- where the total exceeds 200. Name the CTE 'big_spenders'. Show 'guest_id' and total as 'total_spent'.
with big_spenders as (
select guest_id , sum(room_rate) as total_spent from bookings group by guest_id HAVING sum(room_rate)> 200
)
select guest_id, total_spent from big_spenders

-- Question 3: tasks table
CREATE TABLE tasks (
    task_id INT,
    employee_id INT,
    task_name VARCHAR(50),
    duration_minutes INT
);

INSERT INTO tasks (task_id, employee_id, task_name, duration_minutes) VALUES
(1, 301, 'Report', 60),
(2, 302, 'Meeting', 45),
(3, 301, 'Coding', 120),
(4, 303, 'Review', 30),
(5, 302, 'Testing', 90);

-- Question 3: Write a SQL query using a CTE to find employees with total task duration 
-- greater than 100 minutes. Name the CTE 'busy_employees'. Show 'employee_id' and total as 'total_duration'.
WITH busy_employees AS (
    SELECT employee_id, SUM(duration_minutes) AS total_duration
    FROM tasks
    GROUP BY employee_id
    HAVING SUM(duration_minutes) > 100
)
SELECT employee_id, total_duration
FROM busy_employees;

-- Question 4: shipments table
CREATE TABLE shipments (
    shipment_id INT,
    warehouse_id INT,
    shipment_date DATE,
    weight_kg DECIMAL(10,2)
);

INSERT INTO shipments (shipment_id, warehouse_id, shipment_date, weight_kg) VALUES
(1, 401, '2023-08-01', 50.25),
(2, 402, '2023-08-02', 30.50),
(3, 401, '2023-08-03', 20.75),
(4, 403, '2023-08-04', 80.00),
(5, 402, '2023-08-05', 60.50);

-- Question 4: Write a SQL query using a CTE to identify warehouses with total shipment weight 
-- over 70 kg. Name the CTE 'heavy_warehouses'. Show 'warehouse_id' and total as 'total_weight'.
with heavy_warehouses as
(select warehouse_id, sum(weight_kg) as total_weight from shipments group by warehouse_id HAVING sum(weight_kg)>70)
select warehouse_id, total_weight from heavy_warehouses;
-- Question 5: courses table
CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(50),
    instructor_id INT,
    enrollment INT
);

INSERT INTO courses (course_id, course_name, instructor_id, enrollment) VALUES
(1, 'Math', 501, 30),
(2, 'Physics', 502, 25),
(3, 'Chemistry', 501, 15),
(4, 'Biology', 503, 40),
(5, 'History', 502, 20);

-- Question 5: Write a SQL query using a CTE to find instructors with total enrollment 
-- greater than 50. Name the CTE 'popular_instructors'. Show 'instructor_id' and total as 'total_enrollment'.
WITH popular_instructors as
(select instructor_id, sum(enrollment) as total_enrollment from courses group by instructor_id HAVING sum(enrollment) > 50)
select instructor_id, total_enrollment from popular_instructors;
-- End of script