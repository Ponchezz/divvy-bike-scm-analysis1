# ============================================================
# SECTION A — LOAD + STANDARDIZE SCHEMA
# ============================================================

# 2) Load data + clean column names
data_2019 <- readr::read_csv(path_2019) %>% janitor::clean_names()
data_2020 <- readr::read_csv(path_2020) %>% janitor::clean_names()

# 3) Standardize 2019 columns to match 2020 naming convention
data_2019 <- data_2019 %>%
  rename(
    ride_id = trip_id,
    started_at = start_time,
    ended_at = end_time,
    start_station_id = from_station_id,
    start_station_name = from_station_name,
    end_station_id = to_station_id,
    end_station_name = to_station_name,
    member_casual = usertype
  ) %>%
  mutate(
    # Standardize rider type values for 2019 only
    member_casual = recode(tolower(member_casual),
                           "subscriber" = "member",
                           "customer"   = "casual",
                           .default = tolower(member_casual))
  )

# 4) Standardize timestamps
data_2019 <- data_2019 %>%
  mutate(
    started_at = mdy_hm(started_at),
    ended_at   = mdy_hm(ended_at)
  )

data_2020 <- data_2020 %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at   = ymd_hms(ended_at)
  )

# 5) Keep only common columns (schema alignment)
common_columns <- intersect(names(data_2019), names(data_2020))
data_2019 <- data_2019 %>% select(all_of(common_columns))
data_2020 <- data_2020 %>% select(all_of(common_columns))

# 6) Standardize ride_id type (2019 numeric -> character)
data_2019 <- data_2019 %>%
  mutate(ride_id = sprintf("%X", as.integer(ride_id)))

data_2020 <- data_2020 %>%
  mutate(ride_id = as.character(ride_id))