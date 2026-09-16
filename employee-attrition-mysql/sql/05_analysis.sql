USE hr_attrition_portfolio;

-- 01 overview
SELECT COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis;

-- 02 department
SELECT Department, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis GROUP BY Department ORDER BY attrition_pct DESC;

-- 03 overtime
SELECT OverTime, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis GROUP BY OverTime ORDER BY attrition_pct DESC;

-- 04 tenure
SELECT tenure_band, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis GROUP BY tenure_band ORDER BY tenure_band;

-- 05 satisfaction
SELECT JobSatisfaction, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis GROUP BY JobSatisfaction ORDER BY JobSatisfaction;

-- 06 income
SELECT Attrition, COUNT(*) AS employees, ROUND(AVG(MonthlyIncome),2) AS mean_monthly_income FROM employee_analysis GROUP BY Attrition ORDER BY Attrition;

-- 07 role rank
WITH role_summary AS (
 SELECT Department, JobRole, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers,
 100.0*SUM(Attrition='Yes')/COUNT(*) AS attrition_pct
 FROM employee_analysis GROUP BY Department, JobRole
)
SELECT Department, JobRole, employees, leavers, ROUND(attrition_pct,2) AS attrition_pct,
 DENSE_RANK() OVER (PARTITION BY Department ORDER BY attrition_pct DESC) AS department_rank
FROM role_summary ORDER BY Department, department_rank, JobRole;

-- 08 overtime by department
SELECT Department, OverTime, COUNT(*) AS employees, SUM(Attrition='Yes') AS leavers, ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct FROM employee_analysis GROUP BY Department, OverTime ORDER BY Department, OverTime;

-- 09 income quartiles
WITH income_groups AS (
 SELECT Attrition, MonthlyIncome, NTILE(4) OVER (ORDER BY MonthlyIncome, EmployeeNumber) AS income_quartile
 FROM employee_analysis
)
SELECT income_quartile, COUNT(*) AS employees, MIN(MonthlyIncome) AS min_income,
 MAX(MonthlyIncome) AS max_income, SUM(Attrition='Yes') AS leavers,
 ROUND(100.0*SUM(Attrition='Yes')/COUNT(*),2) AS attrition_pct
FROM income_groups GROUP BY income_quartile ORDER BY income_quartile;

-- 10 department vs overall
WITH overall AS (
 SELECT 100.0*SUM(Attrition='Yes')/COUNT(*) AS overall_pct FROM employee_analysis
), departments AS (
 SELECT Department, COUNT(*) AS employees,
 100.0*SUM(Attrition='Yes')/COUNT(*) AS department_pct
 FROM employee_analysis GROUP BY Department
)
SELECT d.Department, d.employees, ROUND(d.department_pct,2) AS attrition_pct,
 ROUND(o.overall_pct,2) AS overall_pct,
 ROUND(d.department_pct-o.overall_pct,2) AS difference_percentage_points
FROM departments d CROSS JOIN overall o ORDER BY difference_percentage_points DESC;
