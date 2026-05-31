CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    country VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    membership_tier VARCHAR(20),
    registration_date DATE,
    total_orders INT,
    total_spend_usd DECIMAL(10,2),
    avg_order_value_usd DECIMAL(10,2),
    days_since_last_purchase INT,
    preferred_category VARCHAR(100),
    preferred_device VARCHAR(50),
    preferred_payment_method VARCHAR(50),
    acquisition_channel VARCHAR(100),
    reviews_given INT,
    avg_review_score DECIMAL(3,2),
    returns_made INT,
    wishlist_items INT,
    newsletter_subscribed BOOLEAN,
    churned BOOLEAN
);


CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date DATE,
    year INT,
    month INT,
    quarter VARCHAR(5),
    day_of_week VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(100),
    unit_price_usd DECIMAL(10,2),
    quantity INT,
    subtotal_usd DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    discount_amount_usd DECIMAL(10,2),
    shipping_fee_usd DECIMAL(10,2),
    tax_pct DECIMAL(5,2),
    tax_amount_usd DECIMAL(10,2),
    total_amount_usd DECIMAL(10,2),
    payment_method VARCHAR(50),
    device_used VARCHAR(50),
    delivery_days INT,
    delivery_date DATE,
    order_status VARCHAR(50),
    returned BOOLEAN,
    customer_rating DECIMAL(3,2),
    session_duration_minutes DECIMAL(8,2),
    pages_viewed_before_purchase INT,
    is_repeat_customer BOOLEAN,
    
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE product_summary (
    category VARCHAR(100),
    product_name VARCHAR(255),
    total_orders INT,
    total_revenue_usd DECIMAL(12,2),
    avg_price DECIMAL(10,2),
    avg_rating DECIMAL(3,2),
    return_rate DECIMAL(5,2),
    avg_discount_pct DECIMAL(5,2),
    avg_delivery_days DECIMAL(5,2),

    PRIMARY KEY (category, product_name)
);

CREATE TABLE monthly_revenue (
    year INT,
    month INT,
    quarter VARCHAR(5),
    orders INT,
    revenue_usd DECIMAL(12,2),
    avg_order_value DECIMAL(10,2),
    avg_discount_pct DECIMAL(5,2),
    return_rate DECIMAL(5,2),
    unique_customers INT,
    new_customers INT,

    PRIMARY KEY (year, month)
);