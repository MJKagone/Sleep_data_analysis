# This was a personal project of mine to revise for a statistics exam. I used R to analyze the effect of my daily activity score (percentage-based) on the following night's sleep score (0-100) as provided by a Polar Ignite 3 fitness watch.

# The data:

activity_scores = c(171, 56, 121, 16, 48, 36, 158, 22, 68, 21, 78, 35, 52, 132, 41, 27, 21, 79, 54, 32, 157, 41, 151, 61, 10, 49, 32, 204, 101, 75, 16, 52, 33, 187, 95, 120, 63, 27, 124, 74, 138, 72, 31, 80, 84, 38, 59, 69, 146, 71)

sleep_scores = c(83, 73, 63, 69, 70, 76, 85, 75, 59, 58, 74, 77, 63, 77, 71, 54, 64, 54,  73, 69, 65, 74, 70, 69, 62, 75, 75, 74, 61, 56, 72, 72, 61, 71, 71, 66, 64, 81, 79, 76, 77, 77, 55, 52, 72, 66, 71, 71, 62, 86)

activity_scores_scaled = activity_scores / length(activity_scores)

sleep_scores_scaled = sleep_scores / length(sleep_scores)

# Fitting a linear model to the data:

model = lm(sleep_scores ~ activity_scores)
model_scaled = lm(sleep_scores_scaled ~ activity_scores_scaled)

# Plotting the data:

par(mfrow=c(2,1))

plot(sleep_scores ~ activity_scores, main = "Raw data", xlab = "Activity score", ylab = "Sleep score")
abline(model)

plot(sleep_scores_scaled ~ activity_scores_scaled, main = "Scaled data", xlab = "Activity score", ylab = "Sleep score", xlim = c(0,4), ylim = c(0,4))
abline(model_scaled)

# Analysis of the model:

summary(model)

# The R-squared value is 0.04488, which means that the model explains 4.5 % of the variance in the data. The p-value is 0.1397, so the model is not statistically significant.

confint(model)

# The 95 % confidence interval for the slope is [-0.012, 0.082] and includes 0, so we can't be certain that increasing the activity score has a positive effect on the sleep score, even though graphically it does seem to be the case.

# Conclusion:

# There is not enough evidence to conclude that increasing my daily activity score has a positive effect on the following night's sleep score. More data is required for a more accurate analysis. If additional data does not support a positive correlation, I can think of three possible conclusions: 1) the claim that activity improves sleep quality is bullsh*t, 2) Polar's fitness watch is not very accurate, or 3) I am stressing my body too much after having just started working out and the results would be different had I been as active for a longer period of time.



