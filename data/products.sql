create table categories (
    category_id int PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table products (
    product_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_url TEXT,
    product_url TEXT UNIQUE,
    stars DECIMAL(2,1) CHECK (stars >= 0 AND stars <= 5),
    reviews INT CHECK (reviews >= 0),
    price DECIMAL(10,2) NOT NULL,
    list_price DECIMAL(10,2),
    category_id int,
    is_best_seller BOOLEAN DEFAULT FALSE,
    bought_in_last_month INT CHECK (bought_in_last_month >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

create table customers (
    customer_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table orders (
    order_id int PRIMARY KEY,
    customer_id VARCHAR(36) NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


create table order_details (
    order_detail_id int PRIMARY KEY,
    order_id int NOT NULL UNIQUE,
    product_id VARCHAR(36) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_per_unit DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

create table payments (
    payment_id VARCHAR(36) PRIMARY KEY,
    payment_method VARCHAR(50) NOT NULL,
    order_id int NOT NULL UNIQUE,
    amount_paid DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Load values into postgresql
-- copy payments (payment_id,payment_method,order_id,amount_paid) from 'D:/My Works/Python Learning/Ecommerce Project/renamed/payments.csv' with (FORMAT csv, HEADER true);