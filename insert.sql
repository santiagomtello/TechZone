
INSERT INTO proveedores (nombre, apellidos, email, telefono) VALUES
('Carlos', 'González Ruiz', 'carlosg@example.com', '555-1234'),
('María', 'López Fernández', 'marialf@example.com', '555-5678'),
('Pedro', 'Salinas Bravo', 'pedros@example.com', '555-6789'),
('Lucía', 'Torres Vega', 'luciat@example.com', '555-3456'),
('Antonio', 'Martín Cuenca', 'antoniom@example.com', '555-4321'),
('Elena', 'Campos Díaz', 'elenac@example.com', '555-8765'),
('Javier', 'Lara Gómez', 'javierl@example.com', '555-6543');


-- Vendedores
INSERT INTO vendedores (nombre, apellidos, email, telefono, fecha_contratacion) VALUES
('Ana', 'Pérez Soto', 'anap@example.com', '555-1111', '2022-05-15'),
('Luis', 'Ramírez Díaz', 'luisr@example.com', '555-2222', '2023-01-10'),
('Claudia', 'Mendoza Torres', 'claudiam@example.com', '555-3334', '2021-09-20'),
('Héctor', 'Morales Peña', 'hectorm@example.com', '555-4445', '2020-03-30'),
('Paula', 'Silva Rojas', 'paulas@example.com', '555-5556', '2022-07-18'),
('Rubén', 'Castro León', 'rubenc@example.com', '555-6667', '2023-11-02'),
('Natalia', 'Ortiz Varela', 'nataliao@example.com', '555-7778', '2024-01-22');


-- Clientes
INSERT INTO clientes (nombre, apellidos, email, telefono, fecha_nacimiento) VALUES
('Laura', 'Jiménez Mora', 'lauraj@example.com', '555-3333', '1990-06-25'),
('Jorge', 'Martínez Peña', 'jorgem@example.com', '555-4444', '1985-09-14'),
('Raúl', 'Garrido Sanz', 'raulg@example.com', '555-1212', '1992-03-12'),
('Carmen', 'Nieto Rico', 'carmenn@example.com', '555-3434', '1988-12-05'),
('Ismael', 'Vega Cruz', 'ismaelv@example.com', '555-5656', '1995-07-09'),
('Sofía', 'Fuentes del Río', 'sofiaf@example.com', '555-7878', '2000-11-30'),
('Valentina', 'Moreno Pastor', 'valentinam@example.com', '555-9090', '1999-04-17');


-- Categorías
INSERT INTO categorias (nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Juguetes'),
('Libros'),
('Deportes'),
('Alimentos');

-- Productos
INSERT INTO productos (nombre, categoria_id, precio, stock_disponible) VALUES
('Televisor 40"', 1, 399.99, 10),
('Camisa de algodón', 2, 25.50, 50),
('Lámpara de escritorio', 3, 45.00, 30),
('Robot de juguete', 4, 60.00, 20),
('Libro "Cien años de soledad"', 5, 18.90, 100),
('Balón de fútbol', 6, 29.99, 25),
('Caja de cereales', 7, 4.99, 80),
('Audífonos Bluetooth', 1, 59.99, 40),
('Chaqueta impermeable', 2, 75.00, 15);


-- ProductosProveedores
INSERT INTO ProductosProveedores (proveedor_id, producto_id) VALUES
(1, 1),
(2, 2),
(1, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(2, 8),
(3, 9);

-- Ventas
INSERT INTO ventas (cantidad, cliente_id, vendedor_id, fecha) VALUES
(2, 1, 1, '2024-03-01'),
(1, 2, 2, '2024-03-05'),
(3, 3, 3, '2024-03-10'),
(1, 4, 4, '2024-04-01'),
(2, 5, 5, '2024-04-02'),
(4, 6, 6, '2024-04-05'),
(1, 7, 7, '2024-04-08');


-- VentasProductos
INSERT INTO ventasProductos (venta_id, producto_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(6, 8),
(7, 9);

