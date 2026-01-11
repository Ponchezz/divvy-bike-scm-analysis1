# ============================================================
# SECTION C — EDA (Trip durations + demand timing)
# ============================================================

# C1) Trip duration histogram (0–100 mins)
p_duration <- ggplot(combined_data, aes(x = trip_duration_mins)) +
  geom_histogram(binwidth = 5, alpha = 0.7) +
  coord_cartesian(xlim = c(0, 100)) +
  labs(title = "Trip Duration Distribution (0–100 mins)", x = "Minutes", y = "Trips") +
  theme_minimal()

p_duration
ggsave("outputs/figures/trip_duration_hist_0_100.png", p_duration, width = 10, height = 6, dpi = 300)

# C2) Bike usage by hour
p_hour <- ggplot(combined_data, aes(x = hour)) +
  geom_bar(alpha = 0.7) +
  scale_x_continuous(breaks = 0:23) +
  labs(title = "Bike Usage by Hour of Day", x = "Hour (0–23)", y = "Trips") +
  theme_minimal()

p_hour
ggsave("outputs/figures/trips_by_hour.png", p_hour, width = 10, height = 6, dpi = 300)

# C3) Bike usage by day of week
p_dow <- ggplot(combined_data, aes(x = dow)) +
  geom_bar(alpha = 0.7) +
  labs(title = "Bike Usage by Day of Week", x = "Day of Week", y = "Trips") +
  theme_minimal()

p_dow
ggsave("outputs/figures/trips_by_dow.png", p_dow, width = 10, height = 6, dpi = 300)

# C4) Bike usage by month (Q1 only is implied by dataset)
p_month <- ggplot(combined_data, aes(x = month)) +
  geom_bar(alpha = 0.7) +
  labs(title = "Bike Usage by Month (Q1)", x = "Month", y = "Trips") +
  theme_minimal()

p_month
ggsave("outputs/figures/trips_by_month_q1.png", p_month, width = 10, height = 6, dpi = 300)