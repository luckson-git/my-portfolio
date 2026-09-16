USE hr_attrition_portfolio;
-- Expected: 1470 rows, 1470 identifiers, 237 Yes, 1233 No.
SELECT COUNT(*) AS records, COUNT(DISTINCT EmployeeNumber) AS unique_ids,
 SUM(Attrition='Yes') AS leavers, SUM(Attrition='No') AS retained
FROM employee_snapshot;
-- Expected: zero rows; PK and NOT NULL also protect the import.
SELECT EmployeeNumber, COUNT(*) FROM employee_snapshot
GROUP BY EmployeeNumber HAVING COUNT(*) > 1;
-- Expected: zero invalid records.
SELECT COUNT(*) AS invalid_records FROM employee_snapshot
WHERE Attrition NOT IN ('Yes','No') OR OverTime NOT IN ('Yes','No')
 OR Age < 18 OR MonthlyIncome=0 OR YearsAtCompany > TotalWorkingYears
 OR YearsInCurrentRole > YearsAtCompany OR YearsWithCurrManager > YearsAtCompany
 OR YearsSinceLastPromotion > YearsAtCompany
 OR Education NOT BETWEEN 1 AND 5 OR WorkLifeBalance NOT BETWEEN 1 AND 4
 OR JobSatisfaction NOT BETWEEN 1 AND 4;
-- Constant fields are retained for fidelity but excluded from segmentation.
SELECT COUNT(DISTINCT EmployeeCount) AS employee_count_values,
 COUNT(DISTINCT Over18) AS over18_values,
 COUNT(DISTINCT StandardHours) AS standard_hours_values FROM employee_snapshot;
