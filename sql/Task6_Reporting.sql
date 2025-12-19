SELECT DATE_FORMAT(TransactionDate, '%Y-%m-01') AS month_bucket, COUNT(*) as total_count, SUM(transactionamount) as total_amount,
AVG(transactionamount) as avg_amount, 
SUM(CASE WHEN transactiontype = 'debit' THEN transactionamount ELSE 0 END) as total_debit,
SUM(CASE WHEN transactiontype = 'credit' THEN transactionamount ELSE 0 END) as total_credit from transactions
GROUP BY month_bucket;

SELECT AccountID, count(*) as total_count, sum(transactionamount) as total_amount, AVG(transactionamount) as avg_amount,
SUM(CASE WHEN transactiontype = 'debit' THEN transactionamount ELSE 0 END) as total_debit,
SUM(CASE WHEN transactiontype = 'credit' THEN transactionamount ELSE 0 END) as total_credit,
COUNT(Distinct DeviceID) as distinct_devices,
MAX(loginattempts) as max_login_count
FROM transactions
GROUP BY AccountID;

#Order by potential risks: Many different device id and many login attempts
SELECT AccountID, count(*) as total_count, sum(transactionamount) as total_amount, AVG(transactionamount) as avg_amount,
SUM(CASE WHEN transactiontype = 'debit' THEN transactionamount ELSE 0 END) as total_debit,
SUM(CASE WHEN transactiontype = 'credit' THEN transactionamount ELSE 0 END) as total_credit,
COUNT(Distinct DeviceID) as distinct_devices,
MAX(loginattempts) as max_login_count
FROM transactions
GROUP BY AccountID
ORDER BY COUNT(Distinct DeviceID) DESC, MAX(loginattempts) DESC
LIMIT 10;
