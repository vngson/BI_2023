CREATE DATABASE CQ_BI_13_Stage
GO

USE CQ_BI_13_Stage
GO

CREATE TABLE branch(
    branch VARCHAR(10),
    city_name NVARCHAR(500) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_branch PRIMARY KEY (branch)
)
GO

CREATE TABLE product_line(
    product_line_id VARCHAR(50),
    product_line_name NVARCHAR(200) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_product_line PRIMARY KEY (product_line_id)
)
GO

CREATE TABLE product(
    product_id VARCHAR(50),
    product_line_id VARCHAR(50) NOT NULL,
    unit_price FLOAT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_product PRIMARY KEY (product_id)
)
GO

CREATE TABLE supermarket_sales(
    invoice_id NVARCHAR(50),
	branch VARCHAR(10) NOT NULL,
	customer_type NVARCHAR(50) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	product_id NVARCHAR(50) NOT NULL,
	quantity FLOAT NOT NULL,
	tax_5 FLOAT NOT NULL,
	total FLOAT NOT NULL,
	date DATETIME NOT NULL,
	time DATETIME NOT NULL,
	payment NVARCHAR(50) NOT NULL,
	cogs FLOAT NOT NULL,
	gross_margin_percentage FLOAT NOT NULL,
	gross_income FLOAT NOT NULL,
	rating FLOAT NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	is_deleted BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_supermarket_sales PRIMARY KEY (invoice_id)
)
GO