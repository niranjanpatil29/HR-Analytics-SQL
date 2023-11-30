# HR Analytics Data Analysis <br>

## Project Overview <br>
This SQL-based data analysis project focuses on exploring and gaining insights from an HR dataset. The dataset contains information about employees, including their satisfaction levels, performance evaluations, number of projects, average monthly hours worked, time spent in the company, work accidents, promotions in the last 5 years, department, and salary level. The goal is to answer specific HR-related questions through SQL queries and provide valuable insights into employee satisfaction, performance, workload, tenure, and more.

## Dataset
**The dataset used for this analysis contains the following columns:**

**emp_id:** Unique identifier for each employee.<br>
**satisfaction_level:** Employee satisfaction level (double).<br>
**last_evaluation:** Last performance evaluation score (double).<br>
**number_project:** Number of projects the employee is involved in.<br>
**average_montly_hours:** Average monthly hours worked by the employee.<br>
**time_spend_company:** Number of years the employee has spent in the company.<br>
**Work_accident:** Indicates if the employee has had a work accident (1 for Yes, 0 for No).<br>
**promotion_last_5years:** Indicates if the employee has been promoted in the last 5 years (1 for Yes, 0 for No).<br>
**dept:** Department in which the employee works.<br>
**salary:** Salary level of the employee.<br>

## Questions and SQL Queries

**1. Average Satisfaction Level, Monthly Hours,Tenure by Department** <br>
SELECT dept, ROUND(avg(satisfaction_level),2) AS avg_satisfaction, <br>
ROUND(avg(average_montly_hours),2) AS avg_montly_hours,<br>
ROUND(avg(time_spend_company),2) AS avg_tenure <br>
FROM employee_attrition <br>
GROUP BY dept;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/80bdfc4a-0ac2-448c-997e-08e74eb69ca6)
<br><br>

**2. Count Employee Churn** <br>
SELECT dept, COUNT(*) AS churn_count <br>
FROM employee_attrition <br>
WHERE satisfaction_level < 0.5 <br>
GROUP BY dept;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/644f6420-8df2-4945-80dc-2654bb3c6856)
<br><br>

**3. Employee Promotion Rate** <br>
SELECT promotion_last_5years, COUNT(*) AS promotion_count <br>
FROM employee_attrition <br>
GROUP BY promotion_last_5years;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/65243693-0318-437f-badc-d92c6a4f993e)
<br><br>

**4. Employee Count by Salary Level** <br>
SELECT salary, COUNT(*) AS employee_count <br>
FROM employee_attrition <br>
GROUP BY salary;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/898bc3df-6262-4439-b52e-0f61731cb364)
<br><br>

**5. Show the top 10 employees with the highest combined scores based on satisfaction,evaluation and average monthly hours.** <br>
SELECT emp_id, <br>
       satisfaction_level, <br>
       last_evaluation, <br>
       average_montly_hours, <br>
       (0.4 * satisfaction_level + 0.4 * last_evaluation + 0.2 * average_montly_hours) AS overall_score <br>
FROM employee_attrition <br>
ORDER BY overall_score DESC <br>
LIMIT 10;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/c09e466f-638b-46f4-a797-e31fe2446d3a)
<br><br>

**6. Identify employees with high satisfaction levels who work fewer than average monthly hours.** <br>
SELECT emp_id, satisfaction_level, average_montly_hours <br>
FROM employee_attrition <br>
WHERE satisfaction_level > 0.8 AND average_montly_hours < (SELECT AVG(average_montly_hours) FROM employee_attrition);

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/bd1add0c-124a-45de-8463-60ec56467068)
<br><br>

**7. Compare the average monthly hours worked by employees who were promoted in the last 5 years to those who were not.** <br>
SELECT promotion_last_5years, AVG(average_montly_hours) AS avg_hours_worked <br>
FROM employee_attrition <br>
GROUP BY promotion_last_5years;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/51a514c5-7e92-4843-93db-a7261cfa5aac)
<br><br>

**8. Group employees into different tenure buckets (e.g., 1-2 years, 3-5 years, 6+ years).**
SELECT emp_id,time_spend_company, <br>
CASE WHEN time_spend_company BETWEEN 1 AND 2 THEN '1-2 years' <br>
	WHEN time_spend_company BETWEEN 3 AND 5 THEN '3-5 years' <br>
	ELSE '6+ years' <br>
	END AS tenure_bucket <br>
FROM employee_attrition;

![image](https://github.com/niranjanpatil29/HR-Analytics-SQL/assets/115970117/e674075d-79c9-408f-bb26-7c891f097b4e)
<br><br>

## Conclusion
This HR Analytics data analysis project provides valuable insights into employee satisfaction, performance, workload, tenure, and other key HR metrics within the organization. The SQL queries help answer specific questions and can be used for further analysis and decision-making in human resources management. Visualization and additional exploration can enhance the understanding of employee dynamics and contribute to strategic HR planning.
