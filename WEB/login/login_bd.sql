CREATE DATABASE IF NOT EXISTS sistema_login;
USE sistema_login;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    token_recuperacion VARCHAR(255),
    token_expiracion DATETIME,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (usuario, contraseña, email)
VALUES ('edgar123', SHA2('12345', 256), 'edgar@example.com');

