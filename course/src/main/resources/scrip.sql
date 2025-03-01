-- Criação das tabelas
CREATE TABLE IF NOT EXISTS public.tb_category (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.tb_user (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    name VARCHAR(255),
    password VARCHAR(255),
    phone VARCHAR(255),
    role SMALLINT CHECK (role BETWEEN 0 AND 2)
);

CREATE TABLE IF NOT EXISTS public.tb_order (
    id BIGSERIAL PRIMARY KEY,
    moment TIMESTAMP WITH TIME ZONE,
    order_status INTEGER,
    client_id BIGINT,
    CONSTRAINT fk_order_client FOREIGN KEY (client_id) REFERENCES public.tb_user(id)
);

CREATE TABLE IF NOT EXISTS public.tb_product (
    id BIGSERIAL PRIMARY KEY,
    description VARCHAR(255),
    img_url VARCHAR(255),
    name VARCHAR(255),
    price DOUBLE PRECISION
);

CREATE TABLE IF NOT EXISTS public.tb_order_item (
    price DOUBLE PRECISION,
    quantity INTEGER,
    product_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_item_product FOREIGN KEY (product_id) REFERENCES public.tb_product(id),
    CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES public.tb_order(id)
);

CREATE TABLE IF NOT EXISTS public.tb_payment (
    moment TIMESTAMP WITH TIME ZONE,
    order_id BIGINT PRIMARY KEY,
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES public.tb_order(id)
);

CREATE TABLE IF NOT EXISTS public.tb_product_category (
    product_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    CONSTRAINT fk_product_category_product FOREIGN KEY (product_id) REFERENCES public.tb_product(id),
    CONSTRAINT fk_product_category_category FOREIGN KEY (category_id) REFERENCES public.tb_category(id)
);

-- Inserção de dados apenas se não existirem
INSERT INTO public.tb_category (id, name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Computers'),
(4, 'Electronics'),
(5, 'Books'),
(6, 'Computers')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.tb_user (id, email, name, password, phone, role) VALUES
(1, 'mariobros@gmail.com', 'Mario Bros', '123456789', '567895645', 0),
(2, 'alex@gmail.com', 'Alex Green', '123456', '977777777', 2),
(4, 'user@admin.com', 'User', '123456789', '1111111', 0),
(5, 'maria@gmail.com', 'Maria Brown', '12345', '988888888', 1),
(6, 'user@user.com', NULL, '$2a$10$P1accqlKByqBvtc0nsdV5ey6/zqksn.TTrN9j/JutzaxTXZasdwtq', NULL, 2),
(7, 'admin@admin.com', NULL, '$2a$10$BHnoHKu8tqGO.AmQVeO2quJPBj7pYbF/RZz7MKgdqwvxWNePFD3l.', NULL, 0),
(8, 'customer@customer.com', NULL, '$2a$10$I9ej4ggfcSs/uVyA8mE3EOzx3lCtyGcqiZgiFm3HLTZhENr1YJapm', NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.tb_product (id, description, img_url, name, price) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur.', NULL, 'The Lord of the Rings', 90.5),
(2, 'Nulla eu imperdiet purus. Maecenas ante.', NULL, 'Smart TV', 2190),
(3, 'Nam eleifend maximus tortor, at mollis.', NULL, 'Macbook Pro', 1250),
(4, 'Donec aliquet odio ac rhoncus cursus.', NULL, 'PC Gamer', 1200),
(5, 'Cras fringilla convallis sem vel faucibus.', NULL, 'Rails for Dummies', 100.99),
(6, 'Lorem ipsum dolor sit amet, consectetur.', NULL, 'The Lord of the Rings', 90.5),
(7, 'Nulla eu imperdiet purus. Maecenas ante.', NULL, 'Smart TV', 2190),
(8, 'Nam eleifend maximus tortor, at mollis.', NULL, 'Macbook Pro', 1250),
(9, 'Donec aliquet odio ac rhoncus cursus.', NULL, 'PC Gamer', 1200),
(10, 'Cras fringilla convallis sem vel faucibus.', NULL, 'Rails for Dummies', 100.99)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.tb_order (id, moment, order_status, client_id) VALUES
(1, '2019-06-20 16:53:07-03', 1, 1),
(2, '2019-07-21 00:42:10-03', 2, 2),
(3, '2019-07-22 12:21:22-03', 4, 1),
(4, '2019-06-20 16:53:07-03', 1, 4),
(5, '2019-07-21 00:42:10-03', 2, 5),
(6, '2019-07-22 12:21:22-03', 4, 4)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.tb_order_item (price, quantity, product_id, order_id) VALUES
(90.5, 2, 1, 1),
(1250, 1, 3, 1),
(100.99, 2, 5, 3),
(90.5, 2, 6, 4),
(1250, 1, 8, 4),
(1250, 2, 8, 5),
(100.99, 2, 10, 6)
ON CONFLICT (order_id, product_id) DO NOTHING;

INSERT INTO public.tb_payment (moment, order_id) VALUES
('2019-07-21 01:42:10-03', 2),
('2019-07-21 01:42:10-03', 5)
ON CONFLICT (order_id) DO NOTHING;

INSERT INTO public.tb_product_category (product_id, category_id) VALUES
(1, 2),
(2, 1),
(2, 3),
(3, 3),
(4, 3),
(5, 2),
(6, 5),
(7, 4),
(7, 6),
(8, 6),
(9, 6),
(10, 5)
ON CONFLICT (product_id, category_id) DO NOTHING;


