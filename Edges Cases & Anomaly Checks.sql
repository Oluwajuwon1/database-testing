-- 0. Edge Cases and Anomaly checks 

-- 1. Zero Transaction duration
SELECT * FROM bank_transactions_data
WHERE TransactionDuration < 0;

-- 2. Accounts with no activity for over 180 days
SELECT AccountID, MAX(TransactionDate) as last_trx
FROM bank_transactions_data
GROUP BY AccountID
HAVING last_trx < NOW() - INTERVAL 180 DAY;

-- 3. Same MerchantID across unrelated location
SELECT MerchantID, COUNT(DISTINCT Location) AS loc_count
FROM bank_transactions_data
GROUP BY MerchantID
HAVING loc_count >5;