CREATE TABLE IF NOT EXISTS users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_username VARCHAR(50) NOT NULL UNIQUE,
  user_password VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS customers (
  customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  customer_phone VARCHAR(13) NOT NULL UNIQUE,
  customer_address VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS menus (
  menu_id INTEGER PRIMARY KEY AUTOINCREMENT,
  menu_name VARCHAR(50) NOT NULL,
  menu_price INT NOT NULL,
  menu_description VARCHAR(100) NULL,
  menu_img BLOB NULL
);

CREATE TABLE IF NOT EXISTS categories (
  category_id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS menu_category (
  menu_id INTEGER NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (menu_id) REFERENCES menus (menu_id),
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE IF NOT EXISTS orders (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_invoice VARCHAR(50) NOT NULL,
  order_total_price INT NOT NULL,
  order_date TEXT NOT NULL,
  customer_id INTEGER NOT NULL,
  create_by INTEGER NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (create_by) REFERENCES users (user_id)
);

CREATE TABLE IF NOT EXISTS order_details (
  order_details_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_detail_name VARCHAR(50) NOT NULL,
  order_detail_quantity INT NOT NULL,
  order_detail_date TEXT NOT NULL,
  order_id INTEGER NOT NULL,
  menu_id INTEGER NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (menu_id) REFERENCES menus (menu_id)
);


INSERT INTO users (user_username, user_password)
VALUES
('user1', 'root'),
('user2', 'root'),
('user3', 'root'),
('user4', 'root'),
('user5', 'root');


INSERT INTO customers (customer_name, customer_phone, customer_address)
VALUES
('customer1', '+628123456789', 'Jl. Pedang 1'),
('customer2', '+628123789456', 'Jl. Pedang 2'),
('customer3', '+628456789123', 'Jl. Pedang 3'),
('customer4', '+628789123456', 'Jl. Pedang 4'),
('customer5', '+628567891234', 'Jl. Pedang 5');



INSERT INTO menus (menu_name, menu_price)
VALUES
('menu1', 10000),
('menu2', 12000),
('menu3', 15000),
('menu4', 18000),
('menu5', 20000);

INSERT INTO categories (category_name)
VALUES
('category1'),
('category2'),
('category3'),
('category4'),
('category5');

INSERT INTO menu_category (menu_id, category_id)
VALUES
(1, 1),
(1, 2),
(2, 4),
(3, 3),
(4, 5);

INSERT INTO orders (order_invoice, order_total_price, order_date, customer_id, create_by)
VALUES
('INV/20190705001', 27000, '2019-07-05', 2, 1),
('INV/20190705002', 30000, '2019-07-05', 3, 1),
('INV/20190705003', 10000, '2019-07-05', 4, 1),
('INV/20190706001', 35000, '2019-07-06', 4, 1),
('INV/20190706002', 20000, '2019-07-06', 1, 1);

INSERT INTO order_details (order_detail_name, order_detail_quantity, order_detail_date, order_id, menu_id)
VALUES
('menu2', 1, '2019-07-05 08:23:01', 1, 2),
('menu3', 1, '2019-07-05 08:23:01', 1, 3),
('menu1', 1, '2019-07-05 10:17:13', 2, 1),
('menu5', 1, '2019-07-05 10:17:13', 2, 5),
('menu1', 1, '2019-07-05 13:57:58', 3, 1),
('menu3', 1, '2019-07-06 14:01:01', 4, 3),
('menu5', 1, '2019-07-06 14:01:01', 4, 5),
('menu1', 2, '2019-07-06 15:05:01', 5, 1);

SELECT o.order_id, o.order_date, c.customer_name, c.customer_phone, o.order_total_price, GROUP_CONCAT(od.order_detail_name) AS items
FROM orders o
JOIN customers c on c.customer_id = o.customer_id
JOIN order_details od on od.order_id = o.order_id
GROUP BY od.order_id;