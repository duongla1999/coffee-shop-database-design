# Coffee Shop Database Design and Implementation

Final project for the IBM Coursera course **Introduction to Relational Databases (RDBMS)**.

## Scenario

A New York-based coffee shop chain is expanding nationally and needs a centralized relational database to replace fragmented data spread across accounting software, supplier databases, POS systems, and spreadsheets.

As the Data Engineer, I designed and implemented a normalized relational database, created views for business partners, and migrated data into staging databases.

## Tools Used

- **PostgreSQL** + pgAdmin (ERD design, database creation, views)
- **MySQL** + phpMyAdmin (staging database imports)

## Project Tasks

| Task | Description | Deliverable |
|------|-------------|-------------|
| 1 | Identify entities from source data | `screenshots/Task1.png` |
| 2 | Identify sales transaction attributes | `screenshots/Task2.png` |
| 3 | Create ERD (sales_transaction + product tables) | `screenshots/Task3A.png`, `Task3B.png` |
| 4 | Normalize tables to 2NF (sales_detail, product_type) | `screenshots/Task4A.png`, `Task4B.png` |
| 5 | Define primary keys and FK relationships | `screenshots/Task5A.png`, `Task5B.png` |
| 6 | Generate SQL, create schema, load data | `screenshots/Task6A.png`, `Task6B.png` |
| 7 | Create `staff_locations_view`, export CSV | `screenshots/Task7.png` |
| 8 | Create `product_info_m-view` materialized view, export CSV | `screenshots/Task8.png` |
| 9 | Import staff locations CSV into MySQL `STAFF_LOCATIONS` DB | `screenshots/Task9.png` |
| 10 | Import product info CSV into MySQL `coffee_shop_products` DB | `screenshots/Task10.png` |

## Database Schema

### Entities

- **staff** — employee records from HQ spreadsheet
- **sales_outlet** — store location data from HQ spreadsheet
- **sales_transaction** — transaction header from POS system
- **sales_detail** — transaction line items (normalized from sales_transaction)
- **customer** — customer data from CRM system
- **product** — product catalog from supplier spreadsheet
- **product_type** — product categories (normalized from product)

### Relationships

```
sales_transaction  1──< sales_detail >──1  product
                                              │
                                              1
                                        product_type
```

- `sales_detail.transaction_id` → `sales_transaction.transaction_id`
- `sales_detail.product_id` → `product.product_id`
- `product.product_type_id` → `product_type.product_type_id`

## SQL Files

| File | Description |
|------|-------------|
| `sql/staff_locations_view.sql` | Task 7 — View for payroll company |
| `sql/product_info_m_view.sql` | Task 8 — Materialized view for marketing |
| `sql/GeneratedScript.sql` | Auto-generated DDL from pgAdmin ERD |
| `sql/CoffeeData.sql` | Sample data population script (IBM provided) |

## Exports

| File | Description |
|------|-------------|
| `exports/staff_locations_view.csv` | Staff locations exported from PostgreSQL view |
| `exports/product_info_m-view.csv` | Product info exported from materialized view |

## Data Sources

Based on IBM's [Coffee shop sample data](https://community.ibm.com/community/user/businessanalytics/blogs/steven-macko/2019/07/12/beanie-coffee-1113):

- Staff information (HQ spreadsheet)
- Sales outlet information (HQ spreadsheet)
- Sales data (POS system CSV)
- Customer data (CRM system CSV)
- Product information (supplier spreadsheet)
