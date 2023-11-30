CREATE DATABASE hr_analytics;
USE hr_analytics;
SELECT * FROM employee_attrition;


-- Question(1) Average Satisfaction Level, Monthly Hours,Tenure by Department
SELECT dept, ROUND(avg(satisfaction_level),2) AS avg_satisfaction, 
ROUND(avg(average_montly_hours),2) AS avg_montly_hours,
ROUND(avg(time_spend_company),2) AS avg_tenure
FROM employee_attrition
GROUP BY dept;


-- Question(2) Count Employee Churn
SELECT dept, COUNT(*) AS churn_count
FROM employee_attrition
WHERE satisfaction_level < 0.5
GROUP BY dept;


-- Question(3) Employee Promotion Rate
SELECT promotion_last_5years, COUNT(*) AS promotion_count
FROM employee_attrition
GROUP BY promotion_last_5years;


-- Question(4) Employee Count by Salary Level
SELECT salary, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY salary;


-- Question(5) Show the top 10 employees with the highest combined scores based on satisfaction, 
--             evaluation, and average monthly hours.
SELECT emp_id, 
       satisfaction_level, 
       last_evaluation, 
       average_montly_hours,
       (0.4 * satisfaction_level + 0.4 * last_evaluation + 0.2 * average_montly_hours) AS overall_score
FROM employee_attrition
ORDER BY overall_score DESC
LIMIT 10;


-- Question(6) Identify employees with high satisfaction levels who work fewer than average monthly hours.
SELECT emp_id, satisfaction_level, average_montly_hours
FROM employee_attrition
WHERE satisfaction_level > 0.8 AND average_montly_hours < (SELECT AVG(average_montly_hours) FROM employee_attrition);


-- Question(7) Compare the average monthly hours worked by employees who were promoted in the last 
--             5 years to those who were not.
SELECT promotion_last_5years, AVG(average_montly_hours) AS avg_hours_worked
FROM employee_attrition
GROUP BY promotion_last_5years;


-- Question(8) Group employees into different tenure buckets (e.g., 1-2 years, 3-5 years, 6+ years).
SELECT emp_id,time_spend_company,
CASE WHEN time_spend_company BETWEEN 1 AND 2 THEN '1-2 years'
	WHEN time_spend_company BETWEEN 3 AND 5 THEN '3-5 years'
	ELSE '6+ years'
	END AS tenure_bucket
FROM employee_attrition;






















 