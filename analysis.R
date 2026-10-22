# In-Depth Statistical Analysis and Predictive Modeling Using R
# Dataset: built-in mtcars
# Run in R or RStudio.

# 1. Explore the dataset
head(mtcars)
str(mtcars)
summary(mtcars)

# 2. Pearson correlation: vehicle weight and fuel efficiency
cor.test(mtcars$wt, mtcars$mpg)

# 3. Welch two-sample t-test: 4-cylinder vs 8-cylinder cars
cars4 <- mtcars$mpg[mtcars$cyl == 4]
cars8 <- mtcars$mpg[mtcars$cyl == 8]
t.test(cars4, cars8)

# 4. Multiple linear regression
model <- lm(mpg ~ wt + hp, data = mtcars)
summary(model)

# 5. Regression diagnostic plots
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

# 6. In-sample model evaluation
actual <- mtcars$mpg
predictions <- predict(model, newdata = mtcars)
RMSE <- sqrt(mean((actual - predictions)^2))
MAE <- mean(abs(actual - predictions))
R_squared <- cor(actual, predictions)^2

cat("In-sample RMSE:", RMSE, "\n")
cat("In-sample MAE:", MAE, "\n")
cat("Squared correlation:", R_squared, "\n")

# 7. Shapiro-Wilk residual normality test
shapiro.test(residuals(model))

# 8. Five-fold cross-validation
# Note: fold assignment affects individual fold RMSE values.
# This seeded implementation is reproducible in the same R environment.
set.seed(123)
folds <- sample(rep(1:5, length.out = nrow(mtcars)))
rmse_wt <- numeric(5)
rmse_wt_hp <- numeric(5)

for (k in 1:5) {
  train <- mtcars[folds != k, ]
  test <- mtcars[folds == k, ]

  fit_wt <- lm(mpg ~ wt, data = train)
  pred_wt <- predict(fit_wt, newdata = test)
  rmse_wt[k] <- sqrt(mean((test$mpg - pred_wt)^2))

  fit_wt_hp <- lm(mpg ~ wt + hp, data = train)
  pred_wt_hp <- predict(fit_wt_hp, newdata = test)
  rmse_wt_hp[k] <- sqrt(mean((test$mpg - pred_wt_hp)^2))
}

cat("Weight-only fold RMSE values:\n")
print(rmse_wt)
cat("Weight-only mean RMSE:", mean(rmse_wt), "\n")
cat("Weight + horsepower fold RMSE values:\n")
print(rmse_wt_hp)
cat("Weight + horsepower mean RMSE:", mean(rmse_wt_hp), "\n")

# 9. Optional: save full-data predictions
results <- data.frame(
  Car = rownames(mtcars),
  Actual_MPG = mtcars$mpg,
  Predicted_MPG = predictions,
  row.names = NULL
)
write.csv(results, "predictions.csv", row.names = FALSE)
