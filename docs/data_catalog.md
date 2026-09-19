# Data Dictionary for Gold Layer

 ## 📝Overview
The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables**
and **fact tables** for specific business metrics.

 ----

1. **gold.dim_customers**
   
   - **Purpose**: Stores customer details enriched with geographical and demographical data.
   - **Columns**:
     | **Column Name** | **Data Type** | **Description** |
     | :--- | :--- | :--- |
     | `customer_key` | INT | Surrogate key identifying each unique customer record in the customer dimension table. |
     | `customer_id` | INT | Unique numerical identifier assigned to each unique customer. |
     | `customer_number` | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
     | `first_name` | NVARCHAR(50) | The customer's first name, as recorded in the system. |
     | `last_name` | NVARCHAR(50) | The customer's last name or surname or family name. |
     | `country` | NVARCHAR(50) | The country of residence for the customer (e.g.,'Australia', 'Germany'). |
     | `gender` | NVARCHAR(50) | The gender of the customer (e.g., 'Male', 'Female', 'n/a'). |
     | `marital_status` | NVARCHAR(50) | The marital status of the customer (e.g.,'Married', 'Single'). |
     | `birthdate` | DATE | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., '2001-12-03'). |
     | `create_date` | DATE | The date when the customer record was created in the system. |
     ----
  
2. **gold.dim_products**
   
   - **Purpose**: Provides information about the business products and their attributes.
   - **Columns**:
     | **Column Name** | **Data Type** | **Description** |
     | :--- | :--- | :--- |
     | `product_key` | INT | Surrogate key identifying each unique product record in the product dimension table. |
     | `product_id` | INT | Unique numerical identifier assigned to each product for internal tracking and referencing. |
     | `product_number` | NVARCHAR(50) | A structured alphanumeric code representing the product, often used for categorization or inventory. |
     | `product_name` | NVARCHAR(50) | Descriptive name of the product, including key details such as type, color, and size. |
     | `category_id` | NVARCHAR(50) | A unique identifier for the product's category, linking to its high-level classification. |
     | `category` | NVARCHAR(50) | The broader classification of the product (e.g., Bikes, Components) to group related items. |
     | `subcategory` | NVARCHAR(50) | A more detailed classification of the product within the category, such as product type. |
     | `maintenance_required` | NVARCHAR(50) | Indicates whether the product requires maintenance (e.g., 'Yes', 'No'). |
     | `cost` | INT | The cost or base price of the product, measured in monetary units. |
     | `product_line` | NVARCHAR(50) | The specific product line or series to which the product belongs (e.g., 'Road', 'Mountain', 'Other sales', 'Touring', 'n/a'). |
     | `start_date` | DATE | The date when the product became available for sale or use. |
     ---

3. **gold.fact_sales**
   
   - **Purpose**: Stores transactional sales data for analytical purposes.
   - **Columns**:
     | **Column Name** | **Data Type** | **Description** |
     | :--- | :--- | :--- |
     | `product_key` | INT | Surrogate key identifying each unique product record in the product dimension table. |
     | `product_id` | INT | Unique numerical identifier assigned to each product for internal tracking and referencing. |
     | `product_number` | NVARCHAR(50) | A structured alphanumeric code representing the product, often used for categorization or inventory. |
     | `product_name` | NVARCHAR(50) | Descriptive name of the product, including key details such as type, color, and size. |
     | `category_id` | NVARCHAR(50) | A unique identifier for the product's category, linking to its high-level classification. |
     | `category` | NVARCHAR(50) | The broader classification of the product (e.g., Bikes, Components) to group related items. |
     | `subcategory` | NVARCHAR(50) | A more detailed classification of the product within the category, such as product type. |
     | `maintenance_required` | NVARCHAR(50) | Indicates whether the product requires maintenance (e.g., 'Yes', 'No'). |
     | `cost` | INT | The cost or base price of the product, measured in monetary units. |
     | `product_line` | NVARCHAR(50) | The specific product line or series to which the product belongs (e.g., 'Road', 'Mountain', 'Other sales', 'Touring', 'n/a'). |
     | `start_date` | DATE | The date when the product became available for sale or use. |
   
