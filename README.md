# Data Warehouse Project

A comprehensive data warehouse solution implementing the **Medallion Architecture** pattern with three distinct layers: Staging, Clean, and Reporting. This project demonstrates best practices for data ingestion, transformation, and analytics-ready data delivery.

## 🏗️ Architecture Overview

This project implements a modern data warehouse architecture with three layers:

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  STAGING LAYER  │    │   CLEAN LAYER   │    │ REPORTING LAYER │
│                 │    │                 │    │                 │
│ • Raw data      │───▶│ • Cleaned data  │───▶│ • Analytics     │
│ • As-is format  │    │ • Transformed   │    │ • Star schema   │
│ • No changes    │    │ • Validated     │    │ • Business-ready│
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Layer Descriptions

- **Staging Layer**: Raw data ingestion from source systems (CRM & ERP)
- **Clean Layer**: Data cleaning, transformation, and business logic application
- **Reporting Layer**: Analytics-ready dimensional model with star schema

## 📁 Project Structure

```
├── data/
│   └── raw/
│       ├── source_crm/
│       │   ├── cust_info.csv          # Customer information
│       │   ├── prd_info.csv           # Product information
│       │   └── sales_details.csv      # Sales transactions
│       └── source_erp/
│           ├── CUST_AZ12.csv          # ERP customer data
│           ├── LOC_A101.csv           # Location data
│           └── PX_CAT_G1V2.csv        # Product categories
├── scripts/
└── tests/
```


## 📊 Data Sources

### CRM System
- **Customer Information**: Customer demographics, marital status, gender
- **Product Information**: Product details, costs, product lines
- **Sales Details**: Transaction data, quantities, prices

### ERP System
- **Customer Data**: Additional customer attributes, birth dates
- **Location Data**: Geographic information, country codes
- **Product Categories**: Hierarchical product classification

## 🔄 Data Flow

### Staging Layer (Raw Data)
- **Purpose**: Preserve original data without modifications
- **ETL Method**: **EL (Extract & Load)** - No transformations applied
- **Process**: Direct bulk insert from CSV files to staging tables
- **Data State**: Raw, unmodified source data
- **ETL Flow**:
  ```
  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
  │   EXTRACT   │    │    LOAD     │    │   STAGING   │
  │             │    │             │    │             │
  │ CSV Files   │───▶│ BULK INSERT │───▶│   Tables    │
  │             │    │             │    │             │
  │ • cust_info │    │ • No Trans- │    │ • Raw Data  │
  │ • prd_info  │    │   formations│    │ • As-Is     │
  │ • sales_... │    │ • Fast Load │    │ • Original  │
  └─────────────┘    └─────────────┘    └─────────────┘
  ```


### Clean Layer (Cleaned & Transformed)
- **Purpose**: Apply data quality rules and business transformations
- **ETL Method**: **ETL (Extract, Transform, Load)** - Full transformation pipeline
- **Process**: Extract from staging, apply transformations, load to clean tables
- **Data State**: Cleaned, standardized, business-ready data
- **ETL Flow**:
  ```
  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
  │   EXTRACT   │    │ TRANSFORM   │    │    LOAD     │
  │             │    │             │    │             │
  │   Staging   │───▶│ Business    │───▶│   Clean     │
  │   Tables    │    │ Logic &     │    │   Tables    │
  │             │    │ Data Quality│    │             │
  │ • Raw Data  │    │ • Standard- │    │ • Cleaned   │
  │ • As-Is     │    │   ization   │    │ • Validated │
  │ • Original  │    │ • Validation│    │ • Business- │
  │             │    │ • Cleaning  │    │   Ready     │
  └─────────────┘    └─────────────┘    └─────────────┘
  ```

### Reporting Layer (Analytics Ready)
- **Purpose**: Business-ready dimensional model
- **ETL Method**: **ELT (Extract, Load, Transform)** - Transform via views
- **Process**: Create views that transform clean data into dimensional model
- **Data State**: Analytics-optimized star schema
- **ETL Flow**:
  ```
  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
  │   EXTRACT   │    │    LOAD     │    │ TRANSFORM   │
  │             │    │             │    │             │
  │   Clean     │───▶│ Dimensional │───▶│   Views     │
  │   Tables    │    │   Model     │    │             │
  │             │    │   Structure │    │ • Star      │
  │ • Cleaned   │    │ • Tables    │    │   Schema    │
  │ • Validated │    │ • Keys      │    │ • Analytics │
  │ • Business- │    │ • Relations │    │ • Business- │
  │   Ready     │    │             │    │   Ready     │
  └─────────────┘    └─────────────┘    └─────────────┘
  ```

## 📄 License

This project is for educational and demonstration purposes.
