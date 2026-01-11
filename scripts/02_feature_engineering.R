# ============================================================
# SECTION B — FEATURE ENGINEERING + CLEANING
# ============================================================

# 7) Trip duration + filter unrealistic + add year
data_2019 <- data_2019 %>%
  mutate(
    trip_duration_mins = as.numeric(difftime(ended_at, started_at, units = "mins")),
    year = 2019
  ) %>%
  filter(trip_duration_mins >= 1, trip_duration_mins <= 1440)

data_2020 <- data_2020 %>%
  mutate(
    trip_duration_mins = as.numeric(difftime(ended_at, started_at, units = "mins")),
    year = 2020
  ) %>%
  filter(trip_duration_mins >= 1, trip_duration_mins <= 1440)

# 8) Combine data
combined_data <- bind_rows(data_2019, data_2020)

# 9) Time features (reused in EDA + forecasting)
combined_data <- combined_data %>%
  mutate(
    date  = as.Date(started_at),
    hour  = hour(started_at),
    dow   = wday(started_at, label = TRUE, abbr = TRUE, week_start = 1),
    month = month(started_at, label = TRUE, abbr = TRUE),
    is_weekend = dow %in% c("Sat", "Sun")
  )