#The idea of date bucketing: group each date into its own month
SELECT
  TransactionDate,
  DATE_FORMAT(TransactionDate, '%Y-%m-01') AS month_bucket
FROM transactions
LIMIT 10;
#Monthly transaction count:
#Note: When using group by, then the attributes inside Select command has to be either an aggregate function or included in group by
SELECT DATE_FORMAT(TransactionDate, '%Y-%m-01') AS month_bucket, Count(*) as total_count, SUM(transactionamount) as total_amount
FROM transactions
GROUP BY month_bucket
ORDER BY month_bucket;
#Monthly debit card and credit card comparison:
SELECT DATE_FORMAT(TransactionDate, '%Y-%m-01') AS month_bucket, 
COUNT(*) AS total_count,
SUM(Case WHEN transactiontype ='debit' THEN transactionamount ELSE 0 END) as total_debit, 
SUM(CASE WHEN transactiontype = 'credit' THEN transactionamount ELSE 0 END) as total_credit
FROM transactions
GROUP BY month_bucket
ORDER BY month_bucket;
#Monthly channel trends
SELECT DATE_FORMAT(TransactionDate, '%Y-%m-01') AS month_bucket, 
COUNT(*) as total_count, Channel, SUM(TRANSACTIONAMOUNT) as total_amount from transactions 
GROUP BY month_bucket, channel
ORDER BY month_bucket;
#Total over time:
SELECT TransactionDate, TransactionAmount, SUM(TransactionAmount) OVER (ORDER BY TransactionDate) as sum_overtime FROM transactions
ORDER BY TransactionDate



