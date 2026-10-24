SELECT 
    paymentDate, 
    SUM(amount) AS total_amount
FROM 
    payments
GROUP BY 
    paymentDate
ORDER BY 
    paymentDate DESC
LIMIT 5;


/* get customer date */
SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS avg_credit_limit
FROM 
    customers
GROUP BY 
    customerName, 
    country;


/* product code */
SELECT 
    productCode, 
    quantityOrdered, 
    SUM(quantityOrdered * priceEach) AS total_price
FROM 
    orderdetails
GROUP BY 
    productCode, 
    quantityOrdered;

/* check number aggregation */

SELECT 
    checkNumber, 
    MAX(amount) AS highest_amount
FROM 
    payments
GROUP BY 
    checkNumber;


/* Customer name created  */

SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS avg_credit_limit
FROM 
    customers
GROUP BY 
    customerName, 
    country;