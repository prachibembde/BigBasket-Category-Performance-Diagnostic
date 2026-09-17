# BigBasket Category Performance Diagnostic

## Project overview
This capstone builds one deterministic BigBasket-style category diagnostic across SQL, spreadsheets, Tableau Public, and Python/Pandas. Part 1 creates the clean SQLite database and fixed monthly revenue CSV; Part 2 independently reconciles that exact CSV in a spreadsheet; Part 3 visualizes the same CSV in Tableau Public; and Part 4 cleans a separate deliberately messy raw export in Pandas and cross-validates the top category and supplier.

## Repository structure
```text
.
├── generate_data.py
├── bigbasket_capstone.db
├── orders_raw.csv
├── products.csv
├── verify.sql
├── 01_foundations.sql
├── 02_aggregation_joins.sql
├── 03_reporting.sql
├── monthly_category_revenue.csv
├── BigBasket_Capstone.xlsx
├── analysis.ipynb
├── ai_log.md
├── DATA_STORY.md
└── README.md
```

## How to regenerate the data
Run:
```bash
python3 generate_data.py
```
Do not change `random.seed(42)` or the fixed lists/weights. The generated database and raw exports are deterministic.

## Part 1 — SQL
- Foundational SQL: `01_foundations.sql`
- Aggregation/joins/HAVING: `02_aggregation_joins.sql`
- Reporting, CASE, monthly report, target variance: `03_reporting.sql`
- Verification: `verify.sql`
- Fixed Part 2/3 input: `monthly_category_revenue.csv`

Expected clean diagnostic checks:
- 31 products
- 50 customers
- 500 orders
- 6 category targets
- Delivered 434 / Cancelled 42 / Pending 24
- Monthly CSV: 36 rows
- Grand delivered revenue: INR 88,282

## Part 2 — Spreadsheet
Workbook: `BigBasket_Capstone.xlsx`

Required sheets:
1. `Monthly Data` — exact, unmodified CSV import.
2. `Category Targets` — fixed six category/target pairs.
3. `Pivot` — category pivot with SUM of `total_revenue` and `order_count`.
4. `Category Summary` — pivot references, XLOOKUP targets, variance, percentage variance, nested IF status, and reconciliation.

## Part 3 — Tableau Public
**Live Tableau Public dashboard:** PASTE YOUR PUBLISHED TABLEAU PUBLIC URL HERE

The dashboard should contain:
- Jan–Jun 2026 total monthly revenue line chart
- Descending category revenue bar chart
- Three-tier target-status colors
- Four KPI cards: Total Revenue, Total Delivered Orders, Average Order Value, Categories Meeting Target
- One visible filter affecting all dashboard worksheets
https://public.tableau.com/app/profile/prachi.bembde/viz/BigBasketCategoryPerformanceDiagnostic_17896652391240/BigBasketCategoryPerformanceDiagnostic
Data story: see `DATA_STORY.md`.

## Part 4 — Python/Pandas
Notebook: `analysis.ipynb`

The notebook loads the raw exports, inspects them, removes duplicate order IDs, cleans city/category text, excludes missing revenue from calculations, computes and caps IQR outliers, creates derived fields, merges products to obtain supplier, identifies the top category and supplier, cross-validates both against SQL, and produces three Matplotlib charts.

Expected Part 4 cleaning facts:
- Raw rows: 508
- Duplicate rows removed: 8
- Clean rows after deduplication: 500
- Missing amount values: 10
- Delivered non-null amount Q1: INR 90
- Q3: INR 275
- IQR: INR 185
- Upper fence: INR 552.50
- Rows capped: 16
- Top category: Household Essentials
- Top supplier: HomeEssentials Traders

## AI-assisted prompting
See `ai_log.md` for both required RCTCF prompts and concrete verification steps.

## Submission
Submit only the public GitHub repository link. Before submitting, replace the Tableau placeholder with the real public Tableau URL and confirm the repository is public and all required artifacts are committed.
