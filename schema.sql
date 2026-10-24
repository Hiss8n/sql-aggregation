CREATE TABLE payments (
    customerNumber INT NOT NULL,
    checkNumber VARCHAR(50) NOT NULL,
    paymentDate DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (customerNumber, checkNumber)
);


INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
(103, 'HQ336336', '2026-10-20', 6066.78),
(112, 'BO864823', '2026-10-21', 3257.64),
(112, 'GI540034', '2026-10-22', 1116.54),
(124, 'AT733856', '2026-10-23', 30253.75),
(124, 'JE105477', '2026-10-24', 22315.39),
(103, 'HQ336337', '2026-10-24', 4500.00);



CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(50),
    addressLine1 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50) NOT NULL,
    salesRepEmployeeNumber INT,
    creditLimit DECIMAL(10, 2)
);

INSERT INTO customers (customerNumber, customerName, country, creditLimit) VALUES
(103, 'Atelier graphique', 'France', 21000.00),
(112, 'Signal Gift Stores', 'USA', 71800.00),
(114, 'Australian Collectors, Co.', 'Australia', 117300.00),
(119, 'La Rochelle Gifts', 'France', 118200.00),
(121, 'Baane Mini Imports', 'Norway', 81700.00),
(124, 'Mini Gifts Distributors Ltd.', 'USA', 210500.00),
(128, 'Blauer See Auto, Co.', 'Germany', 59700.00),
(129, 'Mini Wheels Co.', 'USA', 64600.00);


CREATE TABLE orderdetails (
    orderNumber INT NOT NULL,
    productCode VARCHAR(15) NOT NULL,
    quantityOrdered INT NOT NULL,
    priceEach DECIMAL(10, 2) NOT NULL,
    orderLineNumber SMALLINT NOT NULL,
    PRIMARY KEY (orderNumber, productCode)
);





