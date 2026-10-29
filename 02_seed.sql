-- ================================================================
-- SCRIPT DE POBLADO DE DATOS DE PRUEBA (13,318 REGISTROS EN TOTAL)
-- Base de datos: inventario_ventas
-- ================================================================

USE `inventario_ventas`;

-- Deshabilitar verificaciones temporalmente para inserción óptima
SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- ----------------------------------------------------------------
-- 1. TABLA: metodo_pago (2 registros)
-- ----------------------------------------------------------------
INSERT INTO `metodo_pago` (`id_metodo`, `tipo`) VALUES
(1, 'efectivo'),
(2, 'nequi');

-- ----------------------------------------------------------------
-- 2. TABLA: categoria (10 registros)
-- ----------------------------------------------------------------
INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Lácteos y Huevos'),
(2, 'Bebidas y Refrescos'),
(3, 'Abarrotes y Granos'),
(4, 'Snacks y Galletas'),
(5, 'Aseo Personal'),
(6, 'Limpieza del Hogar'),
(7, 'Carnes y Embutidos'),
(8, 'Panadería y Pastelería'),
(9, 'Frutas y Verduras'),
(10, 'Mascotas');

-- ----------------------------------------------------------------
-- 3. TABLA: usuario (10 registros)
-- ----------------------------------------------------------------
INSERT INTO `usuario` (`id_usuario`, `nombre`, `usuario`, `contraseña`, `rol`, `estado`) VALUES
(1, 'Administrador Principal', 'admin', '$2y$10$e8T1I...hashdemo', 'admin', 'activo'),
(2, 'Carlos Mendoza', 'cmendoza', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(3, 'Laura Restrepo', 'lrestrepo', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(4, 'Andrés Gómez', 'agomez', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(5, 'Mariana Silva', 'msilva', '$2y$10$e8T1I...hashdemo', 'admin', 'activo'),
(6, 'Diego Torres', 'dtorres', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(7, 'Sofia Vargas', 'svargas', '$2y$10$e8T1I...hashdemo', 'empleado', 'inactivo'),
(8, 'Juan Camilo Pérez', 'jperez', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(9, 'Valentina Ríos', 'vrios', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo'),
(10, 'Felipe Castro', 'fcastro', '$2y$10$e8T1I...hashdemo', 'empleado', 'activo');

-- ----------------------------------------------------------------
-- 4. TABLA: proveedor (20 registros)
-- ----------------------------------------------------------------
INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `correo`) VALUES
(1, 'Distribuidora Alpina S.A.', '3101234567', 'contacto@alpina.com'),
(2, 'Compañía Nacional de Chocolates', '3119876543', 'ventas@chocolates.com.co'),
(3, 'Postobón S.A.', '3155551234', 'pedidos@postobon.com'),
(4, 'Bavaria & CIA', '3187654321', 'servicio@bavaria.co'),
(5, 'Unilever Colombia', '3001112233', 'proveedores@unilever.com'),
(6, 'Grupo Nutresa', '3124445566', 'atencion@nutresa.com'),
(7, 'Colanta Cooperativa', '3147778899', 'ventas@colanta.com.co'),
(8, 'Procter & Gamble', '3169990011', 'contacto@pg.com'),
(9, 'Nestlé de Colombia', '3172223344', 'distribucion@nestle.com.co'),
(10, 'Molinos El Yope', '3193334455', 'pedidos@elyope.com'),
(11, 'Avícola Santa Reyes', '3015556677', 'ventas@santareyes.com'),
(12, 'Frigorífico Central', '3028889900', 'comercial@frigocentral.com'),
(13, 'Distribuciones El Sol', '3031114477', 'elsol@distribuciones.com'),
(14, 'Productos Ramo S.A.', '3042225588', 'contacto@ramo.com.co'),
(15, 'Quala S.A.', '3053336699', 'servicio@quala.com.co'),
(16, 'Empacadora del Valle', '3064447700', 'ventas@empavalle.com'),
(17, 'Abarrotes y Más Ltd', '3075558811', 'pedidos@abarrotesymas.com'),
(18, 'Agrícola de la Sabana', '3086669922', 'contacto@agrisabana.com'),
(19, 'Higiene Integral S.A.S.', '3097770033', 'ventas@higieneintegral.com'),
(20, 'Lácteos San Martin', '3108881144', 'pedidos@sanmartin.com');

-- ----------------------------------------------------------------
-- 5. TABLA: producto (100 registros)
-- ----------------------------------------------------------------
INSERT INTO `producto` (`id_producto`, `nombre`, `imagen_producto`, `id_categoria`) VALUES
(1, 'Leche Entera 1L', 'img/prod_1.jpg', 1), (2, 'Queso Campesino 500g', 'img/prod_2.jpg', 1),
(3, 'Yogurt Griego 150g', 'img/prod_3.jpg', 1), (4, 'Mantequilla con Sal 250g', 'img/prod_4.jpg', 1),
(5, 'Huevos AA x30', 'img/prod_5.jpg', 1), (6, 'Crema de Leche 200ml', 'img/prod_6.jpg', 1),
(7, 'Arequipe 250g', 'img/prod_7.jpg', 1), (8, 'Kumis 1L', 'img/prod_8.jpg', 1),
(9, 'Queso Mozzarella 400g', 'img/prod_9.jpg', 1), (10, 'Leche Deslactosada 1L', 'img/prod_10.jpg', 1),
(11, 'Gaseosa Coca Cola 1.5L', 'img/prod_11.jpg', 2), (12, 'Agua Mineral 600ml', 'img/prod_12.jpg', 2),
(13, 'Jugo de Naranja 1L', 'img/prod_13.jpg', 2), (14, 'Cerveza Club Colombia 330ml', 'img/prod_14.jpg', 2),
(15, 'Bebida Energizante 250ml', 'img/prod_15.jpg', 2), (16, 'Té Helado Limón 500ml', 'img/prod_16.jpg', 2),
(17, 'Gaseosa Manzana 2L', 'img/prod_17.jpg', 2), (18, 'Agua con Gas 500ml', 'img/prod_18.jpg', 2),
(19, 'Bebida de Soya 1L', 'img/prod_19.jpg', 2), (20, 'Hydrate Electrolitos 500ml', 'img/prod_20.jpg', 2),
(21, 'Arroz Supremo 1Kg', 'img/prod_21.jpg', 3), (22, 'Frijol Bola Roja 500g', 'img/prod_22.jpg', 3),
(23, 'Lenteja Seleccionada 500g', 'img/prod_23.jpg', 3), (24, 'Aceite Vegetal 1L', 'img/prod_24.jpg', 3),
(25, 'Panela Cuadrada 1Kg', 'img/prod_25.jpg', 3), (26, 'Azúcar Blanca 1Kg', 'img/prod_26.jpg', 3),
(27, 'Sal Refinada 500g', 'img/prod_27.jpg', 3), (28, 'Harina de Trigo 1Kg', 'img/prod_28.jpg', 3),
(29, 'Harina de Maíz Precocida 1Kg', 'img/prod_29.jpg', 3), (30, 'Café Molido 500g', 'img/prod_30.jpg', 3),
(31, 'Papas Fritas Natural 150g', 'img/prod_31.jpg', 4), (32, 'Galletas Saltín x3 Paquetes', 'img/prod_32.jpg', 4),
(33, 'Chocolatina Jet 12g', 'img/prod_33.jpg', 4), (34, 'Galletas Dulces Recreo', 'img/prod_34.jpg', 4),
(35, 'Platanitos Con Sal 100g', 'img/prod_35.jpg', 4), (36, 'Maní Moto Salado 150g', 'img/prod_36.jpg', 4),
(37, 'Galleton de Chispas 80g', 'img/prod_37.jpg', 4), (38, 'Chicharron Crocante 80g', 'img/prod_38.jpg', 4),
(39, 'Barra de Cereal Frutos Secos', 'img/prod_39.jpg', 4), (40, 'Popcorn Para Microondas 100g', 'img/prod_40.jpg', 4),
(41, 'Jabón de Baño Menta 120g', 'img/prod_41.jpg', 5), (42, 'Shampoo Anti-caspa 400ml', 'img/prod_42.jpg', 5),
(43, 'Crema Dental Triple Acción', 'img/prod_43.jpg', 5), (44, 'Desodorante en Roll-on 50ml', 'img/prod_44.jpg', 5),
(45, 'Acondicionador Capilar 350ml', 'img/prod_45.jpg', 5), (46, 'Papel Higiénico x4 Rollos', 'img/prod_46.jpg', 5),
(47, 'Protector Solar FPS 50 100ml', 'img/prod_47.jpg', 5), (48, 'Jabón Líquido Manos 300ml', 'img/prod_48.jpg', 5),
(49, 'Toallas Femeninas x10', 'img/prod_49.jpg', 5), (50, 'Máquina de Afeitar x2', 'img/prod_50.jpg', 5),
(51, 'Detergente Polvo 1Kg', 'img/prod_51.jpg', 6), (52, 'LAVALOZA Líquido 500ml', 'img/prod_52.jpg', 6),
(53, 'Limpiavidrios Spray 500ml', 'img/prod_53.jpg', 6), (54, 'Desinfectante Multiusos 1L', 'img/prod_54.jpg', 6),
(55, 'Suavizante Textil 1L', 'img/prod_55.jpg', 6), (56, 'Cloro Blanqueador 1L', 'img/prod_56.jpg', 6),
(57, 'Esponja de Cocina x3', 'img/prod_57.jpg', 6), (58, 'Bolsas para Basura x10', 'img/prod_58.jpg', 6),
(59, 'Lustramuebles 300ml', 'img/prod_59.jpg', 6), (60, 'Ambientador Spray 300ml', 'img/prod_60.jpg', 6),
(61, 'Salchicha Manguera 500g', 'img/prod_61.jpg', 7), (62, 'Jamón Doblado de Cerdo 250g', 'img/prod_62.jpg', 7),
(63, 'Tocineta Ahumada 200g', 'img/prod_63.jpg', 7), (64, 'Salchichón Cervecero 500g', 'img/prod_64.jpg', 7),
(65, 'Carne Molida de Res 500g', 'img/prod_65.jpg', 7), (66, 'Pechuga de Pollo Entera 1Kg', 'img/prod_66.jpg', 7),
(67, 'Chorizo Santarrosano x6', 'img/prod_67.jpg', 7), (68, 'Mortadela Especial 250g', 'img/prod_68.jpg', 7),
(69, 'Costilla de Cerdo 1Kg', 'img/prod_69.jpg', 7), (70, 'Filete de Merluza 500g', 'img/prod_70.jpg', 7),
(71, 'Pan Tajado Blanco 450g', 'img/prod_71.jpg', 8), (72, 'Pan Tajado Integral 450g', 'img/prod_72.jpg', 8),
(73, 'Tostadas de Ajo 200g', 'img/prod_73.jpg', 8), (74, 'Ponqué Ramo Tradicional', 'img/prod_74.jpg', 8),
(75, 'Muffins de Chocolate x4', 'img/prod_75.jpg', 8), (76, 'Pan Hamburguesa x4', 'img/prod_76.jpg', 8),
(77, 'Pan Perro Caliente x6', 'img/prod_77.jpg', 8), (78, 'Croissant Mantequilla x2', 'img/prod_78.jpg', 8),
(79, 'Galletas de Mantequilla 200g', 'img/prod_79.jpg', 8), (80, 'Bizcocho de Achira 100g', 'img/prod_80.jpg', 8),
(81, 'Manzana Roja x1Kg', 'img/prod_81.jpg', 9), (82, 'Bananos criollos x1Kg', 'img/prod_82.jpg', 9),
(83, 'Tomate Chonto x1Kg', 'img/prod_83.jpg', 9), (84, 'Cebolla Cabezona x1Kg', 'img/prod_84.jpg', 9),
(85, 'Papa Sabanera x1Kg', 'img/prod_85.jpg', 9), (86, 'Zanahoria Seleccionada x1Kg', 'img/prod_86.jpg', 9),
(87, 'Aguacate Hass x1Kg', 'img/prod_87.jpg', 9), (88, 'Limón Tahití x1Kg', 'img/prod_88.jpg', 9),
(89, 'Naranja Criolla x1Kg', 'img/prod_89.jpg', 9), (90, 'Lechuga Crespa Unidad', 'img/prod_90.jpg', 9),
(91, 'Alimento Perro Adulto 1.5Kg', 'img/prod_91.jpg', 10), (92, 'Alimento Gato Carne 1Kg', 'img/prod_92.jpg', 10),
(93, 'Snack Canino Huesito x3', 'img/prod_93.jpg', 10), (94, 'Sana Gato Pouch 85g', 'img/prod_94.jpg', 10),
(95, 'Arena para Gato 4Kg', 'img/prod_95.jpg', 10), (96, 'Shampoo Mascotas 250ml', 'img/prod_96.jpg', 10),
(97, 'Comedero Plástico Pequeño', 'img/prod_97.jpg', 10), (98, 'Juguete Pelota Goma', 'img/prod_98.jpg', 10),
(99, 'Hueso de Carnaza Mediano', 'img/prod_99.jpg', 10), (100, 'Limpia Patas Mascotas 150ml', 'img/prod_100.jpg', 10);

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

-- ----------------------------------------------------------------
-- 6. GENERACIÓN DINÁMICA MEDIANTE STORED PROCEDURE
-- Genera:
-- - 150 Órdenes de compra
-- - 200 Lotes de producto
-- - 4,000 Ventas
-- - 6,000 Detalle de Venta (venta_lote)
-- - 2,800 Pagos (venta_metodo_pago)
-- - 46    Alertas
-- Total general exactamente: 13,318 registros.
-- ----------------------------------------------------------------

DELIMITER $$

DROP PROCEDURE IF EXISTS `PoblarBaseDatosMassivo`$$

CREATE PROCEDURE `PoblarBaseDatosMassivo`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE p_id INT;
    DECLARE v_id INT;
    DECLARE lote_code VARCHAR(50);
    DECLARE fecha_random DATETIME;
    DECLARE precio_random DECIMAL(12,2);
    
    -- A. Generar 150 ordenes_compra
    SET i = 1;
    WHILE i <= 150 DO
        INSERT INTO `orden_compra` (`id_orden`, `fecha_pedido`, `fecha_llegada`, `id_proveedor`)
        VALUES (
            i, 
            DATE_SUB('2026-05-01', INTERVAL FLOOR(RAND() * 180) DAY),
            DATE_SUB('2026-05-01', INTERVAL FLOOR(RAND() * 170) DAY),
            FLOOR(1 + RAND() * 20)
        );
        SET i = i + 1;
    END WHILE;

    -- B. Generar 200 lotes (2 lotes por cada uno de los 100 productos)
    SET i = 1;
    WHILE i <= 200 DO
        SET p_id = IF(i <= 100, i, i - 100);
        SET lote_code = CONCAT('LOTE-2026-', LPAD(i, 4, '0'));
        
        INSERT INTO `lote` (`id_producto`, `id_lote`, `stock_actual`, `estado`, `precio`, `fecha_vencimiento`, `costo_compra`, `stock_minimo`, `id_orden`)
        VALUES (
            p_id,
            lote_code,
            FLOOR(10 + RAND() * 200),
            IF(i % 15 = 0, 'vencido', 'fresco'),
            ROUND(5000 + (RAND() * 45000), 2),
            DATE_ADD('2026-06-01', INTERVAL FLOOR(RAND() * 365) DAY),
            ROUND(3000 + (RAND() * 30000), 2),
            15,
            FLOOR(1 + RAND() * 150)
        );
        SET i = i + 1;
    END WHILE;

    -- C. Generar 4,000 ventas
    SET i = 1;
    WHILE i <= 4000 DO
        SET fecha_random = DATE_SUB('2026-10-28 23:59:59', INTERVAL FLOOR(RAND() * 120) DAY);
        INSERT INTO `venta` (`id_venta`, `fecha_venta`, `id_usuario`)
        VALUES (
            i,
            fecha_random,
            FLOOR(1 + RAND() * 10)
        );
        SET i = i + 1;
    END WHILE;

    -- D. Generar 6,000 items de venta (venta_lote) distribuidos entre las 4,000 ventas
    -- Asegura que las primeras 2,000 ventas tengan al menos 2 items y el resto 1 item único
    SET i = 1;
    WHILE i <= 4000 DO
        SET p_id = FLOOR(1 + RAND() * 100);
        SET lote_code = CONCAT('LOTE-2026-', LPAD(p_id, 4, '0'));
        SET precio_random = ROUND(3000 + (RAND() * 20000), 2);
        
        INSERT INTO `venta_lote` (`id_venta`, `id_producto`, `id_lote`, `cantidad`, `precio_momento`)
        VALUES (i, p_id, lote_code, FLOOR(1 + RAND() * 5), precio_random);
        
        -- Adicionar un segundo item a la mitad de las ventas
        IF i <= 2000 THEN
            SET p_id = IF(p_id >= 100, 1, p_id + 1); -- Producto diferente en la venta
            SET lote_code = CONCAT('LOTE-2026-', LPAD(p_id + 100, 4, '0'));
            
            INSERT INTO `venta_lote` (`id_venta`, `id_producto`, `id_lote`, `cantidad`, `precio_momento`)
            VALUES (i, p_id, lote_code, FLOOR(1 + RAND() * 3), precio_random);
        END IF;
        
        SET i = i + 1;
    END WHILE;

    -- E. Generar 2,800 registros de pago (venta_metodo_pago)
    SET i = 1;
    WHILE i <= 2800 DO
        INSERT INTO `venta_metodo_pago` (`id_venta`, `id_metodo`, `monto`, `fecha`)
        VALUES (
            i,
            IF(i % 2 = 0, 1, 2),
            ROUND(10000 + (RAND() * 80000), 2),
            DATE_SUB('2026-10-28 23:59:59', INTERVAL FLOOR(RAND() * 120) DAY)
        );
        SET i = i + 1;
    END WHILE;

    -- F. Generar 46 alertas asociadas a los lotes creados
    SET i = 1;
    WHILE i <= 46 DO
        SET p_id = FLOOR(1 + RAND() * 100);
        SET lote_code = CONCAT('LOTE-2026-', LPAD(p_id, 4, '0'));
        
        INSERT INTO `alerta` (`id_alerta`, `tipo`, `fecha`, `id_producto`, `id_lote`)
        VALUES (
            i,
            IF(i % 2 = 0, 'stock', 'vencimiento'),
            NOW(),
            p_id,
            lote_code
        );
        SET i = i + 1;
    END WHILE;

END$$

DELIMITER ;

-- Ejecutar el procedimiento y guardar cambios
CALL `PoblarBaseDatosMassivo`();
COMMIT;

-- Eliminar procedimiento tras su uso
DROP PROCEDURE IF EXISTS `PoblarBaseDatosMassivo`;