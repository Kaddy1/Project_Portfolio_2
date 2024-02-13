---Bank Customer Churn
--Data Cleaning (checking null values and duplicates)
SELECT *
FROM Customer_Churn_Records
WHERE 
CustomerId IS NULL OR
Surname IS NULL OR
CreditScore IS NULL OR
Geography IS NULL OR
Gender IS NULL OR
Age IS NULL OR
Tenure IS NULL OR
Balance IS NULL OR
NumOfProducts IS NULL OR
HasCrCard IS NULL OR
IsActiveMember IS NULL OR
EstimatedSalary IS NULL OR
Exited IS NULL OR
Complain IS NULL OR
Satisfaction_Score IS NULL OR
Card_Type IS NULL OR
Point_Earned IS NULL
--There are no NULL VALUES 


--Checking for duplicates Using CustomerID column
  --This column used unique identifier for customers
SELECT CustomerId, COUNT(CustomerId)
FROM Customer_Churn_Records
GROUP BY CustomerId
Having COUNT(CustomerId) > 1
--No duplicate Values 



---QUERIES TO BE USED FOR VISUALIZATION IN TABLEAU


--1. Churn Distribution (What is the distribution of customers that have exited the bank)
     --How many customers have churned
SELECT 
    COUNT(Exited) AS TotalCustomers,
    SUM(Exited) As ChurnedCustomers,
    COUNT(Exited) - SUM(Exited) AS NonChurnCustomers,
    (SUM(Exited)/COUNT(Exited))* 100 AS ChurnPercentage,
    100- ((SUM(Exited)/COUNT(Exited))* 100) AS NonChurnPercentage
FROM Customer_Churn_Records



--2. Demographic Impact (checking if there are demographic factors that seem to have an impact on churn rates  )

   -- Churn Rates by Geography 
SELECT
    Geography,
    COUNT(Geography) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(Geography) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited)/COUNT(Geography))* 100 AS Churnrate
FROM Customer_Churn_Records
GROUP BY Geography
       


   --Churn Rates by Gender 
   SELECT
    Gender,
    COUNT(Gender) AS TotalCustomers,
    SUM(Exited) AS churnedCustomers,
    (SUM(Exited)/COUNT(Gender))* 100 AS Churnrate,
    100 - (SUM(Exited)/COUNT(Gender))* 100 AS NonChurnrate
FROM Customer_Churn_Records
GROUP BY Gender
    



   --Average Age of Churned Vs. Non-Churned Customers
SELECT
    AVG(CASE WHEN Exited = 1 
        THEN Age 
        END) AS AvgAgeChurned,
    AVG(CASE WHEN Exited = 0 
    THEN Age 
    END) AS AvgAgeNotChurned
FROM Customer_Churn_Records
   



--3. Product and Service Usage
    --Churn Rates by Number of Products
SELECT
    NumOfProducts,
    COUNT(NumOfProducts) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(NumOfProducts) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(NumOfProducts)) * 100  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY NumOfProducts

   --Churn Rates by  Credit Card Ownership
SELECT
    HasCrCard, 
    COUNT(HasCrCard) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(HasCrCard) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(HasCrCard)) * 100.0  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY HasCrCard


--4. Customer Satisfaction
    --Correlation between satisfaction score and people who have churned
    SELECT
    Exited,
    AVG(Satisfaction_Score) AS AvgSatisfactionScore
FROM Customer_Churn_Records
GROUP BY Exited


   --Identifying common features among dissatised customers
SELECT
    Exited,
    AVG(Satisfaction_Score) AS AvgSatisfactionScore,
    COUNT(Exited) AS TotalCustomers
FROM Customer_Churn_Records
WHERE Satisfaction_Score < 3
GROUP BY Exited




--5. Financial Impact
    -- Average balance of customers who have churned VS Non-churned 
SELECT
    Exited,
    AVG(CAST (Balance AS DECIMAL(10,2))) AS AVGBalance
FROM Customer_Churn_Records
GROUP BY Exited

  --Churn Rates by credit score
  SELECT
    Exited,
    AVG(CreditScore) AS AVGCreditScore,
    COUNT(Exited) AS TotalCustomers
FROM Customer_Churn_Records
GROUP BY Exited 



--Churn by Card Type
SELECT
    Card_Type,
    COUNT(Card_Type) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(Card_Type) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(Card_Type)) * 100.0  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY Card_Type





