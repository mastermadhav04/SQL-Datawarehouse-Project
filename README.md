# SQL-Datawarehouse & Analytics Project

🚀 Welcome to the **SQL-Datawarehouse & Analytics Project** repository! 🚀
This project demonstrates a comprehensive data warehousing and analytics solution, by building a data warehouse to generate actionable insights. Designed as a portfolio project highlighting industry best practices in data engineering and analytics.

----
##  📖 Project Overview
This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
3. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

---
## 📋 Project Requirements 

### 1. Building the Data Warehouse (Data Engineering)

#### Objective 
To develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Data Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: No historization i.e. Focus on the latest dataset only.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytical teams.

----

### 2. BI: Analytics & Reporting (Data Analytics) 

#### Objective 
To develop SQL-based analytics to deliver detailed insights into:
- **Customer Behaviour**
- **Product Performance**
- **Sales Trends**

These insights will empower stakeholders with key business metrics, enabling strategic decision-making.

## -> (For now, only building the Datawarehouse, not doing the Analytics & Reporting part)
---
## 🌉 Data Architecture
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold layers**:
<img width="1250" height="667" alt="Data_Architecture_diagram" src="https://github.com/user-attachments/assets/41463ccc-da4c-4eff-94c2-99e5a76d2de4" />
1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleaning, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema further required for reporting and analytics.

---
## ✨ About Me
Hi there ! I am **Madhav Agrawal** , I am an IITian and enthusiastic person to know about data. So this was my first project by which I started learning about data and built it with the help of a tutorial by **Data With Baraa**.
Hoping to learn much from this project and start building my own projects/ideas from scratch to a beautiful end..
