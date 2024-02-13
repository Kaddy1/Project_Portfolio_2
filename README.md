# Bank Customer Churn Analysis

### Project Overview
This project aims to analyze and  provide insight into Bank Customer churn. It explores the factors that might affect a customer exiting the bank. It is crucial for a bank to understand the underlying factors as the why customers leave the bank because it is more expensive to attract new customers than to retain existing customers.

### Data Sources
The primary dataset used in this analysis is bank customer churn data from Kaggle (Click here). It contains information about each customer of a bank such as Age, gender, credit card usage, card type, balance, etc.  


### Tools
- Excel (Data Exploration and Cleaning)
- SQL Server (Data Analysis)
- Tableau (Visualization, Creating reports)


### Data Cleaning and Preparation
The following tasks were performed in this phase
- Data loading and inspection
- Checking of missing values and duplicates
- Data Cleaning and formatting


### Exploratory Data Analysis
EDA involves exploring the bank customer churn data to answer key questions such as:
1. What is the distribution of the "Exited" column (representing churn) in the dataset?

2. Are there any demographic factors (e.g., Geography, Gender, Age) that seem to have a significant impact on churn rates? What is the average age of customers who have churned compared to those who haven't?

3. Do customers with a higher number of products or services (e.g., NumOfProducts, HasCrCard) exhibit different churn behavior?

4. How does the "Satisfaction_Score" correlate with churn?

5. Are there common features among customers who express dissatisfaction and subsequently churn?

6. Do customers with higher credit scores exhibit lower churn rates, indicating financial stability?



### Data Analysis
SQL QUERIES USED FOR VISUALIZATION IN TABLEAU
```
SELECT 
    COUNT(Exited) AS TotalCustomers,
    SUM(Exited) As ChurnedCustomers,
    COUNT(Exited) - SUM(Exited) AS NonChurnCustomers,
    (SUM(Exited)/COUNT(Exited))* 100 AS ChurnPercentage
FROM Customer_Churn_Records


SELECT
    Geography,
    COUNT(Geography) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(Geography) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited)/COUNT(Geography))* 100 AS Churnrate
FROM Customer_Churn_Records
GROUP BY Geography
  

   SELECT
    Gender,
    COUNT(Gender) AS TotalCustomers,
    SUM(Exited) AS churnedCustomers,
    (SUM(Exited)/COUNT(Gender))* 100 AS Churnrate,
    100 - (SUM(Exited)/COUNT(Gender))* 100 AS NonChurnrate
FROM Customer_Churn_Records
GROUP BY Gender


SELECT
    AVG(CASE WHEN Exited = 1 
        THEN Age 
        END) AS AvgAgeChurned,
    AVG(CASE WHEN Exited = 0 
    THEN Age 
    END) AS AvgAgeNotChurned
FROM Customer_Churn_Records
   

SELECT
    NumOfProducts,
    COUNT(NumOfProducts) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(NumOfProducts) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(NumOfProducts)) * 100  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY NumOfProducts


SELECT
    HasCrCard, 
    COUNT(HasCrCard) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(HasCrCard) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(HasCrCard)) * 100.0  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY HasCrCard


    SELECT
    Exited,
    AVG(Satisfaction_Score) AS AvgSatisfactionScore
FROM Customer_Churn_Records
GROUP BY Exited


SELECT
    Exited,
    AVG(Satisfaction_Score) AS AvgSatisfactionScore,
    COUNT(Exited) AS TotalCustomers
FROM Customer_Churn_Records
WHERE Satisfaction_Score < 3
GROUP BY Exited


  SELECT
    Exited,
    AVG(CreditScore) AS AVGCreditScore,
    COUNT(Exited) AS TotalCustomers
FROM Customer_Churn_Records
GROUP BY Exited 


SELECT
    Card_Type,
    COUNT(Card_Type) AS TotalCustomers,
    SUM(Exited) AS ChurnedCustomers,
    COUNT(Card_Type) - SUM(Exited) AS NonChurnedCustomer,
    (SUM(Exited) / COUNT(Card_Type)) * 100.0  AS ChurnRate
FROM Customer_Churn_Records
GROUP BY Card_Type

```


### Findings /Results 
The Insights from the analysis are summarised as follows:

1. The churn rate of 20.45 suggests that a significant amount of customers have exited the bank while 79,55 indicates that these customers are still using one of the bank’s services.


2. The impact of demographic factors on churn rates:
 - The churn rate for males is 16.5%, while the churn rate for females is higher at 25.1%. This suggests that, on average, female customers have a higher propensity to churn compared to male customers.
 - The churn rate in Germany is relatively higher at 32.4% compared to France (16.1%) and Spain (16.7%). This indicates that customers in Germany are more likely to churn compared to customers in France and Spain.
  - The average age of churned customers is 44, while the average age of non-churned customers is 37. This shows that older customers, on average, are more likely to churn compared to younger customers.


3. Churn and number of products and credit card ownership 
  - Customers with one product have a churn rate of 28% which is relatively high. This   indicates that customers with fewer products are most likely to leave the bank.
  - The churn rate for customers with two products is 7.6% indicating that as customers engage with more products, their likelihood of leaving the bank decreases.
  - Customers with three and four products have a churn rate of 82.8% and 100% which  is relatively high. This seems unusual and further investigations and analysis are need.

 - Churn and credit card ownership 
  - The churn rate for customers with credit cards and without credit cards is 20.2% and 20.8% respectively. 
 - There is no significant difference between customers with credit cards and customers without credit cards. Further analysis needs to be done as the data shows that credit card 
  ownership alone might not be the main factor driving churn. 


4. Satisfaction_Score and churn
  The average satisfaction score for customers who have churned is 2 while the average satisfaction score for customers who have not churned is 3. This indicates that on average 
  customers who have churned tend to have lower satisfaction scores.  


5. Identifying common features among dissatisfied customers
  The average satisfaction score for both churned and non-churned customers is 1. This indicates a high level of dissatisfaction among customers who have churned.
Similarly, the analysis also suggests that dissatisfaction exists among some customers who are still with the bank the bank.


7. Credit Scores and Churn
 On average, customers who have churned have a credit score of 645 and those who have not churned have a credit score of 651.
 Customers who have exited have slightly lower average credit scores compared to those who have not.
 Further investigations need to be done as credit score alone might not be the key driver to customer churn.
  



### Recommendation
1. The recommendations aim to address customer churn and satisfaction issues identified through the analysis:

2. Develop retention strategies for female customers especially in Germany to address their specific needs and reduce churn.

3. Tailor retention campaigns to different segments based on demographics to improve satisfaction and loyalty.

4. Promote the usage of multiple products and investigate the reason why customers with multiple products have high churn rates. 

5. There are no significant differences in churn rates between customers with and without credit cards. However,  customer engagement and retention can be improved by analyzing credit card offerings.

6. Develop initiatives to improve overall customer satisfaction by addressing common issues affecting customer experiences. 

7. Investigate the relationship between credit scores and churn to understand additional factors affecting customer behavior.


Implementing these recommendations can help mitigate churn, improve customer satisfaction, and foster long-term relationships with customers, contributing to sustained growth and profitability.
