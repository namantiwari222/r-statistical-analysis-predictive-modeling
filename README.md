# In-Depth Statistical Analysis and Predictive Modeling Using R

## Project overview
This project explores the built-in `mtcars` dataset in R to study how vehicle weight and horsepower relate to fuel efficiency (miles per gallon, MPG). It includes exploratory data analysis, Pearson correlation, a Welch two-sample t-test, multiple linear regression, model evaluation, five-fold cross-validation, diagnostic plots, and a Shapiro-Wilk normality test.

## Objectives
- Explore the `mtcars` dataset.
- Measure the relationship between weight (`wt`) and MPG.
- Compare MPG for four-cylinder and eight-cylinder cars.
- Predict MPG using weight and horsepower.
- Evaluate prediction errors and compare models with five-fold cross-validation.
- Inspect regression diagnostics and residual normality.

## Technologies
- R
- RGui or RStudio
- Base R statistical functions

## Dataset
The built-in `mtcars` dataset has 32 observations. Key variables:
- `mpg`: miles per US gallon (target)
- `wt`: vehicle weight in 1,000 pounds
- `hp`: gross horsepower
- `cyl`: number of cylinders

No separate dataset download is required.

## Main results from the submitted R outputs
- Pearson correlation between `wt` and `mpg`: **-0.8676594** (p = **1.294e-10**).
- Mean MPG for four-cylinder cars: **26.66364**.
- Mean MPG for eight-cylinder cars: **15.10000** (Welch t-test p = **1.641e-06**).
- Multiple regression `mpg ~ wt + hp`: R-squared **0.8268**, adjusted R-squared **0.8148**.
- In-sample RMSE: **2.468854**; in-sample MAE: **1.901484**.
- Five-fold mean RMSE reported in the captured analysis: **3.146853** for `mpg ~ wt`, and **2.848123** for `mpg ~ wt + hp`.
- Shapiro-Wilk test on regression residuals: W = **0.92792**, p = **0.03427**.

The in-sample RMSE and MAE use the same observations used to fit the model, so they are not an unbiased estimate of performance on new data. The normality test indicates a statistically significant departure from residual normality at the 5% level. The dataset is small and historical, so results should be interpreted cautiously.

**Reproducibility note:** Cross-validation fold assignment affects the individual fold RMSE values. `analysis.R` includes a seeded five-fold implementation; its results may differ from the captured output if the original fold assignment was different. If you want exact numeric reproduction, use the exact fold assignment from the original analysis or update the report after running the script.

## How to run
1. Install R from the official R Project website.
2. Open `analysis.R` in RGui or RStudio.
3. Run the script.
4. Review the printed test/model summaries and the diagnostic plots.
5. The final section writes `predictions.csv` to the working directory.

## Repository structure
```text
r-statistical-analysis-predictive-modeling/
├── analysis.R
├── README.md
├── report/
│   └── Project_Report.docx
└── screenshots/
    ├── 01_dataset.png
    ├── 02_correlation.png
    ├── 03_t_test.png
    ├── 04_regression.png
    ├── 05_cross_validation.png
    ├── 06_model_evaluation_diagnostics.png
    ├── 07_normality_test.png
    ├── 08_dataset_summary.png
    └── 09_test_evaluation.png
```

## Limitations
- Only 32 historical car observations are available.
- The model uses only weight and horsepower as predictors.
- Correlation and regression do not establish causation.
- Cross-validation results may vary with fold assignment.
- Residual normality was rejected at the 5% significance level.

## Conclusion
The analysis finds a strong negative association between vehicle weight and MPG. Four-cylinder cars in this dataset have higher average MPG than eight-cylinder cars. The model using weight and horsepower explains about 82.68% of the in-sample variation in MPG, and the captured cross-validation results favor including horsepower.

## License
No license is specified. Add a license only if you intend to grant others permission to reuse the code or materials.
