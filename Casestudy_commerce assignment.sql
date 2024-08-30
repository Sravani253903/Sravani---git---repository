use ecommerce_dbs;
show tables;
select * from ecommerce_data;
select count(*) from ecommerce_data

/* check1 */
SELECT 
    COUNT(*) AS null_count
FROM 
    ecommerce_data
WHERE 
    Transactionid IS NULL 
    OR Productid IS NULL 
    OR ProductCategory IS NULL 
    OR ProductSubcategory IS NULL 
    OR ProductPrice IS NULL 
    OR QuantitySold IS NULL 
    OR TransactionDate IS NULL 
    OR Customerid IS NULL 
    OR Customerlocation IS NULL 
    OR Paymentmethod IS NULL;
 
 /* check2 */
SELECT 
    Transactionid, 
    COUNT(*) AS duplicate_count
FROM 
    ecommerce_data
GROUP BY 
    Transactionid
HAVING 
    COUNT(*) > 1;
    

/* check3 */
SELECT 
    COUNT(*) AS invalid_date_count
FROM 
    ecommerce_data
WHERE 
    TransactionDate < '1900-01-01' 
    OR TransactionDate > CURDATE();


/* check4 */
SELECT 
    COUNT(*) AS invalid_price_count
FROM 
    ecommerce_data
WHERE 
    ProductPrice < 0;

/* check5 */
SELECT 
    COUNT(*) AS invalid_quantity_count
FROM 
    ecommerce_data
WHERE 
    QuantitySold < 0;
    
/* check6 */
SELECT 
    Customerid, 
    SUM(ProductPrice * QuantitySold) AS total_sales
FROM 
    ecommerce_data
GROUP BY 
    Customerid
ORDER BY 
    total_sales DESC
LIMIT 10;

/* check7 */
SELECT 
    Productid, 
    SUM(ProductPrice * QuantitySold) AS total_sales
FROM 
    ecommerce_data
GROUP BY 
    Productid
ORDER BY 
    total_sales DESC
LIMIT 10;

