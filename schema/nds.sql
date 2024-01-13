CREATE DATABASE CQ_BI_13_NDS
GO

USE CQ_BI_13_NDS
GO

CREATE TABLE invoice(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nk_invoice_id VARCHAR(50) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    product_id INT NOT NULL,
    branch_id INT NOT NULL,
    payment_type_id INT NOT NULL,
    customer_type_id INT NOT NULL,
    gender BIT NOT NULL,
    quantity INT NOT NULL,
    tax_5_percent FLOAT,
    total FLOAT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    cogs FLOAT,
    gross_margin_percentage FLOAT,
    gross_income FLOAT,
    rating FLOAT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_quantity CHECK (quantity > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_tax_5_percent CHECK (tax_5_percent > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_total CHECK (total > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_time CHECK (time >= '10:00:00' and time <= '21:00:00')
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_cogs CHECK (cogs > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_gross_margin_percentage CHECK (gross_margin_percentage > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_gross_income CHECK (gross_income > 0)
GO

ALTER TABLE invoice
ADD CONSTRAINT CHK_rating CHECK (rating >= 0 and rating <= 10)
GO

------------------------------------------------------------------------------------

CREATE TABLE branch(
    branch_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_branch_code VARCHAR(10) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    city_name NVARCHAR(500) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

------------------------------------------------------------------------------------

CREATE TABLE payment_type(
    payment_type_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_payment_type_code VARCHAR(50) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    payment_type_name NVARCHAR(100),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

------------------------------------------------------------------------------------

CREATE TABLE customer_type(
    customer_type_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_customer_type_code VARCHAR(50) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    customer_type_name NVARCHAR(100),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

------------------------------------------------------------------------------------

CREATE TABLE product(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_product_id VARCHAR(50) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    product_line_id INT NOT NULL,
    unit_price FLOAT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

ALTER TABLE product
ADD CONSTRAINT CHK_unit_price CHECK (unit_price > 0)
GO

------------------------------------------------------------------------------------

CREATE TABLE product_line(
    product_line_id INT IDENTITY(1,1) PRIMARY KEY,
    nk_product_line_id VARCHAR(50) NOT NULL UNIQUE,
    source_id SMALLINT NOT NULL,
    product_line_name NVARCHAR(200) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BIT NOT NULL DEFAULT 0
)
GO

------------------------------------------------------------------------------------

ALTER TABLE invoice
ADD CONSTRAINT FK_invoice_branch_id_to_branch_branch_id
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
GO

ALTER TABLE invoice
ADD CONSTRAINT FK_invoice_payment_type_id_to_payment_type_payment_type_id
FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id)
GO

ALTER TABLE invoice
ADD CONSTRAINT FK_invoice_customer_type_id_to_customer_type_customer_type_id
FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
GO

ALTER TABLE invoice
ADD CONSTRAINT FK_invoice_product_id_to_product_product_id
FOREIGN KEY (product_id) REFERENCES product(product_id)
GO

ALTER TABLE product
ADD CONSTRAINT FK_product_product_line_id_to_product_line_product_line_id
FOREIGN KEY (product_line_id) REFERENCES product_line(product_line_id)
GO