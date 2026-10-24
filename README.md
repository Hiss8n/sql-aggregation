# SQL Aggregation

This project is a small MySQL example of table creation, sample data insertion, and aggregate queries using `SUM`, `AVG`, and `MAX` with `GROUP BY` and `ORDER BY`.

## Files

- `schema.sql` creates the tables and inserts sample rows.
- `queries.sql` contains aggregation queries that can be run after the schema script.

## Database Schema

### `payments`

Stores customer payment records.

| Column | Type | Description |
| --- | --- | --- |
| `customerNumber` | `INT` | Customer identifier; part of the primary key. |
| `checkNumber` | `VARCHAR(50)` | Payment check identifier; part of the primary key. |
| `paymentDate` | `DATE` | Date the payment was made. |
| `amount` | `DECIMAL(10, 2)` | Payment amount. |

The composite primary key is (`customerNumber`, `checkNumber`). The script inserts six payments for customers 103, 112, and 124.

### `customers`

Stores customer names, contact and location fields, sales representative number, and credit limit. `customerNumber` is the primary key. `customerName` and `country` are required; the other customer details are optional. The sample data contains eight customers from France, the USA, Australia, Norway, and Germany. Only customer number, name, country, and credit limit are populated in the sample inserts.

### `orderdetails`

Stores product line items for orders.

| Column | Type | Description |
| --- | --- | --- |
| `orderNumber` | `INT` | Order identifier; part of the primary key. |
| `productCode` | `VARCHAR(15)` | Product identifier; part of the primary key. |
| `quantityOrdered` | `INT` | Quantity ordered. |
| `priceEach` | `DECIMAL(10, 2)` | Unit price. |
| `orderLineNumber` | `SMALLINT` | Line number within the order. |

The composite primary key is (`orderNumber`, `productCode`). The script creates this table but does not insert sample order details, so the product query returns no rows until data is added.

No foreign-key constraints are declared in this schema.

## Aggregation Queries

Run the queries in `queries.sql` after creating the tables and inserting the sample data from `schema.sql`.

1. **Payment totals by date**

	Groups payments by `paymentDate`, sums `amount` for each date, sorts newest dates first, and returns at most five dates. With the included data there are five distinct payment dates, so all five are returned.

2. **Average credit limit by customer and country**

	Groups rows by both `customerName` and `country`, then calculates the average `creditLimit` within each group. Since each sample customer appears once, each average equals that customer's credit limit. The comment calls this customer data, not a calculation of one overall average.

3. **Extended order value by product and quantity**

	Calculates `SUM(quantityOrdered * priceEach)` for each (`productCode`, `quantityOrdered`) group. Because `quantityOrdered` is included in the grouping, the result is split by quantity as well as product. To get one total per product across all quantities, group only by `productCode` and select that column.

4. **Highest payment amount by check number**

	Groups payments by `checkNumber` and returns the maximum `amount` for each check. In the supplied rows, each check number occurs once, so the maximum is the amount of that payment.

5. **Repeated customer average query**

	Repeats the average-credit-limit query from item 2, including the same grouping behavior.

## Running the Scripts

Select or create a MySQL database, then execute `schema.sql` followed by `queries.sql`. The schema script uses `CREATE TABLE` without `IF NOT EXISTS` or reset statements, so running it again in a database where these tables already exist will fail. `orderdetails` must also be populated separately to see results from the product aggregation.
