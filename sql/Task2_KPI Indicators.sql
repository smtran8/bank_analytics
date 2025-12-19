#Finding OUT KPI metrics?

#Total transaction count, transaction amount, average transaction amount
SELECT COUNT(*) , SUM(TransactionAmount) as total_transaction_val, AVG(TransactionAmount) as avg_transaction_val
FROM transactions;

#Group by transaction method, to see which method (credit,debit) that dominate
SELECT transactiontype, COUNT(*) , SUM(TransactionAmount) as total_transaction_val, AVG(TransactionAmount) as avg_transaction_val
FROM transactions 
GROUP BY transactiontype;

#Group channels, to see which channel dominate (ATM, Online, Branch)
SELECT channel, COUNT(*), sum(transactionAmount) from transactions
GROUP BY channel;

#Group by channel to see the average transaction amount
SELECT channel, AVG(TransactionAmount) from transactions
GROUP BY CHANNEL;

#Group by location, to see which location produces the most transaction amount
SELECT location, sum(transactionamount) as sum_amount from transactions
group by Location 
order by sum_amount desc
limit 10;

#To see which account ID has the most transaction amount
SELECT sum(transactionamount) as sum_amount, accountid from transactions
GROUP by accountid
ORDER by sum_amount DESC
LIMIT 5;

#To see active account : account with most transactions, not necessarily the amount

SELECT ACCOUNTID, Count(*) as count_transaction from transactions
GROUP by Accountid
ORDER BY count_transaction
LIMIT 5