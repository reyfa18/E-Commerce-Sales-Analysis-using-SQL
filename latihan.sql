CREATE DATABASE ecommerce_db;
USE ecommerce_db;

SELECT NOW() AS "Tes Koneksi Berhasil!";

CREATE TABLE ecommerce_sales (
  InvoiceNo VARCHAR(50),
  StockCode VARCHAR(50),
  Description TEXT,
  Quantity VARCHAR(50),
  InvoiceDate VARCHAR(100),
  UnitPrice VARCHAR(50),
  CustomerID VARCHAR(50),
  Country VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data.csv'
INTO TABLE ecommerce_sales
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

DELETE FROM ecommerce_sales
WHERE InvoiceNo IS NULL OR TRIM(InvoiceNo) = ''
OR CustomerID IS NULL OR TRIM(CustomerID) = ''
OR Description IS NULL OR TRIM(Description) = '';
DELETE FROM ecommerce_sales
WHERE Quantity <= 0;
UPDATE ecommerce_sales
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');

SELECT * FROM ecommerce_sales LIMIT 10;

SELECT COUNT(*) AS total_transaksi FROM ecommerce_sales;

SELECT 
  DATE_FORMAT(InvoiceDate, '%Y-%m') AS bulan,
  ROUND(SUM(Quantity * UnitPrice), 2) AS total_pendapatan
FROM ecommerce_sales
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY bulan;

SELECT 
  Description,
  SUM(Quantity) AS total_terjual
FROM ecommerce_sales
GROUP BY Description
ORDER BY total_terjual DESC
LIMIT 10;

SELECT 
  Country, 
  COUNT(DISTINCT CustomerID) AS total_pelanggan
FROM ecommerce_sales
GROUP BY Country
ORDER BY total_pelanggan DESC
LIMIT 10;

SELECT CustomerID,
       ROUND(SUM(Quantity * UnitPrice), 2) AS total_spending,
       COUNT(InvoiceNo) AS total_transaksi
FROM ecommerce_sales
GROUP BY CustomerID
ORDER BY total_spending DESC
LIMIT 10;

