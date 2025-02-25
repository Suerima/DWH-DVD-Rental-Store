# Rental Sakila Project

## 1. Introduction
Sakila is a dataset used for learning and researching database management. Recognizing that building a data warehouse for the retail industry can help businesses optimize operations, this project focuses on constructing a data warehouse for a DVD rental store. The retail market is rapidly growing, and collecting and analyzing data is crucial for making strategic decisions and maximizing resources. A well-built data warehouse minimizes data fragmentation and inaccuracies while enhancing analytical and forecasting capabilities. Therefore, developing a data warehouse for the DVD rental business is necessary and meaningful in optimizing operations within this competitive market.

## 2. Dataset Information
The dataset is sourced from: [Kaggle - SQLite Sakila Sample Database](https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database).

After analyzing the dataset, the following tables were selected for the project:
- **Address**: Stores address information.
- **Actor**: Stores details of actors in a movie.
- **Customer**: Contains customer information.
- **Category**: Stores movie genres.
- **Date**: Stores rental date details.
- **Film**: Contains detailed information about movies.
- **Store**: Stores store-related information.
- **Staff**: Contains employee details.
- **Rental**: Stores transaction details, including rental date, return date, and rental prices.

## 3. Project Main Content

### 3.1 Building the Data Warehouse using SSIS
- Create **StageSakila** to store staging tables and **DWHSakila** to store Dimension (Dim) and Fact tables.
- Load data from Excel files into staging tables.
- Transfer data from staging tables into Dim and Fact tables.
- Establish foreign key relationships between Fact tables and Dim tables.

### 3.2 Building Cube and Querying using SSAS
- Create a **Data Source** from the **DWHSakila** database.
- Create a **Data Source View**.
- Build a cube, adding necessary measures and dimensions.
- Query business-related questions using SSAS, Pivot Table, and Power BI.

### 3.3 Developing Dashboards with Power BI
- **Revenue Report Dashboard**  
  [![dashboard-sales-reporting.png](https://i.postimg.cc/DZL56Pv2/dashboard-sales-reporting.png)](https://postimg.cc/mzZQ2M1q)
- **Key Factors Over Time Dashboard**  
  ![dashboard_sales_reporting](https://i.postimg.cc/W1sRkt7F/dashboard-list-top.png)
