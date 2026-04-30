-- 1. Fraud Detection Queries

-- 2. verifying Bot activity with multiple transactions in short time
SELECT AccountID, COUNT(*) AS txn_count
FROM bank_transactions_data
WHERE TransactionDate >= NOW() - INTERVAL 1 HOUR
GROUP BY AccountID
HAVING COUNT(*) > 10;

-- 3. Verifying same accounts with multiple devices
SELECT AccountID, COUNT(DISTINCT DeviceID) AS device_count
FROM bank_transactions_data
GROUP BY AccountID
HAVING device_count > 5;

-- 4. Verifying repeated transactions with same amount
SELECT AccountID, TransactionAmount, COUNT(*) as frequency
FROM bank_transactions_data
GROUP BY AccountID, TransactionAmount
HAVING COUNT(*) > 5;