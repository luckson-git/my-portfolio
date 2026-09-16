# Dataset

User-supplied `WA_Fn-UseC_-HR-Employee-Attrition.csv`: 1,470 records, 35 columns.

This file matches the structure and totals of the fictional IBM HR Analytics Employee Attrition & Performance dataset. The [dataset listing](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) describes fictional data created by IBM data scientists. It is not evidence about actual IBM employees. The local file's complete chain of custody has not been independently established.

SHA-256: `a5c31e38bd7fafc9bc333884eb181b06b41b8e5e488e8f7ccb27199fb3be7659`

The repository MIT license applies to project code; this third-party dataset retains its source terms. Consult the linked listing before reuse. No dates or currency metadata are supplied: income is shown in dataset units and attrition is a snapshot share, not annual turnover.

## Fields

| Column | SQL type | Observed distinct values |
|---|---|---:|
| Age | INT UNSIGNED | 43 |
| Attrition | VARCHAR(64) | 2 |
| BusinessTravel | VARCHAR(64) | 3 |
| DailyRate | INT UNSIGNED | 886 |
| Department | VARCHAR(64) | 3 |
| DistanceFromHome | INT UNSIGNED | 29 |
| Education | INT UNSIGNED | 5 |
| EducationField | VARCHAR(64) | 6 |
| EmployeeCount | INT UNSIGNED | 1 |
| EmployeeNumber | INT UNSIGNED | 1470 |
| EnvironmentSatisfaction | INT UNSIGNED | 4 |
| Gender | VARCHAR(64) | 2 |
| HourlyRate | INT UNSIGNED | 71 |
| JobInvolvement | INT UNSIGNED | 4 |
| JobLevel | INT UNSIGNED | 5 |
| JobRole | VARCHAR(64) | 9 |
| JobSatisfaction | INT UNSIGNED | 4 |
| MaritalStatus | VARCHAR(64) | 3 |
| MonthlyIncome | INT UNSIGNED | 1349 |
| MonthlyRate | INT UNSIGNED | 1427 |
| NumCompaniesWorked | INT UNSIGNED | 10 |
| Over18 | VARCHAR(64) | 1 |
| OverTime | VARCHAR(64) | 2 |
| PercentSalaryHike | INT UNSIGNED | 15 |
| PerformanceRating | INT UNSIGNED | 2 |
| RelationshipSatisfaction | INT UNSIGNED | 4 |
| StandardHours | INT UNSIGNED | 1 |
| StockOptionLevel | INT UNSIGNED | 4 |
| TotalWorkingYears | INT UNSIGNED | 40 |
| TrainingTimesLastYear | INT UNSIGNED | 7 |
| WorkLifeBalance | INT UNSIGNED | 4 |
| YearsAtCompany | INT UNSIGNED | 37 |
| YearsInCurrentRole | INT UNSIGNED | 19 |
| YearsSinceLastPromotion | INT UNSIGNED | 16 |
| YearsWithCurrManager | INT UNSIGNED | 18 |

`EmployeeNumber` identifies each row. `Attrition` and `OverTime` are Yes/No. `JobSatisfaction` runs from 1 (Low) to 4 (Very High), as documented in the source listing. `EmployeeCount`, `Over18`, and `StandardHours` are constants. Income quartiles use equal-count groups; tied income values can span quartiles. Tenure boundaries are explicit in the view.
