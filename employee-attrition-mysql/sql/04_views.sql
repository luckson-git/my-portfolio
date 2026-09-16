USE hr_attrition_portfolio;
CREATE VIEW employee_analysis AS
SELECT EmployeeNumber, Department, JobRole, Attrition, OverTime, MonthlyIncome,
 JobSatisfaction, YearsAtCompany,
 CASE WHEN YearsAtCompany < 2 THEN '01: 0-1 years'
      WHEN YearsAtCompany < 5 THEN '02: 2-4 years'
      WHEN YearsAtCompany < 10 THEN '03: 5-9 years'
      ELSE '04: 10+ years' END AS tenure_band
FROM employee_snapshot;
