-- Testcase: Valid transactions only should be returned
SELECT t.TransactionID, a.AccountID, m.MerchantName, t.TransactionAmount
FROM transactions t
INNER JOIN accounts a ON t.AccountID = a.AccountID
INNER JOIN merchants m ON t.MerchantID = m.MerchantID;

-- Testcase: Validate NULL Transactions or Invalid MerchantID
SELECT t.TransactionID, t.MerchantID, m.MerchantName
FROM transactions t
LEFT JOIN merchants m ON t.MerchantID = m.MerchantName
WHERE MerchantName = NULL;

-- Testcase: Validate accounts without Transactions
SELECT t.TransactionID, a.AccountID
FROM transactions t
LEFT JOIN transactions a ON a.AccountID = t.AccountID
WHERE t.TransactionID = NULL;

-- Testcase: Fraud detetcion scenario (High amount + Many Login Attempts)
SELECT t.TransactionAmount, t.LoginAttempts, t.TransactionID, a.AccountID
FROM transactions t
JOIN accounts a ON t.AccountID = a.AccountID
WHERE t.TransactionAmount > 10000
AND  t.LoginAttempts > 3;

-- Testcase: Business rule validation (balance checks)
SELECT t.TransactionID, t.TransactionAmount, a.AccountBalance
FROM transactions t
JOIN accounts a ON t.AccountID = a.AccountID
WHERE t.TransactionAmount > a.AccountBalance;

