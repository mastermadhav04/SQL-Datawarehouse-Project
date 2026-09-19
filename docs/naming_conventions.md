## 💡 General Principles

- **Naming Conventions**:
    Using ***snake_case***, with lowercase letters and underscores to separate words.
- **Language**: Use ***English*** for all names.
- Avoid SQL Reserved words as object names.

---
##  𝄜 Table/View Naming Conventions

1.  🟠 **Bronze Layer Rules**

   - All names must start with the source system name, and table names must match their original names without renaming.
   - **[source_system]_[entity]**
     - *E.g. 1)* 'crm_customer_info' -> Customer information from the CRM system.
     - *E.g. 2)* 'erp_px_cat_g1v2' -> Product categories information from the ERP system.
    
2.  ⚪ **Silver Layer Rules**
   
   - All names must start with the source system name, and table names must match their original names without renaming.
   - **[source_system]_[entity]**
     - *E.g. 1)* 'crm_customer_info' -> Customer information from the CRM system.
     - *E.g. 2)* 'erp_px_cat_g1v2' -> Product categories information from the ERP system.
    
3.  🟡 **Gold Layer Rules**
   
   - All views must use meaningful, user-friendly, and business-aligned names for all columns, starting with the category prefix.
   - **[category]_[entity]**
     - *E.g. 1)*  'dim_customers' -> Dimension table for customer data.
     - *E.g. 2)*  'fact_sales' -> Fact table containing sales transactions.
     - *E.g. 3)*  'agg_sales_monthly' -> Aggregated table containing data of monthly sales.

   -  **Glossary For the views inside the Gold layer**:
      | **Category** | **Description** | **Example** |
      |:--- | :--- | :--- |
      | dim | Dimension table containing the descriptive information. | 'dim_customers', 'dim_products' |
      | fact | Fact table containing the quantitative information . | 'fact_sales' |
      | agg | Aggregated table containing the summarized information. | 'agg_sales_monthly' |
   
---    
## 🏛️ Column Naming Conventions

1. **Surrogate Keys**
   - All primary keys in dimension tables must use the suffix ( ***_key*** ).
   - **[table_name]_key**
     - *E.g. 1)* 'customer_key' -> Surrogate key in the dim_customers table.
     - *E.g. 2)* 'product_key' -> Surrogate key in the dim_products table.
    
2. **Technical Columns (or Derived Columns)**
   - All technical columns must start with the prefix ( ***dwh_*** ), followed by a descriptive name indicating the column’s purpose.
   - **dwh_[column_name]**
     - *E.g.*, 'dwh_load_date' -> System-generated column used to store the date when the record was loaded.
    
---
## 📜 Stored Procedure

   - All stored procedures used for loading data must follow the naming pattern written as below.
   - **load_[layer]**  :  Here, [layer] represents the layer being loaded.
     - *E.g. 1)*  'load_bronze' -> Stored procedure for loading data into the Bronze layer.
     - *E.g. 2)*  'load_silver' -> Stored procedure for loading data into the Silver layer.
