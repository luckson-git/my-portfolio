# Data Analytics Portfolio

A compact, GitHub-ready portfolio featuring two Python projects that demonstrate applied analytics, machine learning, API integration, relational storage, testing, and clear technical communication.

## Featured projects

| Project | Focus | Highlights |
| --- | --- | --- |
| [Car Price Prediction](car-price-prediction/) | Supervised machine learning | Predicts vehicle resale price from 3,800 vehicle records; benchmark achieved **R² = 0.9426**, **MAE = 0.7795 lakh**, and **RMSE = 1.1621 lakh** on a 20% holdout set. |
| [Weather Analytics App](weather-analytics-app/) | API, statistics, and SQLite | Retrieves historical daily weather observations from Open-Meteo, calculates summary statistics, and persists a run to SQLite. |

## Skills demonstrated

`Python` · `pandas` · `scikit-learn` · `data preprocessing` · `model evaluation` · `REST APIs` · `SQLite` · `SQLAlchemy` · `unit testing` · `data visualization`

## Repository structure

```text
data-analytics-portfolio/
├── car-price-prediction/       # Reproducible regression workflow
└── weather-analytics-app/      # API-to-database weather pipeline
```

## Notes for reviewers

The car-price model metrics above are reproduced from the supplied capstone notebook. The original dataset is not included, so the project provides a sample data schema and an executable training script that accepts a local CSV. The weather project makes a live request to the public Open-Meteo archive API when run.

## Getting started

Each project contains its own installation and execution instructions. Clone this repository, choose a project directory, and follow its README.

## License

This portfolio is available under the [MIT License](LICENSE).
