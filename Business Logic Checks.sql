-- 0. Business Logic Checks 

USE banking_system;
-- 1. Debit transaction should reduce balance
SELECT * FROM bank_transactions_data
WHERE TransactionType = 'Debit'
AND TransactionAmount > AccountBalance;

-- 2. Credit Transaction should not be negative
SELECT * FROM bank_transactions_data
WHERE TransactionType = 'Credit'
AND AccountBalance <= 0;
-- 3. Verifying and Validating Distinct Values 
SELECT DISTINCT Channel FROM bank_transactions_data;

-- 4. Transactions must have valid channels
SELECT * FROM bank_transactions_data
WHERE Channel NOT IN ('ATM', 'Online');

-- 5. Validate login attempts thresholds
SELECT * FROM bank_transactions_data
WHERE LoginAttempts > 5;

-- 6. Transaction duration sanity check (too long or short)
SELECT * FROM bank_transactions_data
WHERE TransactionDuration < 1 OR TransactionDuration > 300;

-- 7. Merchant ID should exist for all channel Transactions
SELECT * FROM bank_transactions_data
WHERE Channel IN ('ATM', 'Online', 'Branch')
AND MerchantID is NULL;