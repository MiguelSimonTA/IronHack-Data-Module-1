INSERT INTO cars (vin, manufacturer, model, year, color) 
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota',	'RAV4',	2018, 'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customers (client_id, name, phone, address, city, state_province, country, postal_code)
VALUES ('A001',	'Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid',	'Madrid',	'Spain', '28045'),
('C025',	'Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida',	'United States', '33130'),
('B190',	'Napoléon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France',	'France', '75008');

INSERT INTO salespersons (staff_id, name, store)
VALUES ('MA02',	'Petey Cruiser', 'Madrid'),
('BA02', 'Anna Sthesia',	'Barcelona'),
('BE01', 'Paul Molive',	'Berlin'),
('PA01', 'Gail Forcewind',	'Paris'),
('MI02', 'Paige Turner',	'Mimia'),
('ME01', 'Bob Frapples',	'Mexico City'),
('AM01', 'Walter Melon',	'Amsterdam'),
('SP01', 'Shonda Leer',	'São Paulo');

INSERT INTO invoices (invoice_number, date, car_id, customer_id, salesperson_id)
VALUES (852399038, '2018-08-22', 0, 1, 3),
(731166526, '2018-12-31', 3, 0, 5),
(271135104, '2019-01-22', 2, 2, 7);