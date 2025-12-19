SELECT COUNT(*),MIN(transactiondate), MAX(transactiondate) FROM transactions;
SELECT DISTINCT TransactionType from transactions;
SELECT DISTINCT CHANNEL FROM transactions;

SELECT SUM(transactionamount) as sum_by_channel, channel FROM transactions
GROUP BY CHANNEL




