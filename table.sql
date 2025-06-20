create database  motorcompany ;
use motorcompany; 

CREATE TABLE Make_table(
    make_id INT,
    make_desc VARCHAR(20),
    make_status VARCHAR(20) NOT NULL,
    added_on DATE NOT NULL,
    added_by VARCHAR(20) NOT NULL,
    CONSTRAINT make_id_pk PRIMARY KEY(make_id),
    CONSTRAINT make_desc_ UNIQUE KEY(make_desc),
    CONSTRAINT added_on_ UNIQUE KEY(added_on)
);

INSERT INTO Make_table (make_id, make_desc, make_status, added_on, added_by) VALUES
(1, 'Make A', 'Active', '2025-06-01', 'Admin'),
(2, 'Make B', 'Inactive', '2025-06-02', 'Admin'),
(3, 'Make C', 'Active', '2025-06-03', 'User1'),
(4, 'Make D', 'Active', '2025-06-04', 'User2'),
(5, 'Make E', 'Inactive', '2025-06-05', 'Admin'),
(6, 'Make F', 'Active', '2025-06-06', 'User1'),
(7, 'Make G', 'Inactive', '2025-06-07', 'User2'),
(8, 'Make H', 'Active', '2025-06-08', 'Admin'),
(9, 'Make I', 'Active', '2025-06-09', 'Admin'),
(10, 'Make J', 'Inactive', '2025-06-10', 'User1'),
(11, 'Make K', 'Active', '2025-06-11', 'User2'),
(12, 'Make L', 'Active', '2025-06-12', 'Admin'),
(13, 'Make M', 'Inactive', '2025-06-13', 'Admin'),
(14, 'Make N', 'Active', '2025-06-14', 'User1'),
(15, 'Make O', 'Active', '2025-06-15', 'User2'),
(16, 'Make P', 'Inactive', '2025-06-16', 'Admin'),
(17, 'Make Q', 'Active', '2025-06-17', 'User1'),
(18, 'Make R', 'Inactive', '2025-06-18', 'User2'),
(19, 'Make S', 'Active', '2025-06-19', 'Admin'),
(20, 'Make T', 'Active', '2025-06-20', 'Admin'),
(21, 'Make U', 'Inactive', '2025-06-21', 'User1'),
(22, 'Make V', 'Active', '2025-06-22', 'User2'),
(23, 'Make W', 'Active', '2025-06-23', 'Admin'),
(24, 'Make X', 'Inactive', '2025-06-24', 'Admin'),
(25, 'Make Y', 'Active', '2025-06-25', 'User1'),
(26, 'Make Z', 'Active', '2025-06-26', 'User2'),
(27, 'Make AA', 'Inactive', '2025-06-27', 'Admin'),
(28, 'Make AB', 'Active', '2025-06-28', 'User1'),
(29, 'Make AC', 'Inactive', '2025-06-29', 'User2'),
(30, 'Make AD', 'Active', '2025-06-30', 'Admin');

CREATE TABLE model(
    model_id INT PRIMARY KEY,
    model_desc VARCHAR(20) UNIQUE,
    model_status VARCHAR(20) NOT NULL,
    m_added_on DATE,
    m_added_by VARCHAR(20),
    CONSTRAINT model_desc_fk FOREIGN KEY (model_desc) REFERENCES make_table(make_desc),
    CONSTRAINT m_added_on_fk FOREIGN KEY (m_added_on) REFERENCES make_table(added_on)
);

INSERT INTO model (model_id, model_desc, model_status, m_added_on, m_added_by) VALUES
(1, 'Make A', 'Active', '2025-06-01', 'Admin'),
(2, 'Make B', 'Inactive', '2025-06-02', 'User1'),
(3, 'Make C', 'Active', '2025-06-03', 'User2'),
(4, 'Make D', 'Active', '2025-06-04', 'Admin'),
(5, 'Make E', 'Inactive', '2025-06-05', 'Admin'),
(6, 'Make F', 'Active', '2025-06-06', 'User1'),
(7, 'Make G', 'Inactive', '2025-06-07', 'User2'),
(8, 'Make H', 'Active', '2025-06-08', 'Admin'),
(9, 'Make I', 'Active', '2025-06-09', 'Admin'),
(10, 'Make J', 'Inactive', '2025-06-10', 'User1'),
(11, 'Make K', 'Active', '2025-06-11', 'User2'),
(12, 'Make L', 'Active', '2025-06-12', 'Admin'),
(13, 'Make M', 'Inactive', '2025-06-13', 'Admin'),
(14, 'Make N', 'Active', '2025-06-14', 'User1'),
(15, 'Make O', 'Active', '2025-06-15', 'User2'),
(16, 'Make P', 'Inactive', '2025-06-16', 'Admin'),
(17, 'Make Q', 'Active', '2025-06-17', 'User1'),
(18, 'Make R', 'Inactive', '2025-06-18', 'User2'),
(19, 'Make S', 'Active', '2025-06-19', 'Admin'),
(20, 'Make T', 'Active', '2025-06-20', 'Admin'),
(21, 'Make U', 'Inactive', '2025-06-21', 'User1'),
(22, 'Make V', 'Active', '2025-06-22', 'User2'),
(23, 'Make W', 'Active', '2025-06-23', 'Admin'),
(24, 'Make X', 'Inactive', '2025-06-24', 'Admin'),
(25, 'Make Y', 'Active', '2025-06-25', 'User1'),
(26, 'Make Z', 'Active', '2025-06-26', 'User2'),
(27, 'Make AA', 'Inactive', '2025-06-27', 'Admin'),
(28, 'Make AB', 'Active', '2025-06-28', 'User1'),
(29, 'Make AC', 'Inactive', '2025-06-29', 'User2'),
(30, 'Make AD', 'Active', '2025-06-30', 'Admin');

CREATE TABLE personal_information(
    user_id INT,
    user_type CHAR(8),
    last_name VARCHAR(20),
    gender CHAR(2),
    dob DATE,
    email VARCHAR(25) NOT NULL,
    marital_status CHAR(8),
    education INT NOT NULL,
    phone CHAR(15) NOT NULL,
    addr_1 VARCHAR(20) NOT NULL,
    addr_2 VARCHAR(20),
    addr_3 VARCHAR(20),
    street CHAR(15),
    city VARCHAR(30),
    state CHAR(15),
    country VARCHAR(20),
    national_id INT NOT NULL,
    nationality INT NOT NULL,
    p_status VARCHAR(15) NOT NULL,
    added_on DATE,
    added_by VARCHAR(20),
    CONSTRAINT user_id_pk PRIMARY KEY(user_id),
    CONSTRAINT user_type_ck CHECK(user_type IN ('user','broker','agent')),
    CONSTRAINT marital_status_ck CHECK(marital_status IN ('Single','Married')),
    CONSTRAINT city_ck CHECK(city IN ('Chennai','Coimbatore','Madurai','Tiruchirappalli','Salem','Tirunelveli','Erode','Tiruppur','Vellore','Thoothukudi','Dindigul','Thanjavur','Nagercoil','Karur','Kanchipuram','Namakkal','Cuddalore','Hosur','Nagapattinam','Ramanathapuram','Dharmapuri','Sivakasi','Ambur','Krishnagiri','Perambalur','Ariyalur','Virudhunagar','Theni')),
    CONSTRAINT state_ck CHECK(state IN ('Tamil Nadu')),
    CONSTRAINT country_ck CHECK(country IN ('Indian')),
    CONSTRAINT added_on_un UNIQUE(added_on),
    CONSTRAINT added_by_un UNIQUE(added_by)
);

INSERT INTO personal_information (user_id, user_type, last_name, gender, dob, email, marital_status, education, phone, addr_1, addr_2, addr_3, street, city, state, country, national_id, nationality, p_status, added_on, added_by) VALUES
(1, 'user', 'Kumar', 'M', '1999-01-01', 'kumar1@example.com', 'Single', 12, '9876543001', 'Main Rd', 'Block A', 'Floor 1', 'MG Rd', 'Chennai', 'Tamil Nadu', 'Indian', 1111, 91, 'Active', '2025-06-01', 'Admin1'),
(2, 'broker', 'Ravi', 'M', '1995-03-02', 'ravi2@example.com', 'Married', 15, '9876543002', 'East St', 'Near Park', 'Flat 2B', 'Anna St', 'Madurai', 'Tamil Nadu', 'Indian', 1112, 91, 'Active', '2025-06-02', 'Admin2'),
(3, 'agent', 'Priya', 'F', '1990-05-10', 'priya3@example.com', 'Single', 14, '9876543003', 'Lake View', 'Apt 5', 'Top Fl', 'Green St', 'Salem', 'Tamil Nadu', 'Indian', 1113, 91, 'Inactive', '2025-06-03', 'Admin3'),
(4, 'user', 'Arun', 'M', '1998-08-08', 'arun4@example.com', 'Single', 16, '9876543004', 'North Rd', NULL, NULL, 'First Ln', 'Coimbatore', 'Tamil Nadu', 'Indian', 1114, 91, 'Active', '2025-06-04', 'Admin4'),
(5, 'broker', 'Divya', 'F', '1996-07-15', 'divya5@example.com', 'Married', 17, '9876543005', 'West Ave', 'B2', NULL, 'Bridge St', 'Thanjavur', 'Tamil Nadu', 'Indian', 1115, 91, 'Inactive', '2025-06-05', 'Admin5'),
(6, 'agent', 'Rahul', 'M', '1993-11-11', 'rahul6@example.com', 'Single', 18, '9876543006', 'Cross Rd', '2nd Floor', 'Block C', 'West St', 'Tiruppur', 'Tamil Nadu', 'Indian', 1116, 91, 'Active', '2025-06-06', 'Admin6'),
(7, 'user', 'Meena', 'F', '1997-09-25', 'meena7@example.com', 'Married', 12, '9876543007', 'Hill Rd', 'Plot 22', NULL, 'Main St', 'Tirunelveli', 'Tamil Nadu', 'Indian', 1117, 91, 'Active', '2025-06-07', 'Admin7'),
(8, 'broker', 'Sathish', 'M', '1991-10-12', 'sathish8@example.com', 'Single', 13, '9876543008', 'River St', 'Lane 4', 'Room 102', 'Bazaar Rd', 'Vellore', 'Tamil Nadu', 'Indian', 1118, 91, 'Inactive', '2025-06-08', 'Admin8'),
(9, 'agent', 'Anu', 'F', '1994-04-04', 'anu9@example.com', 'Married', 15, '9876543009', 'Garden St', NULL, NULL, 'Lake Rd', 'Dindigul', 'Tamil Nadu', 'Indian', 1119, 91, 'Active', '2025-06-09', 'Admin9'),
(10, 'user', 'Mani', 'M', '1989-12-30', 'mani10@example.com', 'Single', 14, '9876543010', 'Sea View', 'Flat 101', NULL, 'Seaside Rd', 'Thoothukudi', 'Tamil Nadu', 'Indian', 1120, 91, 'Active', '2025-06-10', 'Admin10'),
(11, 'agent', 'Renu', 'F', '1992-01-01', 'renu11@example.com', 'Married', 16, '9876543011', 'Valley Rd', NULL, NULL, 'Park St', 'Karur', 'Tamil Nadu', 'Indian', 1121, 91, 'Inactive', '2025-06-11', 'Admin11'),
(12, 'broker', 'Ajay', 'M', '1995-05-05', 'ajay12@example.com', 'Single', 15, '9876543012', 'Metro Rd', '5A', NULL, 'Link Rd', 'Kanchipuram', 'Tamil Nadu', 'Indian', 1122, 91, 'Active', '2025-06-12', 'Admin12'),
(13, 'user', 'Kavya', 'F', '1993-03-03', 'kavya13@example.com', 'Married', 17, '9876543013', 'Blue St', NULL, NULL, 'Signal Rd', 'Hosur', 'Tamil Nadu', 'Indian', 1123, 91, 'Inactive', '2025-06-13', 'Admin13'),
(14, 'agent', 'Vikram', 'M', '1998-08-08', 'vikram14@example.com', 'Single', 13, '9876543014', 'Sunset Rd', '3rd floor', NULL, 'Tower Ln', 'Cuddalore', 'Tamil Nadu', 'Indian', 1124, 91, 'Active', '2025-06-14', 'Admin14'),
(15, 'broker', 'Sneha', 'F', '1990-10-10', 'sneha15@example.com', 'Married', 14, '9876543015', 'Market St', 'B Wing', 'Floor 3', 'Depot St', 'Ariyalur', 'Tamil Nadu', 'Indian', 1125, 91, 'Active', '2025-06-15', 'Admin15'),
(16, 'user', 'Ramesh', 'M', '1996-06-16', 'ramesh16@example.com', 'Single', 15, '9876543016', 'Palm Rd', NULL, NULL, 'Court Rd', 'Virudhunagar', 'Tamil Nadu', 'Indian', 1126, 91, 'Inactive', '2025-06-16', 'Admin16'),
(17, 'agent', 'Lakshmi', 'F', '1997-07-07', 'lakshmi17@example.com', 'Married', 18, '9876543017', 'Temple Rd', '2B', NULL, 'South Rd', 'Perambalur', 'Tamil Nadu', 'Indian', 1127, 91, 'Active', '2025-06-17', 'Admin17'),
(18, 'user', 'Arvind', 'M', '1994-04-14', 'arvind18@example.com', 'Single', 14, '9876543018', 'Station Rd', NULL, NULL, 'East Main', 'Tiruchirappalli', 'Tamil Nadu', 'Indian', 1128, 91, 'Active', '2025-06-18', 'Admin18'),
(19, 'broker', 'Geetha', 'F', '1992-02-20', 'geetha19@example.com', 'Married', 13, '9876543019', 'Bridge View', 'Flat 9C', NULL, 'New St', 'Nagapattinam', 'Tamil Nadu', 'Indian', 1129, 91, 'Inactive', '2025-06-19', 'Admin19'),
(20, 'agent', 'Naveen', 'M', '1991-01-21', 'naveen20@example.com', 'Single', 16, '9876543020', 'College Rd', '1st Block', NULL, 'Tech Park', 'Sivakasi', 'Tamil Nadu', 'Indian', 1130, 91, 'Active', '2025-06-20', 'Admin20'),
(21, 'user', 'Ramya', 'F', '1998-03-11', 'ramya21@example.com', 'Married', 14, '9876543021', 'Hill View', NULL, NULL, 'Bypass Rd', 'Dharmapuri', 'Tamil Nadu', 'Indian', 1131, 91, 'Active', '2025-06-21', 'Admin21'),
(22, 'broker', 'Gokul', 'M', '1996-06-06', 'gokul22@example.com', 'Single', 17, '9876543022', 'Bus Stand', 'B1', NULL, 'Mkt St', 'Nagercoil', 'Tamil Nadu', 'Indian', 1132, 91, 'Inactive', '2025-06-22', 'Admin22'),
(23, 'agent', 'Pooja', 'F', '1995-05-25', 'pooja23@example.com', 'Married', 15, '9876543023', 'Mill Rd', NULL, NULL, 'West Rd', 'Namakkal', 'Tamil Nadu', 'Indian', 1133, 91, 'Active', '2025-06-23', 'Admin23'),
(24, 'user', 'Dinesh', 'M', '1994-04-04', 'dinesh24@example.com', 'Single', 13, '9876543024', 'New St', 'Flat A', NULL, 'Ring Rd', 'Theni', 'Tamil Nadu', 'Indian', 1134, 91, 'Active', '2025-06-24', 'Admin24'),
(25, 'broker', 'Harini', 'F', '1997-07-07', 'harini25@example.com', 'Married', 12, '9876543025', 'Link Rd', NULL, NULL, 'East Rd', 'Krishnagiri', 'Tamil Nadu', 'Indian', 1135, 91, 'Inactive', '2025-06-25', 'Admin25'),
(26, 'agent', 'Surya', 'M', '1993-03-03', 'surya26@example.com', 'Single', 16, '9876543026', 'Green Lane', 'Top Floor', NULL, 'North St', 'Ambur', 'Tamil Nadu', 'Indian', 1136, 91, 'Active', '2025-06-26', 'Admin26'),
(27, 'user', 'Janani', 'F', '1995-05-15', 'janani27@example.com', 'Married', 17, '9876543027', 'College View', 'B2', NULL, 'Old St', 'Ramanathapuram', 'Tamil Nadu', 'Indian', 1137, 91, 'Active', '2025-06-27', 'Admin27'),
(28, 'broker', 'Kiran', 'M', '1996-06-06', 'kiran28@example.com', 'Single', 15, '9876543028', 'Thendral St', NULL, NULL, 'Town Rd', 'Nagapattinam', 'Tamil Nadu', 'Indian', 1138, 91, 'Inactive', '2025-06-28', 'Admin28'),
(29, 'agent', 'Snehan', 'M', '1997-07-07', 'snehan29@example.com', 'Single', 13, '9876543029', 'Sunrise Ave', NULL, NULL, 'Golden St', 'Ariyalur', 'Tamil Nadu', 'Indian', 1139, 91, 'Active', '2025-06-29', 'Admin29'),
(30, 'user', 'Lavanya', 'F', '1998-08-08', 'lavanya30@example.com', 'Married', 14, '9876543030', 'Garden Rd', NULL, NULL, 'West Cross', 'Erode', 'Tamil Nadu', 'Indian', 1140, 91, 'Active', '2025-06-30', 'Admin30');

-- New Broker added to personal_information
INSERT INTO personal_information (user_id, user_type, last_name, gender, dob, email, marital_status, education, phone, addr_1, addr_2, addr_3, street, city, state, country, national_id, nationality, p_status, added_on, added_by) VALUES
(31, 'broker', 'Vijay', 'M', '1990-09-09', 'vijay31@example.com', 'Married', 16, '9876543031', 'Galaxy St', 'Apt 10', NULL, 'Star Ave', 'Chennai', 'Tamil Nadu', 'Indian', 1141, 91, 'Active', '2025-07-01', 'Admin31');

CREATE TABLE login_user(
    login_id INT NOT NULL,
    u_password VARCHAR(30) NOT NULL,
    l_user_id INT,
    lead_id INT NOT NULL,
    l_user_type CHAR(8),
    l_status VARCHAR(20) NOT NULL,
    l_added_on DATE NOT NULL,
    l_added_by VARCHAR(20) NOT NULL,
    CONSTRAINT l_user_id_fk FOREIGN KEY (l_user_id) REFERENCES personal_information(user_id)
);

INSERT INTO login_user (login_id, u_password, l_user_id, lead_id, l_user_type, l_status, l_added_on, l_added_by) VALUES
(1, 'pass001', 1, 101, 'user', 'active', '2025-06-01', 'Admin1'),
(2, 'pass002', 2, 102, 'broker', 'inactive', '2025-06-02', 'Admin2'),
(3, 'pass003', 3, 103, 'agent', 'active', '2025-06-03', 'Admin3'),
(4, 'pass004', 4, 104, 'user', 'active', '2025-06-04', 'Admin4'),
(5, 'pass005', 5, 105, 'broker', 'inactive', '2025-06-05', 'Admin5'),
(6, 'pass006', 6, 106, 'agent', 'active', '2025-06-06', 'Admin6'),
(7, 'pass007', 7, 107, 'user', 'active', '2025-06-07', 'Admin7'),
(8, 'pass008', 8, 108, 'broker', 'inactive', '2025-06-08', 'Admin8'),
(9, 'pass009', 9, 109, 'agent', 'active', '2025-06-09', 'Admin9'),
(10, 'pass010', 10, 110, 'user', 'active', '2025-06-10', 'Admin10'),
(11, 'pass011', 11, 111, 'agent', 'inactive', '2025-06-11', 'Admin11'),
(12, 'pass012', 12, 112, 'broker', 'active', '2025-06-12', 'Admin12'),
(13, 'pass013', 13, 113, 'user', 'active', '2025-06-13', 'Admin13'),
(14, 'pass014', 14, 114, 'agent', 'inactive', '2025-06-14', 'Admin14'),
(15, 'pass015', 15, 115, 'broker', 'active', '2025-06-15', 'Admin15'),
(16, 'pass016', 16, 116, 'user', 'inactive', '2025-06-16', 'Admin16'),
(17, 'pass017', 17, 117, 'agent', 'active', '2025-06-17', 'Admin17'),
(18, 'pass018', 18, 118, 'user', 'active', '2025-06-18', 'Admin18'),
(19, 'pass019', 19, 119, 'broker', 'inactive', '2025-06-19', 'Admin19'),
(20, 'pass020', 20, 120, 'agent', 'active', '2025-06-20', 'Admin20'),
(21, 'pass021', 1, 121, 'user', 'active', '2025-06-21', 'Admin21'),
(22, 'pass022', 2, 122, 'broker', 'inactive', '2025-06-22', 'Admin22'),
(23, 'pass023', 3, 123, 'agent', 'active', '2025-06-23', 'Admin23'),
(24, 'pass024', 4, 124, 'user', 'inactive', '2025-06-24', 'Admin24'),
(25, 'pass025', 5, 125, 'broker', 'active', '2025-06-25', 'Admin25'),
(26, 'pass026', 6, 126, 'agent', 'inactive', '2025-06-26', 'Admin26'),
(27, 'pass027', 7, 127, 'user', 'active', '2025-06-27', 'Admin27'),
(28, 'pass028', 8, 128, 'broker', 'inactive', '2025-06-28', 'Admin28'),
(29, 'pass029', 9, 129, 'agent', 'active', '2025-06-29', 'Admin29'),
(30, 'pass030', 10, 130, 'user', 'active', '2025-06-30', 'Admin30');

CREATE TABLE broker(
    broker_id INT,
    broker_name VARCHAR(20) NOT NULL,
    broker_org_name VARCHAR(20) NOT NULL,
    contact_info TEXT NOT NULL ,
    b_status VARCHAR(20) NOT NULL,
    b_Added_on DATE NOT NULL,
    b_added_by VARCHAR(20),
    CONSTRAINT broker_id_fk FOREIGN KEY (broker_id) REFERENCES personal_information(user_id)
);

-- Corrected INSERT statements for the original broker data

INSERT INTO broker(broker_id, broker_name, broker_org_name, contact_info, b_status, b_Added_on, b_added_by) VALUES
(1, 'Brokerage Elite', 'Elite Properties', 'r.reddy@example.com, 9876543001', 'Active', '2025-06-01', 'SysAdmin1'),
(2, 'City Homes Realty', 'City Homes', 's.sharma@example.com, 9876543002', 'Active', '2025-06-02', 'SysAdmin2'),
(3, 'Madurai Properties', 'Prime Realty', 'a.khan@example.com, 9876543003', 'Inactive', '2025-06-03', 'SysAdmin3'),
(4, 'Salem Dream Homes', 'Dream Homes', 'p.devi@example.com, 9876543004', 'Active', '2025-06-04', 'SysAdmin4'),
(5, 'Trichy Landlords', 'Apex Holdings', 'j.singh@example.com, 9876543005', 'Active', '2025-06-05', 'SysAdmin5'),
(6, 'Erode Estates', 'Green Properties', 'm.kumar@example.com, 9876543006', 'Inactive', '2025-06-06', 'SysAdmin6'),
(7, 'Thanjavur Deals', 'Royal Realtors', 's.patel@example.com, 9876543007', 'Active', '2025-06-07', 'SysAdmin7'),
(8, 'Nagercoil Brokers', 'Coastal Realty', 'k.mehta@example.com, 9876543008', 'Active', '2025-06-08', 'SysAdmin8'),
(9, 'Karur Realty Hub', 'Central Hub', 'r.joshi@example.com, 9876543009', 'Inactive', '2025-06-09', 'SysAdmin9'),
(10, 'Kanchi Homes', 'Heritage Properties', 's.pillai@example.com, 9876543010', 'Active', '2025-06-10', 'SysAdmin10'),
(11, 'Hosur Commercials', 'Borderline Estates', 'd.rao@example.com, 9876543011', 'Active', '2025-06-11', 'SysAdmin11'),
(12, 'Nagapattinam Lands', 'Port City Brokers', 'a.menon@example.com, 9876543012', 'Inactive', '2025-06-12', 'SysAdmin12'),
(13, 'Ramanathapuram Prop.', 'Island View Realty', 'v.naidu@example.com, 9876543013', 'Active', '2025-06-13', 'SysAdmin13'),
(14, 'Dharmapuri Dealers', 'Hill View Properties', 'l.iyengar@example.com, 9876543014', 'Active', '2025-06-14', 'SysAdmin14'),
(15, 'Sivakasi Spark', 'Firework Estates', 'g.chettiar@example.com, 9876543015', 'Inactive', '2025-06-15', 'SysAdmin15');

ALTER TABLE broker MODIFY broker_name VARCHAR(50);

INSERT INTO broker(broker_id, broker_name, broker_org_name, contact_info, b_status, b_Added_on, b_added_by) VALUES
(16, 'Tirunelveli Trade', 'Southern Realty', 's.varma@example.com, 9876543016', 'Active', '2025-06-16', 'SysAdmin16'),
(17, 'Perambalur Ventures', 'Valley View Estates', 'm.jain@example.com, 9876543017', 'Active', '2025-06-17', 'SysAdmin17'),
(18, 'Dindigul Real Assets', 'Coconut Realty', 'p.rathore@example.com, 9876543018', 'Inactive', '2025-06-18', 'SysAdmin18'),
(19, 'Tenkasi Traders', 'Hilltop Properties', 't.nair@example.com, 9876543019', 'Active', '2025-06-19', 'SysAdmin19'),
(20, 'Ariyalur Agents', 'Delta Holdings', 'z.pandian@example.com, 9876543020', 'Active', '2025-06-20', 'SysAdmin20'),
(21, 'Viluppuram Ventures', 'Eastern Realty', 'u.kapoor@example.com, 9876543021', 'Inactive', '2025-06-21', 'SysAdmin21'),
(22, 'Thiruvarur Holdings', 'Canal Side Realty', 'q.murthy@example.com, 9876543022', 'Active', '2025-06-22', 'SysAdmin22'),
(23, 'Cuddalore Realtors', 'Bayview Estates', 'c.raman@example.com, 9876543023', 'Active', '2025-06-23', 'SysAdmin23'),
(24, 'Namakkal Deals', 'Rock Realty', 'w.nadar@example.com, 9876543024', 'Inactive', '2025-06-24', 'SysAdmin24'),
(25, 'Pudukkottai Brokers', 'Heritage Brokers', 'e.iyer@example.com, 9876543025', 'Active', '2025-06-25', 'SysAdmin25'),
(26, 'Thoothukudi Lands', 'Harbor Realty', 'r.patkar@example.com, 9876543026', 'Active', '2025-06-26', 'SysAdmin26'),
(27, 'Krishnagiri Estates', 'Granite Realty', 'y.bhatt@example.com, 9876543027', 'Inactive', '2025-06-27', 'SysAdmin27'),
(28, 'Sivagangai Homes', 'Chettinad Estates', 'o.sethuraman@example.com, 9876543028', 'Active', '2025-06-28', 'SysAdmin28'),
(29, 'Nilgiris Property Link', 'Blue Hills Realty', 'b.sharma@example.com, 9876543029', 'Active', '2025-06-29', 'SysAdmin29'),
(30, 'Chengalpattu Realty', 'Greenbelt Holdings', 'n.kannan@example.com, 9876543030', 'Inactive', '2025-06-30', 'SysAdmin30');



