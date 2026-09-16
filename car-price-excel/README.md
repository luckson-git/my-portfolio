# Car Price Analysis in Excel

An Excel analysis of 3,800 Tata car records across seven models. This project complements the Python prediction capstone with an interactive workbook for exploring resale prices.

[Download the workbook](Car%20Price%20Analysis.xlsx) and open it in Microsoft Excel. No macros or external data connections are required.

## Explore the workbook

- **Dashboard:** choose fuel type and transmission in the yellow dropdown cells. Counts, averages, model comparisons, vehicle-year comparisons, and two native Excel charts update through formulas.
- **Cars:** all 3,800 source records and 16 original fields, plus vehicle age, price gap, and price gap percentage formulas. Table filters and frozen headers support inspection.
- **Guide:** definitions, limitations, maintenance instructions, and an editable reference year of 2026.

## Findings at the default filters

| Measure | Value |
|---|---:|
| Vehicles | 3,800 |
| Mean resale price | 7.58 lakh |
| Mean price gap percentage | 32.1% |
| Mean distance driven | 48,849 km |

Safari has the highest model mean resale price (15.07 lakh), while Tiago has the lowest (4.37 lakh). These comparisons are descriptive and do not control for age, variant, condition, or distance driven.

## Excel techniques

Excel tables, table filters, dropdown validation, COUNTIFS, SUMIFS, IF, cross-sheet formulas, conditional formatting, freeze panes, and native formula-linked charts. Summary tables use formulas rather than PivotTables. There are no slicers or predictive models in this workbook.

## Data and interpretation

The embedded data comes from `tata_car_price_prediction_dataset.csv`, located from the user-provided car capstone. Its 3,800 rows, 16 column names, and initial records match the notebook output. The original publisher, sampling method, and source license have not been verified. Treat the data as an educational sample, not a representative market survey. Third-party data is not relicensed under the repository's code license.

Prices are recorded in lakh (100,000 source currency units); currency is not explicitly stated in the CSV. Price gap is ex-showroom price minus resale price. It is a depreciation proxy, not historical realized depreciation or an annual rate. The mean gap percentage is the average of individual record percentages. Vehicle age uses the editable reference year, not a verified observation date. All records are Tata, so brand comparisons are unavailable.

## Validation and maintenance

Checked record count and unique identifiers, reconciled the overall mean resale price with the CSV, tested a filter combination, scanned formula errors, and visually reviewed all three sheets. The XLSX archive contains two native charts. Native Excel application rendering has not been independently tested.

Dashboard formulas cover the supplied 3,800 records. To add rows, extend formula ranges and category lists as described in Guide. Cars table filters do not change the Dashboard; use its own dropdowns.
