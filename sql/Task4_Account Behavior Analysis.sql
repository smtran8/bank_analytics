#Account Behavior Analysis

#Which accounts transact the most
SELECT ACCOUNTID,COUNT(*) as total_count, SUM(TransactionAmount) as total_amount from transactions 
GROUP BY ACCOUNTID
ORDER BY total_count DESC 
LIMIT 5;

#Highest Debit Spend account
SELECT ACCOUNTID, TransactionType, SUM(transactionamount) as total_amount from transactions
WHERE TransactionType = 'Debit'
GROUP BY AccountID
ORDER BY total_amount DESC
LIMIT 5;

#Gap between each transaction
SELECT ACCOUNTID, AVG(TimeStampDiff(HOUR, Transactiondate, Previoustransactiondate)) as time_gap_transaction from transactions

WHERE Transactiondate < Previoustransactiondate and Previoustransactiondate is NOT Null
GROUP BY AccountID;

#Classify, which Account ID has high, medium, low activity? High: >= 10 counts; Medium: between 5 and 10 counts; Low: less than 5 counts




SELECT ACCOUNTID, 
total_count,
CASE
	WHEN total_count >= 10 THEN 'HIGH'
	WHEN total_count >= 5 and total_count <10 THEN 'Medium'
	WHEN total_count <5 THEN 'LOW' 
END AS activity_level
FROM( 
#SQL always runs CASE before checking the nickname total_count, so have to write 2 queries here
SELECT ACCOUNTID, COUNT(*) as total_count from transactions
GROUP BY ACCOUNTID
) alias_table #When doing wrapped SELECT Commands, in this case creating a table with accountid and total_count, got to put a name
ORDER BY total_count DESC ;
	
