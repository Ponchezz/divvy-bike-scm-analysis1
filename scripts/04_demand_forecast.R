# ============================================================
# SECTION D — DEMAND PATTERNS + BASELINE FORECASTING
# ============================================================

# D1) Trips by hour: 2019 vs 2020
demand_hour <- combined_data %>%
  count(year, hour, name = "trips")

p_hour_yoy <- ggplot(demand_hour, aes(x = hour, y = trips, group = year)) +
  geom_line() +
  geom_point() +
  labs(title = "Trips by Hour (Q1): 2019 vs 2020", x = "Hour", y = "Trips") +
  theme_minimal()

p_hour_yoy
ggsave("outputs/figures/trips_by_hour_yoy.png", p_hour_yoy, width = 10, height = 6, dpi = 300)

# D2) Trips by hour split by rider type
demand_hour_user <- combined_data %>%
  count(year, member_casual, hour, name = "trips")

p_hour_user <- ggplot(demand_hour_user, aes(x = hour, y = trips, color = member_casual)) +
  geom_line() +
  facet_wrap(~year) +
  labs(title = "Trips by Hour split by Rider Type", x = "Hour", y = "Trips", color = "Rider Type") +
  theme_minimal()

p_hour_user
ggsave("outputs/figures/trips_by_hour_user.png", p_hour_user, width = 10, height = 6, dpi = 300)

# D3) Baseline Poisson model (train 2019, test 2020)
hourly <- combined_data %>%
  mutate(hour_ts = floor_date(started_at, unit = "hour")) %>%
  count(year, hour_ts, member_casual, name = "trips") %>%
  mutate(
    hour  = hour(hour_ts),
    dow   = wday(hour_ts, label = TRUE, abbr = TRUE, week_start = 1),
    month = month(hour_ts, label = TRUE, abbr = TRUE)
  )

train <- hourly %>% filter(year == 2019)
test  <- hourly %>% filter(year == 2020)

model <- glm(trips ~ hour + dow + month + member_casual, family = poisson(), data = train)

test <- test %>%
  mutate(pred = predict(model, newdata = test, type = "response"),
         error = trips - pred)

accuracy <- test %>%
  summarise(
    MAE  = mean(abs(error), na.rm = TRUE),
    RMSE = sqrt(mean(error^2, na.rm = TRUE))
  )

accuracy
readr::write_csv(accuracy, "outputs/tables/forecast_accuracy.csv")

plot_df <- test %>%
  group_by(hour_ts) %>%
  summarise(trips = sum(trips), pred = sum(pred), .groups = "drop")

p_forecast <- ggplot(plot_df, aes(x = hour_ts)) +
  geom_line(aes(y = trips)) +
  geom_line(aes(y = pred), linetype = "dashed") +
  labs(title = "2020 Actual vs Predicted Hourly Demand (trained on 2019)", x = "Hour", y = "Trips") +
  theme_minimal()

p_forecast
ggsave("outputs/figures/forecast_actual_vs_pred.png", p_forecast, width = 11, height = 6, dpi = 300)