-- base TIENDA ONLINE Christopher Uriel Tafolla Brambila

/*BOMPZZ
Nota: esta base de datos solo se puede emplear en pruebas sin estar en hosting por diferencias entre phpmyadmin y mysql.*/
CREATE SCHEMA if not exists Store_Online DEFAULT CHARACTER SET utf16  DEFAULT COLLATE utf16_spanish_ci;
use Store_Online;
CREATE TABLE CATEGORIAS (
	ID INT NOT NULL AUTO_INCREMENT,
    CATEGORIA VARCHAR(40) NOT NULL,
    PRIMARY KEY(ID)
);
CREATE TABLE PRODUCTOS(
	ID INT NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(80) NOT NULL,
    DESCRIPCION VARCHAR(255),
    FOTO VARCHAR(120) NOT NULL,
    PRECIO DECIMAL(10,2) NOT NULL,
    CATEGORIA_ID INT NOT NULL,
    FECHA DATE NOT NULL,
    ESTADO INT NOT NULL DEFAULT 1,
    PRIMARY KEY (ID),
    INDEX fk_categorias_peliculas_id (categoria_id ASC) VISIBLE,
  CONSTRAINT fk_categorias_productos
    FOREIGN KEY (categoria_id)
    REFERENCES store_online.categorias (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
CREATE TABLE CLIENTES (
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(80) NOT NULL,
    APELLIDOS VARCHAR(120) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL,
    TELEFONO CHAR(13) NOT NULL,
    COMENTARIO VARCHAR(255),
    PRIMARY KEY(ID)
);
CREATE TABLE PEDIDOS(
	ID INT NOT NULL AUTO_INCREMENT,
	CLIENTE_ID INT NOT NULL,
    TOTAL DECIMAL(10,2) NOT NULL,
    FECHA DATE NOT NULL,
    PRIMARY KEY(ID),
    INDEX fk_clientes_pedidos_id (cliente_id ASC) VISIBLE,
  CONSTRAINT fk_clientes_pedidos
    FOREIGN KEY (cliente_id)
    REFERENCES store_online.clientes (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
CREATE TABLE DETALLE_PEDIDO(
	ID INT NOT NULL AUTO_INCREMENT,
    PEDIDOS_ID INT NOT NULL,
    PRODUCTOS_ID INT NOT NULL,
    PRECIO DECIMAL(10,2) NOT NULL,
    CANTIDAD INT NOT NULL,
    PRIMARY KEY (ID),
    INDEX fk_DETALLE_PEDIDO_PEDIDOS_id (PEDIDOS_id ASC) VISIBLE,
  CONSTRAINT fk_detalle_pedido_pedidos
    FOREIGN KEY (pedidos_id)
    REFERENCES store_online.pedidos (id),
    INDEX fk_detalle_pedido_productos_id (productos_id ASC) VISIBLE,
  CONSTRAINT fk_detalle_pedido_productos
    FOREIGN KEY (productos_id)
    REFERENCES store_online.productos (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
CREATE TABLE USUARIOS(
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE_USUARIO VARCHAR(100) NOT NULL,
    CLAVE VARCHAR(128)NOT NULL,
    ESTADO INT NOT NULL DEFAULT 1,
    PRIMARY KEY (ID)
);
/*Registros necesarios para que se acceda al sistema y permita tener categorias*/
insert into usuarios set nombre_usuario='root', clave='admin123';
INSERT INTO CATEGORIAS SET CATEGORIA='ALIMENTOS Y BEBIDAS';
INSERT INTO CATEGORIAS SET CATEGORIA='LIBROS';
INSERT INTO CATEGORIAS SET CATEGORIA='PELÍCULAS, SERIES, TV Y MUSICA';
INSERT INTO CATEGORIAS SET CATEGORIA='ELECTRÓNICOS';
INSERT INTO CATEGORIAS SET CATEGORIA='CÓMPUTO Y TABLETS';
INSERT INTO CATEGORIAS SET CATEGORIA='SOFTWARE';
INSERT INTO CATEGORIAS SET CATEGORIA='VIDEOJUEGOS';
INSERT INTO CATEGORIAS SET CATEGORIA='HOGAR, COCINA, JARDÍN';
INSERT INTO CATEGORIAS SET CATEGORIA='HERRAMIENTAS Y  MEJORAS DEL HOGAR';
INSERT INTO CATEGORIAS SET CATEGORIA='AUTOMOTRIZ Y MOTOCICLETAS';
INSERT INTO CATEGORIAS SET CATEGORIA='JUEGOS Y JUGUETES';
INSERT INTO CATEGORIAS SET CATEGORIA='MASCOTAS Y ACCESORIOS';
INSERT INTO CATEGORIAS SET CATEGORIA='BEBÉ';
INSERT INTO CATEGORIAS SET CATEGORIA='MODA';
INSERT INTO CATEGORIAS SET CATEGORIA='BOLSAS, MALETAS ACCESORIOS DE VIAJE';
INSERT INTO CATEGORIAS SET CATEGORIA='HECHO A MANO';
INSERT INTO CATEGORIAS SET CATEGORIA='DEPORTES Y AIRE LIBRE';
INSERT INTO CATEGORIAS SET CATEGORIA='SALUD, BELLEZA, CUIDADO PERSONAL';
INSERT INTO CATEGORIAS SET CATEGORIA='INDUSTRIA, EMPRESAS Y CIENCIA';