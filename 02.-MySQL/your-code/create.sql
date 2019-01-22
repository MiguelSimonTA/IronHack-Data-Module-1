USE lab_mysql;

CREATE TABLE cars (car_id TINYINT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
vin CHAR(17) NOT NULL, manufacturer VARCHAR(20), model VARCHAR(20), year YEAR, color VARCHAR(10));

CREATE TABLE customers (customer_id SMALLINT(4) AUTO_INCREMENT PRIMARY KEY, 
client_id CHAR(4) NOT NULL, name VARCHAR(40) NOT NULL, phone VARCHAR(20) NOT NULL, email VARCHAR(40), 
address VARCHAR(40), city VARCHAR(20), state_province VARCHAR(20), country VARCHAR(30), postal_code VARCHAR(10));

CREATE TABLE salespersons (salesperson_id TINYINT(2) AUTO_INCREMENT PRIMARY KEY, 
staff_id CHAR(4) NOT NULL, name VARCHAR(40) NOT NULL, store VARCHAR(40));

CREATE TABLE invoices (invoice_id SMALLINT(5) AUTO_INCREMENT PRIMARY KEY, 
invoice_number INT(9) NOT NULL, date DATE, car_id TINYINT(2) NOT NULL, 
customer_id SMALLINT(4) NOT NULL, salesperson_id TINYINT(2) NOT NULL);