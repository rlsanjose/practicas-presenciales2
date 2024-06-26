CREATE OR REPLACE PROCEDURE SCRIPT_INICIALIZACION_TABLAS
	AS
	BEGIN
		INSERT INTO Shops(address, city, opening_hours)
		VALUES ('45 Alfonso St', 'Zaragoza', 'Monday to Friday 9h to 20h');
		INSERT INTO Shops(address, city, opening_hours)
		VALUES ('46 Mayor St', 'Madrid', 'Monday to Friday 9h to 20h');
        
		INSERT INTO Products(name, price, stock, image_url)
		VALUES ('Pencil', 0.5, 80, 'https://www.collinsdictionary.com/images/full/pencil_280523090.jpg');
		INSERT INTO Products(name, price, stock, image_url)
		VALUES ('Eraser', 1.5, 50, 'https://thumb.pccomponentes.com/w-530-530/articles/29/291688/1603-milan-goma-de-borrar-430-colores-surtidos-1-unidad.jpg');
		INSERT INTO Products(name, price, stock, image_url)
		VALUES ('Pencil Sharpener', 2, 15, 'https://m.media-amazon.com/images/I/41cHKfMAnXL.__AC_SY300_SX300_QL70_ML2_.jpg');
		INSERT INTO Products(name, price, stock, image_url)
		VALUES ('Fountain Pen', 0.5, 80, 'https://www.penboutique.com/cdn/shop/files/Montblanc-Meisterstuck-Fountain-Pen-149-Black-Red-Gold-Trim-Montblanc-42473361.jpg?v=1708824108');
	
		COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
	END SCRIPT_INICIALIZACION_TABLAS;
			
EXECUTE SCRIPT_INICIALIZACION_TABLAS;