-- 0. Data Integrity Checks 

USE banking_system;
SHOW tables;
-- 1. Query all transactions
SELECT * FROM bank_transactions_data;

-- 2. Query Debit transactions
SELECT * FROM bank_transactions_data WHERE TransactionType = "Debit";

-- 3. Check for NULL values
SELECT * FROM bank_transactions_data
WHERE TransactionID is NULL
OR AccountID is NULL
OR TransactionAmount is NULL
OR TransactionDate is NULL;

-- 4. Verify Unique Transaction IDs 
SELECT TransactionID, COUNT(*)
FROM bank_transactions_data
GROUP BY TransactionID
HAVING COUNT(*) > 1;

-- 5. Transaction amount should not be negative or zero
SELECT * FROM bank_transactions_data 
WHERE TransactionAmount <= 0;

-- 6. Transaction time should not be in the future
SELECT * FROM bank_transactions_data
WHERE TransactionDate > now();

-- 7. Account balance should not be Negative
SELECT * FROM bank_transactions_data
WHERE AccountBalance > 0;

SELECT * FROM bank_transactions_data 
WHERE TransactionType = 'Debit';

-- 8. Get distinct locations in the Dataset
SELECT DISTINCT Location FROM bank_transactions_data;

-- 9. Get Customers age between 20 and 70
SELECT * FROM bank_transactions_data WHERE CustomerAge BETWEEN 20 AND 70;

SELECT * FROM bank_transactions_data WHERE CustomerOccupation IN ('Doctor', 'Student');

SELECT DISTINCT TransactionType FROM bank_transactions_data;