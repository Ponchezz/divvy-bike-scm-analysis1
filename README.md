\# Bike Share Supply Chain Management (SCM) Analysis



\## Project Overview

This project analyzes bike share trip data from Divvy (Q1 2019 and Q1 2020) to assess how Supply Chain Management (SCM) strategies can optimize bike availability, rebalancing schedules, and financial performance.



The analysis covers key areas such as:

\- Temporal demand patterns (hour of day, day of week)

\- Rider segmentation (members vs casual)

\- Station-level risk (understock/overstock)

\- Financial impact (lost revenue from unmet demand, idle capital from excess inventory)



\## Problem Definition

How can the SCM department ensure timely and efficient purchase, distribution, and rebalancing of bikes to enhance customer satisfaction and revenue?



\## Data Description

\- \*\*Source\*\*: Divvy Bike Share, Q1 2019 and Q1 2020

\- \*\*Records\*\*: ~1M trip records

\- \*\*Key Features\*\*: trip ID, start/end times, station ID/name, rider type (member vs casual)

\- \*\*Missing Data\*\*: Station capacity and pricing data were unavailable, so operational proxies were used for financial analysis.



\## Methodology

The project follows these key steps:

1\. \*\*Data Cleaning\*\*: Standardize column names and ensure consistent formatting (timestamps, numeric identifiers).

2\. \*\*Feature Engineering\*\*: Create time-based features such as hour of day, day of week, and trip duration.

3\. \*\*Exploratory Data Analysis (EDA)\*\*: Understand trip durations, demand trends, and identify peak hours and stations.

4\. \*\*Demand Forecasting\*\*: Build a simple Poisson regression model to predict hourly demand patterns.

5\. \*\*Rebalancing Analysis\*\*: Calculate station-level imbalance (net flow) and identify sources/sinks.

6\. \*\*Financial Impact\*\*: Estimate missed demand (lost revenue) and excess bike-hours (idle capital).

7\. \*\*Risk Classification\*\*: Classify stations into SCM categories based on their understock/overstock behavior.



\## Key Findings

\- \*\*Peak Demand\*\*: High bike usage occurs during weekday commuting hours (7–9 AM and 4–6 PM).

\- \*\*Rider Segmentation\*\*: Members drive predictable demand, whereas casual riders create more variable demand.

\- \*\*Station Imbalance\*\*: A small subset of stations accounts for a disproportionate share of imbalance. 

\- \*\*Financial Impact\*\*: Imbalance correlates with lost revenue and idle capital. High-risk stations require targeted interventions.



\## SCM Recommendations

\- \*\*Rebalancing\*\*: Schedule rebalancing before peak commute hours (pre-morning and pre-evening rush).

\- \*\*Station Segmentation\*\*: Identify and prioritize chronic sinks (understock) and sources (overstock).

\- \*\*Flexible Strategy for Casual Riders\*\*: Adapt inventory strategies for more variable, casual-driven demand.

\- \*\*Financial Focus\*\*: Prioritize stations with the highest missed demand (lost revenue) and excess bike-hours (idle capital).



\## Tools Used

\- \*\*R\*\*: tidyverse, lubridate, janitor, ggplot2

\- \*\*GitHub\*\* for version control

\- \*\*Kaggle\*\* for interactive analysis and dataset hosting



\## Outputs

\- \*\*Visualizations\*\*: Plots showing trip durations, demand by hour/day/month, and imbalance heatmaps.

\- \*\*Tables\*\*: CSVs of station risk (understock/overstock), financial impact (missed revenue, idle inventory).

\- \*\*PowerPoint\*\*: Executive summary of findings and SCM recommendations.



\## Next Steps

\- Incorporate station capacity data if available.

\- Explore predictive rebalancing models.

\- Extend analysis to full-year seasonality and fine-tune forecasts.



\## License

This project is licensed under the MIT License - see the \[LICENSE](LICENSE) file for details.


## Kaggle Notebook

Check out the [Kaggle Notebook](https://www.kaggle.com/code/paulkamande/multi-node-inventory-rebalancing-demand-forecast) for interactive analysis and visualizations.



