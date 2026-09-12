# Employee Attrition Dashboard

A two-page Power BI project analyzing 1,470 employee records with Power Query, DAX measures, and interactive department and overtime filters.

![Dashboard preview](Attrition%20preview.png)

*Static preview of the data; interactive visuals are in the Power BI project.*

## Download and open

[Download the complete Power BI project](Employee%20Attrition%20Power%20BI.zip) — open the file and select Download raw file.

1. Extract the entire ZIP.
2. Open **Employee Attrition.pbip** in a current Power BI Desktop release.
3. Select **Home → Refresh** to load the embedded CSV snapshot.
4. Explore the overview and workforce comparison pages.

The ZIP includes editable report and semantic model folders, the original CSV, DAX measures, and detailed opening and refresh instructions.

## Snapshot findings

| Metric | Value |
|---|---:|
| Employee records | 1,470 |
| Records marked as left | 237 |
| Attrition share | 16.1% |
| Average tenure | 7.0 years |
| Attrition share: overtime Yes | 30.5% |
| Attrition share: overtime No | 10.4% |

## Report features

- Employee count, leavers, attrition share, and average tenure KPI cards.
- Department, overtime, job role, and tenure comparisons.
- Business travel and job satisfaction charts.
- Department detail with counts, share, tenure, and monthly income.

## Data and method

Source: supplied **WA_Fn-UseC_-HR-Employee-Attrition.csv**. All 35 original columns are preserved. Employee numbers are unique and no source cells are blank.

Attrition share = Yes records / all records in the selected group. No reporting period is supplied, so this is not an annual turnover rate. Comparisons show associations, not causes. Monthly income uses unspecified source currency units.

## Validation status

Source totals, uniqueness, blank cells, embedded data, JSON parsing, field references, and canvas bounds were checked programmatically. Native Power BI loading, DAX execution, rendering, and interactions have not yet been tested.

[Back to portfolio](../README.md)
