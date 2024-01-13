CREATE DATABASE CQ_BI_13_metadata
GO

USE CQ_BI_13_metadata
GO

CREATE TABLE stage_etl_info (
    id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(500) UNIQUE,
    lset DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00'
)
GO

CREATE TABLE nds_etl_info (
    id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(500) UNIQUE,
    lset DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00'
)
GO

CREATE TABLE dds_etl_info (
    id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(500) UNIQUE,
    lset DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00'
)
GO

-- stage_etl_info
INSERT stage_etl_info (table_name)
VALUES ('supermarket_sales')
GO

INSERT stage_etl_info (table_name)
VALUES ('product_line')
GO

INSERT stage_etl_info (table_name)
VALUES ('product')
GO

INSERT stage_etl_info (table_name)
VALUES ('branch')
GO

-- nds_etl_info

INSERT nds_etl_info (table_name)
VALUES ('supermarket_sales')
GO

INSERT nds_etl_info (table_name)
VALUES ('payment_type')
GO

INSERT nds_etl_info (table_name)
VALUES ('customer_type')
GO

INSERT nds_etl_info (table_name)
VALUES ('product_line')
GO

INSERT nds_etl_info (table_name)
VALUES ('product')
GO

INSERT nds_etl_info (table_name)
VALUES ('invoice')
GO

INSERT nds_etl_info (table_name)
VALUES ('branch')
GO

-- dds_etl_info

INSERT dds_etl_info (table_name)
VALUES ('dim_branch')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_product_line')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_product')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_customer_type')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_payment_type')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_datetime')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_day')
GO


INSERT dds_etl_info (table_name)
VALUES ('dim_month')
GO

INSERT dds_etl_info (table_name)
VALUES ('dim_year')
GO

INSERT dds_etl_info (table_name)
VALUES ('fact_purchase')
GO