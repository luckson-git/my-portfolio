# Car Resale Price Prediction

An end-to-end regression workflow that estimates a vehicle's resale price in lakh using structured vehicle attributes.

## Business question

Can vehicle specifications and ownership history estimate a used car's resale price accurately enough to support market pricing decisions?

## Dataset and target

The capstone dataset contains **3,800 records** and **16 columns**. The model predicts `resale_price_lakh` from vehicle identity, specifications, price, age, mileage, ownership, and accident history. The source CSV is intentionally excluded from version control; place an authorized copy at `data/raw/car_prices.csv` before running the workflow.

### Input fields

`car_id`, `brand`, `model`, `variant`, `fuel_type`, `transmission`, `body_type`, `engine_cc`, `power_bhp`, `mileage_kmpl`, `ex_showroom_price_lakh`, `year`, `kilometers_driven`, `owner_count`, `accident_history`, `resale_price_lakh`

## Method

1. Validate required fields and remove the identifier from features.
2. Split data into 80% training and 20% testing data with a fixed random seed.
3. One-hot encode categorical fields and train a linear-regression baseline.
4. Evaluate holdout predictions with R², MAE, and RMSE.
5. Export an actual-versus-predicted diagnostic chart and a coefficient table.

The supplied notebook originally label-encoded categorical fields. This portfolio implementation uses one-hot encoding instead, avoiding an artificial ordinal relationship between vehicle categories.

## Capstone results

The original notebook reported the following results on its 20% test split:

| Metric | Result |
| --- | ---: |
| R² | 0.9426 |
| Mean absolute error | 0.7795 lakh |
| Root mean squared error | 1.1621 lakh |

These results are dataset-specific and should be revalidated whenever the data or model changes.

## Run locally

```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
pip install -r requirements.txt
python src/train.py --data data/raw/car_prices.csv --output-dir reports
```

## Outputs

The script writes:

- `reports/actual_vs_predicted.png` — holdout diagnostic chart
- `reports/coefficients.csv` — linear-model feature effects

## Original work

The supplied notebook and script are retained in `notebooks/` as source artifacts. The cleaned executable workflow lives in `src/train.py`.
