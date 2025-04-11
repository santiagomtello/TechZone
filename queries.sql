--1
select *
from productos p 
where stock_disponible < 5

--2
SELECT 
    TO_CHAR(v.fecha, 'YYYY-MM') AS mes,
    SUM(v.cantidad * p.precio) AS total_ventas
FROM ventas v
JOIN ventasProductos vp ON v.id = vp.venta_id
JOIN productos p ON vp.producto_id = p.id
WHERE EXTRACT(MONTH FROM v.fecha) = 4
  AND EXTRACT(YEAR FROM v.fecha) = 2024
GROUP BY mes;

--3
SELECT 
    c.id,
    c.nombre,
    c.apellidos,
    COUNT(v.id) AS total_compras
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY total_compras ASC
LIMIT 1;


 --4
SELECT 
    p.nombre AS producto,
    SUM(v.cantidad) AS total_vendido
FROM ventasproductos vp
join ventas v on v.id = vp.venta_id   
JOIN productos p ON vp.producto_id = p.id
GROUP BY p.id, p.nombre
ORDER BY total_vendido DESC
LIMIT 5;

--5
SELECT 
    v.id,
    v.fecha,
    v.cantidad,
    c.nombre,
    c.apellidos
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
WHERE v.fecha BETWEEN DATE '2024-04-01' AND DATE '2024-04-03'
ORDER BY v.fecha;

--6
SELECT 
    c.id AS cliente_id,
    c.nombre,
    c.apellidos,
    c.email
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id 
    AND v.fecha >= CURRENT_DATE - INTERVAL '6 months'  
GROUP BY c.id
HAVING COUNT(v.id) = 0;

