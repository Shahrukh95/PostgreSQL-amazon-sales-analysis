# Amazon Sales Analysis

## Introduction
This project is an analysis of an ecommerce dataset built with Mockaroo and [Amazon Products Dataset][amazon-products-dataset]. Data was pre-processed and cleaned in Python ('data_generator.ipynb'), and the analysis was performed in PostgreSQL.

## Features
- 1000 Products
- 400 Customers
- 1200 Orders
- Other details  

## Installation
To install the project, clone the repository and perform the following steps:

To build the dataset, first create a database with any name:
```
CREATE DATABASE amazon_sales;
```

Create tables using the 'products.sql' file in the '/data' folder. In Postgresql run:
```
\i {file_path}/products.sql
```

This will create all the tables with the required constraints. To populate the tables, refer to the csv files in the '/data' folder. Use the 'copy' command in postgresql to insert data into the tables f.e.
```
copy payments (payment_id,payment_method,order_id,amount_paid) from '{file_path}/payments.csv' with (FORMAT csv, HEADER true);
```
Repeat this step for all the csv files.

## Usage

Queries for analytics are given in the 'analytics.sql' file with outputs.
An ERD diagram is available as pdf.

## Contributing
If you would like to contribute to the project, please fork the repository and submit a pull request.


[amazon-products-dataset]: https://www.kaggle.com/datasets/aaronfriasr/amazon-products-dataset?select=amazon_categories.csv
