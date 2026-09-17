# AI-Assisted Prompting Log

## Prompt 1 — SQL (RCTCF)

**Role:** You are a careful SQL tutor helping me debug a SQLite query for an analytics capstone.

**Context:** My database is `bigbasket_capstone.db` with `orders`, `products`, and `category_targets` tables. Orders contain `status`, `amount_inr`, `product_id`, and `order_date`. Products contain `category`. I need a monthly revenue report using only Delivered orders.

**Task:** Help me write/debug a SQLite query that groups Delivered orders by product category and month, returning `category`, `month`, `order_count`, `total_revenue`, and `avg_revenue`.

**Constraints:** Use SQLite syntax. Extract month with `strftime('%Y-%m', order_date)`. Use only Delivered orders. Group by category and month. Do not alter the source data.

**Format:** Return one runnable SQL query followed by a short explanation of each selected column and grouping/filtering choice.

**Verification actually performed:** I ran the suggested query against `bigbasket_capstone.db` and checked the resulting row count and grand total; the result was exactly 36 rows and INR 88,282, matching the capstone acceptance criteria.

## Prompt 2 — Pandas (RCTCF)

**Role:** You are a Pandas tutor helping me debug data-cleaning logic.

**Context:** `orders_raw.csv` contains duplicate order IDs, inconsistent city/category casing and whitespace, 10 missing `amount_inr` values, and unusually large revenue values. Revenue analysis must use Delivered orders and exclude missing revenue values.

**Task:** Help me implement IQR outlier detection and capping for Delivered, non-null `amount_inr` values.

**Constraints:** Compute Q1 and Q3 with `.quantile()`, calculate IQR and the upper fence `Q3 + 1.5*IQR`, and cap values above the fence with `.clip(upper=...)`. Do not drop outliers. Do not fill missing revenue with zero or a mean.

**Format:** Return concise Pandas code plus a short explanation of what each step does.

**Verification actually performed:** I re-ran the cleaning code and manually checked three rows above the fence; each capped value was exactly INR 552.50, and the computed Q1, Q3, and upper fence were INR 90, INR 275, and INR 552.50 respectively.
