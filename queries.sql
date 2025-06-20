-- ============================================
-- MOTOR COMPANY DATABASE - COMPLETE SQL QUERIES
-- ============================================

-- 1. SELECT ALL RECORDS FROM EACH TABLE
-- ============================================
USE motorcompany;

-- View all Make records
SELECT * FROM Make_table;

-- View all Model records
SELECT * FROM model;

-- View all Personal Information records
SELECT * FROM personal_information;

-- View all Login User records
SELECT * FROM login_user;

-- View all Broker records
SELECT * FROM broker;

-- ============================================
-- 2. BASIC SELECT QUERIES WITH WHERE CLAUSE
-- ============================================

-- Active makes only
SELECT make_id, make_desc, added_on 
FROM Make_table 
WHERE make_status = 'Active';

-- Users from specific cities
SELECT user_id, last_name, city, email 
FROM personal_information 
WHERE city IN ('Chennai', 'Madurai', 'Salem');

-- Brokers with active status
SELECT broker_id, broker_name, broker_org_name 
FROM broker 
WHERE b_status = 'Active';

-- Users born after 1995
SELECT user_id, last_name, dob, city 
FROM personal_information 
WHERE dob > '1995-01-01';

-- Female users who are married
SELECT user_id, last_name, gender, marital_status, city 
FROM personal_information 
WHERE gender = 'F' AND marital_status = 'Married';

-- ============================================
-- 3. AGGREGATE FUNCTIONS
-- ============================================

-- Count total users by type
SELECT user_type, COUNT(*) AS total_users 
FROM personal_information 
GROUP BY user_type;

-- Count active vs inactive makes
SELECT make_status, COUNT(*) AS status_count 
FROM Make_table 
GROUP BY make_status;

-- Average education level by gender
SELECT gender, AVG(education) AS avg_education 
FROM personal_information 
GROUP BY gender;

-- Count users by city (top 5)
SELECT city, COUNT(*) AS user_count 
FROM personal_information 
GROUP BY city 
ORDER BY user_count DESC 
LIMIT 5;

-- Count users by marital status and gender
SELECT marital_status, gender, COUNT(*) AS count 
FROM personal_information 
GROUP BY marital_status, gender 
ORDER BY marital_status, gender;

-- ============================================
-- 4. JOINS - INNER, LEFT, RIGHT
-- ============================================

-- Inner Join: Personal Info with Login Details
SELECT p.user_id, p.last_name, p.email, p.user_type, 
       l.login_id, l.lead_id, l.l_status
FROM personal_information p
INNER JOIN login_user l ON p.user_id = l.l_user_id;

-- Left Join: All Personal Info with Login (including those without login)
SELECT p.user_id, p.last_name, p.email, p.user_type,
       l.login_id, l.l_status
FROM personal_information p
LEFT JOIN login_user l ON p.user_id = l.l_user_id;

-- Join Personal Info with Broker Details
SELECT p.user_id, p.last_name, p.city, p.email,
       b.broker_name, b.broker_org_name, b.b_status
FROM personal_information p
INNER JOIN broker b ON p.user_id = b.broker_id
WHERE p.user_type = 'broker';

-- Complex Join: Personal Info, Login, and Broker
SELECT p.user_id, p.last_name, p.city, p.user_type,
       l.login_id, l.l_status AS login_status,
       b.broker_name, b.broker_org_name
FROM personal_information p
LEFT JOIN login_user l ON p.user_id = l.l_user_id
LEFT JOIN broker b ON p.user_id = b.broker_id
WHERE p.user_type = 'broker';

-- ============================================
-- 5. SUBQUERIES
-- ============================================

-- Users with education higher than average
SELECT user_id, last_name, education, city
FROM personal_information
WHERE education > (SELECT AVG(education) FROM personal_information);

-- Cities with more than 2 users
SELECT city, COUNT(*) AS user_count
FROM personal_information
WHERE city IN (
    SELECT city 
    FROM personal_information 
    GROUP BY city 
    HAVING COUNT(*) > 2
)
GROUP BY city;

-- Brokers from cities with active users
SELECT b.broker_id, b.broker_name, p.city
FROM broker b
INNER JOIN personal_information p ON b.broker_id = p.user_id
WHERE p.city IN (
    SELECT DISTINCT city
    FROM personal_information
    WHERE p_status = 'Active'
);

-- Latest added users per city
SELECT p1.user_id, p1.last_name, p1.city, p1.added_on
FROM personal_information p1
WHERE p1.added_on = (
    SELECT MAX(p2.added_on)
    FROM personal_information p2
    WHERE p2.city = p1.city
);





-- ============================================
-- MOTOR COMPANY SQL - PROCEDURES, FUNCTIONS, TRIGGERS
-- ============================================

USE motorcompany;

-- =====================
--  STORED PROCEDURES
-- =====================

DELIMITER $$
CREATE PROCEDURE GetActiveUsersByCity(IN city_name VARCHAR(50))
BEGIN
    SELECT user_id, last_name, city, p_status 
    FROM personal_information 
    WHERE city = city_name AND p_status = 'Active';
END $$
DELIMITER ;

CALL GetActiveUsersByCity('Chennai');

DELIMITER $$
CREATE PROCEDURE CountBrokersByStatus()
BEGIN
    SELECT b_status, COUNT(*) AS total_brokers
    FROM broker
    GROUP BY b_status;
END $$
DELIMITER ;

CALL CountBrokersByStatus();

DELIMITER $$
CREATE PROCEDURE LatestUserPerCity()
BEGIN
    SELECT p1.user_id, p1.last_name, p1.city, p1.added_on
    FROM personal_information p1
    WHERE p1.added_on = (
        SELECT MAX(p2.added_on)
        FROM personal_information p2
        WHERE p2.city = p1.city
    );
END $$
DELIMITER ;

CALL LatestUserPerCity();

DELIMITER $$
CREATE PROCEDURE BrokersFromActiveCities()
BEGIN
    SELECT b.broker_id, b.broker_name, p.city
    FROM broker b
    INNER JOIN personal_information p ON b.broker_id = p.user_id
    WHERE p.city IN (
        SELECT DISTINCT city FROM personal_information WHERE p_status = 'Active'
    );
END $$
DELIMITER ;

CALL BrokersFromActiveCities();

-- =================
--  SQL FUNCTIONS
-- =================

DELIMITER $$
CREATE FUNCTION MakeDescriptionLength(m_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE len INT;
    SELECT CHAR_LENGTH(make_desc) INTO len FROM Make_table WHERE make_id = m_id;
    RETURN len;
END $$
DELIMITER ;

SELECT MakeDescriptionLength(10);

DELIMITER $$
CREATE FUNCTION IsAdult(dob DATE) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = YEAR(NOW()) - YEAR(dob);
    RETURN IF(age >= 18, 'Yes', 'No');
END $$
DELIMITER ;

SELECT IsAdult('2022-12-14');



DELIMITER $$
CREATE FUNCTION UserExperienceLevel(join_date DATE) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE yrs INT;
    SET yrs = YEAR(NOW()) - YEAR(join_date);
    RETURN IF(yrs >= 5, 'Expert', IF(yrs >= 2, 'Intermediate', 'Newbie'));
END $$
DELIMITER ;

SELECT UserExperienceLevel('2030-04-10');



-- =================
-- SQL TRIGGERS ONLY
-- =================
DELIMITER $$

CREATE TRIGGER set_default_user_type_customer
BEFORE INSERT ON personal_information
FOR EACH ROW
BEGIN
    IF NEW.user_type IS NULL THEN
        SET NEW.user_type = 'Customer';
    END IF;
END$$

DELIMITER ;

INSERT INTO personal_information (user_id, last_name, dob, city)
VALUES (31, 'TestUser1', '2000-01-01', 'Coimbatore');



SELECT user_id, last_name, user_type
FROM personal_information
WHERE user_id = 31;

select * from personal_information;

DELIMITER $$

CREATE TRIGGER log_model_inserts
AFTER INSERT ON model
FOR EACH ROW
BEGIN
    INSERT INTO model_audit (model_id, model_desc, logged_on)
    VALUES (NEW.model_id, NEW.model_desc, NOW());
END$$

DELIMITER ;

INSERT INTO model (model_id, model_desc, price)
VALUES (31, 'TestModelX',  5, 2500000.00);

SELECT * FROM model_audit
WHERE model_id = 31;

DELIMITER $$

CREATE TRIGGER block_active_broker_deletion
BEFORE DELETE ON broker
FOR EACH ROW
BEGIN
    IF OLD.b_status = 'Active' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a broker with Active status';
    END IF;
END$$

DELIMITER ;

SELECT broker_id, b_status FROM broker WHERE broker_id = 10;

set sql_safe_updates=1;
DELETE FROM broker WHERE broker_id = 10;

DELETE FROM broker WHERE broker_id = 12;

SELECT * FROM broker WHERE broker_id = 12;

DELIMITER $$

CREATE TRIGGER sync_login_status_on_personal_update
AFTER UPDATE ON personal_information
FOR EACH ROW
BEGIN
    UPDATE login_user
    SET l_status = 'Updated'
    WHERE l_user_id = NEW.user_id;
END$$

DELIMITER ;

SELECT l_user_id, l_status FROM login_user WHERE l_user_id = 5;

UPDATE personal_information
SET city = 'Erode'
WHERE user_id = 5;

SELECT l_user_id, l_status FROM login_user WHERE l_user_id = 5;


desc  broker;










DELIMITER $$

CREATE TRIGGER set_default_city
BEFORE INSERT ON personal_information
FOR EACH ROW
BEGIN
    IF NEW.city IS NULL THEN
        SET NEW.city = 'Chennai';
    END IF;
END$$

DELIMITER ;

-- Test this trigger:
INSERT INTO personal_information (user_id, user_type, last_name, gender, dob, email, marital_status, education, phone, addr_1, state, country, national_id, nationality, p_status, added_on, added_by)
VALUES (32, 'user', 'Tester', 'M', '1995-01-01', 'tester@example.com', 'Single', 14, '9876543099', 'Default Rd', 'Tamil Nadu', 'Indian', 2000, 91, 'Active', '2025-07-02', 'Admin32');

-- Check if city is set to 'Chennai'
SELECT user_id, last_name, city FROM personal_information WHERE user_id = 32;













-- First create the log table:
CREATE TABLE deleted_brokers (
    broker_id INT,
    broker_name VARCHAR(50),
    deleted_on DATETIME
);

DELIMITER $$

CREATE TRIGGER log_deleted_broker
BEFORE DELETE ON broker
FOR EACH ROW
BEGIN
    INSERT INTO deleted_brokers (broker_id, broker_name, deleted_on)
    VALUES (OLD.broker_id, OLD.broker_name, NOW());
END$$

DELIMITER ;

-- Test this trigger:
DELETE FROM broker WHERE broker_id = 15;

-- Check the log
SELECT * FROM deleted_brokers WHERE broker_id = 15;















DELIMITER $$

CREATE TRIGGER set_login_status_default
BEFORE INSERT ON login_user
FOR EACH ROW
BEGIN
   IF NEW.l_status IS NULL OR NEW.l_status = 'inactive' then
        SET NEW.l_status = 'Pending';
    END IF;
END$$

DELIMITER ;
select *  from  login_user;
-- Test this trigger:
INSERT INTO login_user (login_id, u_password, l_user_id, lead_id, l_user_type, l_added_on, l_added_by)
VALUES (31, 'testpass', 31, 131, 'broker', '2025-07-02', 'Admin31');

-- Check login status
SELECT login_id, l_user_id, l_status FROM login_user ;


