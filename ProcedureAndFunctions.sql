CREATE OR REPLACE FUNCTION registrar_venta(
    p_cliente_id INT,
    p_vendedor_id INT,
    p_productos_ids INT[], 
    p_cantidades INT[],     
    p_fecha DATE DEFAULT CURRENT_DATE
) 
RETURNS VOID AS $$
DECLARE
    v_venta_id INT;
    v_producto_id INT;
    v_cantidad INT;
    v_precio DECIMAL(10, 2);
    v_stock_disponible INT;
    i INT;
BEGIN

    -- Verificar que el cliente exista
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE id = p_cliente_id) THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', p_cliente_id;
    END IF;


    -- Insertar la venta en la tabla de ventas
    INSERT INTO ventas (cliente_id, vendedor_id, fecha)
    VALUES (p_cliente_id, p_vendedor_id, p_fecha)
    RETURNING id INTO v_venta_id;  


    -- Verificar stock y registrar los productos vendidos en la tabla ventasProductos
    FOR i IN 1..array_length(p_productos_ids, 1) LOOP
        v_producto_id := p_productos_ids[i];
        v_cantidad := p_cantidades[i];

        -- Obtener el precio y el stock disponible del producto
        SELECT precio, stock_disponible INTO v_precio, v_stock_disponible
        FROM productos
        WHERE id = v_producto_id;

        -- Verificar que haya suficiente stock
        IF v_cantidad > v_stock_disponible THEN
            RAISE NOTICE 'No hay suficiente stock para el producto ID %: Stock disponible es %',
                v_producto_id, v_stock_disponible;
            RAISE EXCEPTION 'Venta no procesada debido a stock insuficiente para el producto ID %.', v_producto_id;
        END IF;

        -- Insertar en la tabla ventasProductos
        INSERT INTO ventasProductos (venta_id, producto_id, cantidad)
        VALUES (v_venta_id, v_producto_id, v_cantidad);

        -- Actualizar el stock del producto
        UPDATE productos
        SET stock_disponible = stock_disponible - v_cantidad
        WHERE id = v_producto_id;
    END LOOP;
        
END;
$$ LANGUAGE plpgsql;
