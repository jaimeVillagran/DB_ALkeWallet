create schema AlkeWallet;

use AlkeWallet;

-- **************************
-- DB SQL `Alke Wallet`.
-- Usuarios =  User
-- **************************
CREATE TABLE User (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(45) NOT NULL,
  user_email VARCHAR(45) NOT NULL,
  user_password VARCHAR(45) DEFAULT NULL,
  balance INT NOT NULL,
  creation_date DATETIME DEFAULT NOW()
  );
  
	-- **************************
	-- DB SQL `Alke Wallet`.
	-- Moneda - Currency
	-- **************************
CREATE TABLE Currency (
  currency_id INT PRIMARY KEY AUTO_INCREMENT,
  currency_name VARCHAR(25) NOT NULL,
  currency_symbol VARCHAR(5) NOT NULL
  );

	-- **************************
	-- DB SQL `Alke Wallet`.
	-- `Transacciones`
	-- **************************
CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY AUTO_INCREMENT,
  sender_user_id  INT NOT NULL, /* Enviar dinero  DESDE UNA CUENTA */
  receiver_user_id INT NOT NULL, /* recibe dinero DESDE UNA CUENTA NUEVA.*/
  currency_id INT NOT NULL,
  transaction_amount INT NOT NULL,
  transaction_date DATETIME NOT NULL,
  transaction_type VARCHAR (30) NOT NULL,
  FOREIGN KEY (sender_user_id) REFERENCES User(user_id),
  FOREIGN KEY (receiver_user_id) REFERENCES User(user_id),
  FOREIGN KEY (currency_id) REFERENCES Currency(currency_id)
);  
  
  
	-- **************************
	-- Proyecto SQL "Alke Wallet`
	-- Insert de datos Usuarios
	-- **************************
INSERT INTO User (user_name, user_email, user_password, balance)
VALUES
('Juan Perez', 'juan@example.com', 'password123', 10000),
('María González', 'maria@example.com', 'securepass', 20500),
('Pedro Ramirez', 'pedro@example.com', '123456', 5000),
('Ana López', 'ana@example.com', 'pass1234', 15000),
('Luis Hernandez', 'luis@example.com', 'abcdef', 20000),
('Laura Martinez', 'laura@example.com', 'qwerty', 30000),
('Carlos Sanchez', 'carlos@example.com', 'password', 7000),
('Sofia Rodriguez', 'sofia@example.com', 'passpass', 4000),
('Miguel Diaz', 'miguel@example.com', '12345678', 6000),
('Diana Castro', 'diana@example.com', 'ilovecoding', 8000);


select * from User;

-- **************************
-- Proyecto SQL "Alke Wallet`
-- Insert Monedas
-- **************************
INSERT INTO Currency (currency_name, currency_symbol)
VALUES
('Peso chileno', 'CLP'),
('Dolar estadounidense', 'USD'),
('Euro', 'EUR'),
('Libra esterlina', 'GBP'),
('Yen japonés', 'JPY'),
('Peso mexicano', 'MXN');

select * from Currency;


-- **************************
-- Proyecto SQL "Alke Wallet`
-- Insert Transacciones
-- **************************
INSERT INTO transactions (sender_user_id, receiver_user_id, currency_id, transaction_amount, transaction_date, transaction_type)
VALUES
(1, 2, 1, 500, '2024-03-21 09:00:00', 'Compra'),
(2, 3, 2, 200, '2024-03-21 09:30:00', 'Venta'),
(3, 4, 1, 150, '2024-03-21 10:00:00', 'Transferencia'),
(4, 5, 3, 300, '2024-03-21 10:30:00', 'Compra'),
(5, 6, 2, 100, '2024-03-21 11:00:00', 'Venta'),
(6, 7, 1, 400, '2024-03-21 11:30:00', 'Compra'),
(7, 8, 4, 700, '2024-03-21 12:00:00', 'Venta'),
(8, 9, 3, 250, '2024-03-21 12:30:00', 'Transferencia'),
(9, 10, 2, 150, '2024-03-21 13:00:00', 'Compra'),
(10, 1, 1, 200, '2024-03-21 13:30:00', 'Venta');

SELECT * FROM transactions;

-- **************************
-- Crear consultas SQL para:
-- **************************

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT c.currency_name
FROM transactions t
JOIN Currency c ON t.currency_id = c.currency_id
WHERE t.sender_user_id = 7



-- Consulta para obtener todas las transacciones registradas
SELECT * FROM transactions;


-- Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT * FROM transactions
WHERE sender_user_id = 3 OR receiver_user_id = 3;


-- Consulta para obtener todas las transacciones realizadas a partir de una fecha específica
SELECT * FROM transactions 
WHERE transaction_date >= '2024-03-21 12:30:00';


-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE usuarios 
SET user_email = 'nuevo_correo@example.com' 
WHERE user_id = 5;



-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM transactions 
WHERE transaction_id = 3;

