CREATE DATABASE projectmodun04;
USE projectmodun04;

CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    name_role VARCHAR(100)
);

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    email VARCHAR(100) UNIQUE,
    fullname VARCHAR(100),
    password VARCHAR(100),
    avatar TEXT,
    role_id INT,
    status BIT DEFAULT 1,
    age INT CHECK (age >= 1)
);

CREATE TABLE user_role (
    ur_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    user_id INT,
    FOREIGN KEY(role_id) REFERENCES role(role_id),
    FOREIGN KEY(user_id) REFERENCES user(user_id)
);

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name_product VARCHAR(255),
    category_id INT,
    description TEXT,
    unit_price INT,
    stock INT,
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

CREATE TABLE image (
    img_id INT AUTO_INCREMENT PRIMARY KEY,
    url_image TEXT,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);
create table like_product(
    lp_id int auto_increment primary key,
    user_id int,
    product_id INT,
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

CREATE TABLE cartItem (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(user_id) REFERENCES user(user_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);
CREATE TABLE orderdetail (
    orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES user(user_id)
);
CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    orderdetail_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(orderdetail_id) REFERENCES orderdetail(orderdetail_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

