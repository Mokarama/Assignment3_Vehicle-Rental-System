create database vehicle_rental_system;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL
        CHECK (role IN ('Admin', 'Customer'))
);

CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL
        CHECK (type IN ('car', 'bike', 'truck')),
    model VARCHAR(100),
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20) NOT NULL
        CHECK (availability_status IN ('available', 'rented', 'maintenance'))
);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20) NOT NULL
        CHECK (booking_status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    total_cost DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
        ON DELETE CASCADE
);


INSERT INTO users (name, email, password, phone, role) VALUES
('Rahim', 'rahim@gmail.com', 'pass123', '01711111111', 'Customer'),
('Karim', 'karim@gmail.com', 'pass123', '01822222222', 'Customer'),
('Admin User', 'admin@gmail.com', 'admin123', '01933333333', 'Admin');


INSERT INTO vehicles (name, type, model, registration_number, price_per_day, availability_status) VALUES
('Toyota Corolla', 'car', '2022', 'DHA-1234', 3000, 'available'),
('Honda Bike', 'bike', '2021', 'DHA-5678', 1000, 'available'),
('Tata Truck', 'truck', '2020', 'DHA-9999', 5000, 'maintenance');


INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, booking_status, total_cost) VALUES
(1, 1, '2025-01-01', '2025-01-03', 'completed', 6000),
(1, 1, '2025-02-01', '2025-02-04', 'completed', 9000),
(2, 1, '2025-03-01', '2025-03-02', 'confirmed', 3000),
(2, 2, '2025-03-05', '2025-03-06', 'pending', 1000);



-- Query 1: INNER JOIN

SELECT
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status
    -- b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id
ORDER BY b.booking_id;

-- Query 2: NOT EXISTS

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: WHERE

SELECT *
FROM vehicles
WHERE availability_status = 'available' AND type = 'car';

-- Query 4: GROUP BY + HAVING

SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;