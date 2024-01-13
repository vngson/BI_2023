CREATE DATABASE CQ_BI_13_DDS_TEST
GO

USE CQ_BI_13_DDS_TEST
GO

CREATE TABLE fact_purchase(
    product_id INT,
    branch_id INT,
    customer_type_id INT,
    payment_type_id INT,
    datetime_id INT,
    total_sold_products INT,
    total_purchase_times INT,
    total_income FLOAT,
    total_rating_score FLOAT,
    total_female_customers INT,

    CONSTRAINT PK_fact_purchase PRIMARY KEY (product_id, branch_id, customer_type_id, payment_type_id, datetime_id)
)
GO

CREATE TABLE dim_payment_type(
    payment_type_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_customer_type_code VARCHAR(50) NOT NULL UNIQUE,
    payment_type_name NVARCHAR(100)
)
GO

CREATE TABLE dim_customer_type(
    customer_type_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_customer_type_code VARCHAR(50) NOT NULL UNIQUE,
    customer_type_name NVARCHAR(100)
)
GO

CREATE TABLE dim_product(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_product_id VARCHAR(50) NOT NULL UNIQUE,
    product_line_id INT NOT NULL,
    unit_price FLOAT NOT NULL
)
GO

CREATE TABLE dim_product_line(
    product_line_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_product_line_id VARCHAR(50) NOT NULL UNIQUE,
    product_line_name NVARCHAR(200) NOT NULL
)
GO

CREATE TABLE dim_branch(
    branch_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_branch_code VARCHAR(10) NOT NULL UNIQUE,
    city_name NVARCHAR(500) NOT NULL
)
GO

CREATE TABLE dim_datetime(
    datetime_id INT IDENTITY(1,1) PRIMARY KEY,
    day_id INT,
    hour_number INT,

    CONSTRAINT CHK_dim_datetime_hour_number CHECK (hour_number >= 0 AND hour_number <= 23)
)
GO

CREATE TABLE dim_day(
    day_id INT IDENTITY(1,1) PRIMARY KEY,
    month_id INT,
    day_number INT,

    CONSTRAINT CHK_dim_day_day_number CHECK (day_number >= 1 AND day_number <= 31)
)
GO

CREATE TABLE dim_month(
    month_id INT IDENTITY(1,1) PRIMARY KEY,
    year_id INT,
    month_number INT,

    CONSTRAINT CHK_dim_month_month_number CHECK (month_number >= 1 AND month_number <= 12)
)
GO

CREATE TABLE dim_year(
    year_id INT IDENTITY(1,1) PRIMARY KEY,
    year_number INT,

    CONSTRAINT CHK_dim_year_year_number CHECK (year_number >= 1)
)
GO

ALTER TABLE fact_purchase
ADD CONSTRAINT FK_fact_purchase_product_id_dim_product_product_id
FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
GO

ALTER TABLE fact_purchase
ADD CONSTRAINT FK_fact_purchase_branch_id_dim_branch_branch_id
FOREIGN KEY (branch_id) REFERENCES dim_branch(branch_id)
GO

ALTER TABLE fact_purchase
ADD CONSTRAINT FK_fact_purchase_customer_type_id_dim_customer_type_customer_type_id
FOREIGN KEY (customer_type_id) REFERENCES dim_customer_type(customer_type_id)
GO

ALTER TABLE fact_purchase
ADD CONSTRAINT FK_fact_purchase_payment_type_id_dim_payment_type_payment_type_id
FOREIGN KEY (payment_type_id) REFERENCES dim_payment_type(payment_type_id)
GO

ALTER TABLE fact_purchase
ADD CONSTRAINT FK_fact_purchase_datetime_id_dim_datetime_datetime_id
FOREIGN KEY (datetime_id) REFERENCES dim_datetime(datetime_id)
GO

ALTER TABLE dim_datetime
ADD CONSTRAINT FK_dim_datetime_day_id_dim_day_day_id
FOREIGN KEY (day_id) REFERENCES dim_day(day_id)
GO

ALTER TABLE dim_day
ADD CONSTRAINT FK_dim_day_month_id_dim_month_month_id
FOREIGN KEY (month_id) REFERENCES dim_month(month_id)
GO

ALTER TABLE dim_month
ADD CONSTRAINT FK_dim_month_year_id_dim_year_year_id
FOREIGN KEY (year_id) REFERENCES dim_year(year_id)
GO

ALTER TABLE dim_product
ADD CONSTRAINT FK_dim_product_product_line_id_dim_product_line_product_line_id
FOREIGN KEY (product_line_id) REFERENCES dim_product_line(product_line_id)
GO