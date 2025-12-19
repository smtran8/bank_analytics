#Fraud Detection:
SELECT LoginAttempts, ACCOUNTID, TransactionID, TransactionAmount,
CASE WHEN loginattempts >= 5 THEN 'Suspicious' 
END AS fraud_check
from transactions;


#Large Transaction Amount
SELECT AccountID, TransactionAmount from transactions
WHERE TransactionAmount > 1000;

#Many transactions in short time
SELECT
  AccountID,
  
  TIMESTAMPDIFF(
    HOUR,
    PreviousTransactionDate,
    TransactionDate
  ) AS gap_hours
FROM transactions
WHERE
  PreviousTransactionDate IS NOT NULL
  AND TIMESTAMPDIFF(
        HOUR,
        PreviousTransactionDate,
        TransactionDate
      ) < 5
ORDER BY gap_hours ASC;

#Check whether an account use more than 1 device
SELECT total_count, AccountID 
FROM(
SELECT COUNT(DISTINCT DEVICEID) as total_count, AccountID from transactions
GROUP BY AccountID) new_table
where total_count > 5
