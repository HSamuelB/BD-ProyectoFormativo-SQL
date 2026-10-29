-- =================================================================
-- SCRIPT DE CONSULTAS (03_queries.sql)
-- Base de datos: inventario_ventas
-- Mínimo requerido: 14 consultas analíticas y relacionales
-- =================================================================

USE inventario_ventas;

-- ----------------------------------------------------------------
-- 1. Consultar todos los usuarios activos del sistema
-- ----------------------------------------------------------------
SELECT id_usuario, nombre, usuario, rol 
FROM usuario 
WHERE estado = 'activo';

-- ----------------------------------------------------------------
-- 2. Listar todos los productos junto con el nombre de su categoría (JOIN básico)
-- ----------------------------------------------------------------
SELECT p.id_producto, p.nombre AS producto, c.nombre AS categoria
FROM producto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria;

-- ----------------------------------------------------------------
-- 3. Consultar el stock actual y precio de los productos agrupados por su lote
-- ----------------------------------------------------------------
SELECT l.id_lote, p.nombre AS producto, l.stock_actual, l.precio, l.estado
FROM lote l
INNER JOIN producto p ON l.id_producto = p.id_producto
ORDER BY l.stock_actual ASC;

-- ----------------------------------------------------------------
-- 4. Mostrar las órdenes de compra con la información de sus proveedores
-- ----------------------------------------------------------------
SELECT oc.id_orden, oc.fecha_pedido, oc.fecha_llegada, pr.nombre AS proveedor, pr.telefono
FROM orden_compra oc
INNER JOIN proveedor pr ON oc.id_proveedor = pr.id_proveedor;

-- ----------------------------------------------------------------
-- 5. Consultar las ventas realizadas indicando qué usuario (empleado/admin) las atendió
-- ----------------------------------------------------------------
SELECT v.id_venta, v.fecha_venta, u.nombre AS atendido_por, u.rol
FROM venta v
INNER JOIN usuario u ON v.id_usuario = u.id_usuario
ORDER BY v.fecha_venta DESC;

-- ----------------------------------------------------------------
-- 6. Obtener el detalle completo de los productos vendidos en cada transacción (Múltiples JOINs)
-- ----------------------------------------------------------------
SELECT vl.id_venta, p.nombre AS producto, vl.id_lote, vl.cantidad, vl.precio_momento, 
       (vl.cantidad * vl.precio_momento) AS subtotal
FROM venta_lote vl
INNER JOIN producto p ON vl.id_producto = p.id_producto;

-- ----------------------------------------------------------------
-- 7. Consultar los métodos de pago utilizados en las ventas y el monto pagado
-- ----------------------------------------------------------------
SELECT vmp.id_venta, mp.tipo AS metodo_pago, vmp.monto, vmp.fecha
FROM venta_metodo_pago vmp
INNER JOIN metodo_pago mp ON vmp.id_metodo = mp.id_metodo;

-- ----------------------------------------------------------------
-- 8. Consultar los lotes de productos que se encuentran en estado 'vencido'
-- ----------------------------------------------------------------
SELECT l.id_lote, p.nombre AS producto, l.stock_actual, l.fecha_vencimiento
FROM lote l
INNER JOIN producto p ON l.id_producto = p.id_producto
WHERE l.estado = 'vencido';

-- ----------------------------------------------------------------
-- 9. Generar alertas registradas indicando el tipo de alerta y el producto afectado
-- ----------------------------------------------------------------
SELECT a.id_alerta, a.tipo AS tipo_alerta, a.fecha, p.nombre AS producto, a.id_lote
FROM alerta a
INNER JOIN producto p ON a.id_producto = p.id_producto;

-- ----------------------------------------------------------------
-- 10. Consulta de agregación: Total de productos registrados por cada categoría
-- ----------------------------------------------------------------
SELECT c.nombre AS categoria, COUNT(p.id_producto) AS total_productos
FROM categoria c
LEFT JOIN producto p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre;

-- ----------------------------------------------------------------
-- 11. Consulta analítica: Cantidad de ventas realizadas por cada usuario
-- ----------------------------------------------------------------
SELECT u.nombre AS usuario, u.rol, COUNT(v.id_venta) AS total_ventas_atendidas
FROM usuario u
LEFT JOIN venta v ON u.id_usuario = v.id_usuario
GROUP BY u.id_usuario, u.nombre, u.rol;

-- ----------------------------------------------------------------
-- 12. Consulta con Subconsulta: Productos cuyo stock actual sea menor o igual al stock mínimo configurado
-- ----------------------------------------------------------------
SELECT p.id_producto, p.nombre, l.id_lote, l.stock_actual, l.stock_minimo
FROM lote l
INNER JOIN producto p ON l.id_producto = p.id_producto
WHERE l.stock_actual <= l.stock_minimo;

-- ----------------------------------------------------------------
-- 13. Uso de la vista creada: Consultar el total calculado de las ventas
-- ----------------------------------------------------------------
SELECT * 
FROM vista_total_venta 
ORDER BY total DESC 
LIMIT 20;

-- ----------------------------------------------------------------
-- 14. Uso de la vista de subtotales por lote para ver el valor exacto de los ítems vendidos
-- ----------------------------------------------------------------
SELECT * 
FROM vista_subtotal_venta_lote 
LIMIT 20;