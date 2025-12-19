#Check Dataset, Can I trust this data?

#1: Check if transaction_id appears more than 1; it must be unique
SELECT COUNT(*) as total_count from transactions
GROUP BY transactionid;
#Great, the result is all 1 => Reliable for this

#2: Check for missing values in critical columns: TransactionID, AccountID, TransactionAmount, TransactionDate, Channel
SELECT 
SUM(TransactionID is NULL) as missing_transaction_id,
SUM(AccountID is NULL) as missing_account_id,
SUM(TransactionAmount is NULL) as missing_amount
FROM transactions;
#IS NULL can be used to check for missing data: if the data is Null, which means the data does not exist, it will return True, which is 1
#However, the results of this query returns 0, which means the is NULL is false, which means there are no data missing
#True = 1; False = 0

#3: Check for invalid values: TransactionAmount <= 0, CustomerAge <= 0, LoginAttempts < 0
SELECT accountid from transactions
WHERE transactionAmount <= 0 or customerAge <= 0 or loginattempts < 0;
#Great, the result for this case is Null

#4: Check for data range
SELECT MIN(transactionAmount), MAX(transactionAmount), MIN(transactiondate), MAX(transactiondate) from transactions
#Ranges looks fine