create database Bank;
use Bank;

select * from bank_data;
# count the number of unemployeee who has the loan 
SELECT 
    job, loan, pdays
FROM
    bank_data
WHERE
    job = 'unemployed' AND loan = 'yes';

#find the married person who have loan or unemploye
SELECT 
    job, marital, loan
FROM
    bank_data
WHERE
    marital = 'married' AND loan = 'yes'
        AND job = 'unemployed';

# count count loan duration  
SELECT 
    age, marital, duration
FROM
    bank_data
WHERE
    marital = 'single';
# count number of client with housing loan
SELECT 
    COUNT(*)
FROM
    bank_data
WHERE
    housing = 'yes';
#Average balance per job category:
SELECT 
    job, AVG(balance) AS avg_balance
FROM
    bank_data
GROUP BY job;
#Number of clients subscribed to a term deposit by marital status:
SELECT 
    marital, COUNT(*)
FROM
    bank_data
WHERE
    y = 'yes'
GROUP BY marital;
#Distribution of education levels:
SELECT 
    education, COUNT(*)
FROM
    bank_data
GROUP BY education;

#Clients who have been contacted the most number of times:
SELECT 
    *
FROM
    bank_data
WHERE
    campaign = (SELECT 
            MAX(campaign)
        FROM
            bank_data);
#Average duration of calls for each month:
SELECT 
    month, AVG(duration) AS avg_duration
FROM
    bank_data
GROUP BY month;
#clients who subscribed to a term deposit among those who were contacted via cellular:
SELECT (
    SELECT COUNT(*)
    FROM bank_data
    WHERE y = 'yes' AND contact = 'cellular'
) / (
    SELECT COUNT(*)
    FROM bank_data
    WHERE contact = 'cellular'
) as subscription_rate;
#Clients who were previously contacted and the outcome was successful:
SELECT *
FROM bank_data
WHERE previous > 0 AND poutcome = 'success';
#Find the day of the week with the highest average call duration:
SELECT day, AVG(duration) as avg_duration
FROM bank_data
GROUP BY day
ORDER BY avg_duration DESC
LIMIT 1;
            
            




