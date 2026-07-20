create database capston_project;
use capston_project;

select * from fintech_dataset;

-- 01 Write a query to find the total transaction amount per Customer_ID.

select Customer_ID, sum(Amount) from fintech_dataset
group by Customer_ID;


-- 02 Retrieve all transactions where Transaction_Status = 'Failed'.

select Amount, Transaction_Status from fintech_dataset
where Transaction_Status='Failed';


 -- 03 Find the top 10 highest transactions by Amount.
 
 select Amount from fintech_dataset
 order by Amount desc limit 10;
 
 -- 04 Calculate the average transaction amount by Account_Type.
 
 select Account_Type, round(avg(Amount),2) from fintech_dataset
 group by Account_Type;
 
 
 -- 05 Write a query to count transactions grouped by Merchant_Category.
 
 
  SELECT 
    Merchant_Category, COUNT(Amount)
FROM
    fintech_dataset
GROUP BY Merchant_Category;



-- 06 Find the fraudulent transactions (Is_Fraud = 1) and their total amount.

select sum(Amount) as total_fraud_amount from fintech_dataset
where IS_Fraud=1;


-- 07 Retrieve transactions made using a specific Device_Type (e.g., Mobile).

select Amount, Device_Type
from fintech_dataset
where Device_Type='Mobile';


-- 08 Write a query to find the region with the highest transaction volume.

select Region, Amount from fintech_dataset

order by Amount Desc ;

select Region, Amount from fintech_dataset
where Region = "South"
order by Amount Desc ;

-- 09 Calculate total processing fees collected per currency.

select round(sum(Processing_fee),2), Currency from fintech_dataset
group by Currency;


-- 10  Find customers who made more than 5 transactions

select Customer_ID, count(Amount) as Count_transaction from fintech_dataset
group by Customer_ID Having count(*) >5;





 
 
  
 

