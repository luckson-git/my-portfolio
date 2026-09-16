# Employee Attrition Analysis with MySQL

An HR analytics case study using 1,470 fictional employee records to examine how attrition differs by department, overtime, tenure, job satisfaction, and income.

## Findings

- 237 of 1,470 employees are marked as having left: **16.12% snapshot attrition share**.
- Overtime group: **30.53%** (127 / 416); no-overtime group: **10.44%** (110 / 1,054). The difference is **20.09 percentage points**, using unrounded rates.
- These descriptive associations can guide further questions about workload and retention. They do not establish causes or justify decisions about individual employees.

## Run in MySQL

Requirements: MySQL **8.0.16+** (enforced CHECK constraints, CTEs, window functions). Python is optional, only for regenerating the import. No Python packages are required.

1. Clone this repository and open a terminal in `employee-attrition-mysql`.
2. Connect with `mysql --default-character-set=utf8mb4 -u YOUR_USER -p` using an account allowed to create a project database.
3. Run the following commands in the MySQL client, in order:

```sql
source sql/01_schema.sql
source sql/02_import.sql
source sql/03_data_quality.sql
source sql/04_views.sql
source sql/05_analysis.sql
```

In MySQL Workbench, open and execute the same five files in that order. The import uses regular INSERT statements, so LOCAL INFILE is unnecessary. Scripts create a dedicated `hr_attrition_portfolio` database. They do not drop existing databases. If that name exists, stop and choose a new database name consistently in all scripts. Import once: duplicate primary keys deliberately prevent silent double counting. Views and analysis can then be queried repeatedly.

To regenerate `02_import.sql` from the CSV, run `python scripts/generate_import.py` before importing.

## Design and SQL skills

One row represents one employee in a snapshot. `EmployeeNumber` is the primary key. A typed InnoDB table preserves all 35 source columns, with NOT NULL and validity constraints. The `employee_analysis` view exposes the analysis fields and explicit tenure bands. A single snapshot table avoids inventing relationships or history absent from the source.

Ten documented queries demonstrate conditional aggregation, CASE, GROUP BY, CTEs, DENSE_RANK, NTILE, views, and a CROSS JOIN comparing department rates with the overall rate. Every rate includes its employee count and leaver count where applicable. Role rankings retain small groups so reviewers can assess sample size. Quartiles may split tied incomes and do not adjust for job level or tenure.

| File | Purpose |
|---|---|
| `sql/01_schema.sql` | Database, table, primary key, constraints |
| `sql/02_import.sql` | Transactional import of all source rows |
| `sql/03_data_quality.sql` | Counts, duplicate, domain, tenure, and constant-field checks |
| `sql/04_views.sql` | Reusable analysis view and tenure bands |
| `sql/05_analysis.sql` | Ten business analysis queries |
| `results/` | Actual MySQL query outputs in TSV format |
| `data/README.md` | Provenance, source hash, and column inventory |

## Validation

Executed the schema, import, quality checks, view, and all ten analysis queries on MySQL 8.0.44. Compared all **51,450 imported cells** with the original CSV. Independently reconciled overview, department, overtime, and satisfaction counts/rates using Python. There are 1,470 unique employee identifiers, no missing source cells, and zero invalid records from the SQL quality check. Constant fields are excluded from analysis. Results are checked-in MySQL outputs, not fabricated examples.

## Interpretation and source

Attrition share = records with `Attrition = 'Yes'` / all records in that group. The data has no reporting period or departure dates, so this is **not an annual turnover rate**. Income uses source units because currency is unspecified. There are no causal estimates or predictive model claims.

The [IBM HR Analytics dataset listing](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) describes fictional data. See [data notes](data/README.md) for attribution, provenance limits, and terms. Code is covered by the repository MIT license; third-party data retains its own source terms.

[MySQL script execution documentation](https://dev.mysql.com/doc/refman/8.0/en/mysql-batch-commands.html)
