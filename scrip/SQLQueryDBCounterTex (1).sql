CREATE DATABASE DBCounterTex
use DBCounterTex
-- Creaci�n de la tabla Usuario
CREATE TABLE Usuario (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NombreUsuario NVARCHAR(50),
    Correo NVARCHAR(50),
    Clave NVARCHAR(50)
);

-- Creaci�n de la tabla Satelite
CREATE TABLE Satelite (
    SateliteId INT IDENTITY(1,1) PRIMARY KEY,
    Fabricante NVARCHAR(100),
    PagoPrendas DECIMAL(18, 2) ,
    Ganancias DECIMAL(18, 2),
    Operacion NVARCHAR(100),
    PagoOperacion DECIMAL(18, 2),
    Inventariomaquinas INT ,
    TipoMaquina NVARCHAR(50),
    IdUsuario INT,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Creaci�n de la tabla PerfilAdministrador
CREATE TABLE PerfilAdministrador (
    IdAdministrador INT IDENTITY(1,1) PRIMARY KEY,
    NombreAdministrador NVARCHAR(100),
    ProduccionDiaria int,
    ProduccionMensual int,
    ControlPrendas int,
    Registro NVARCHAR(100),
    Ganancias DECIMAL(18, 2) ,
    Pagos DECIMAL(18, 2) ,
    Gastos DECIMAL(18, 2) ,
    MetaPorCorte DECIMAL(18, 2),
    ConsultarInformacion nvarchar(200	) ,
    ControlHorarios datetime ,
    ChatInterno NVARCHAR(200),
    Proveedor NVARCHAR(100),
    BotonAyuda NVARCHAR(100),
    IdUsuario INT,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Creaci�n de la tabla PerfilEmpleado
CREATE TABLE PerfilEmpleado (
    IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    ProduccionDiaria DECIMAL(18, 2) ,
    TipoPrenda NVARCHAR(100),
    TipoOperacion NVARCHAR(100),
    CantidadOperacion INT ,
    ValorOperacion DECIMAL(18, 2),
    ConsultarInformacion NVARCHAR(100),
    ControlHorarios Datetime,
    HoraEntrada DATETIME ,
    HoraSalida DATETIME ,
    MetaPorCorte DECIMAL(18, 2) ,
    BotonAyuda NVARCHAR(100),
    Estadisticas NVARCHAR(200),
    Observaciones NVARCHAR(500),
    IdUsuario INT,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Creaci�n de la tabla Registro
CREATE TABLE Registro (
    IdRegistro INT IDENTITY(1,1) PRIMARY KEY,
    Nombres NVARCHAR(100) ,
    Apellidos NVARCHAR(100),
    Documento NVARCHAR(50) ,
    Correo NVARCHAR(100),
    Contrase�a NVARCHAR(100),
    ConfirmarContrase�a NVARCHAR(100),
    FechaRegistro DATETIME 
);

-- Creaci�n de la tabla Proveedor
CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY(1,1) PRIMARY KEY,
    NombreProveedor NVARCHAR(150),
    PrecioPrenda DECIMAL(18, 2),
    TipoPrenda NVARCHAR(100),
    Telefono NVARCHAR(50),
    Direccion NVARCHAR(200),
    Ciudad NVARCHAR(100),
    Localidad NVARCHAR(100),
    Barrio NVARCHAR(100),
    CantidadPrendas INT
);

-- Creaci�n de la tabla Tokens (Si es necesaria para el sistema)
CREATE TABLE Tokens (
    IdToken INT IDENTITY(1,1) PRIMARY KEY,
    Token NVARCHAR(255) 
    FechaCreacion DATETIME 
);


select * from Registro



-- Inserci�n de datos en la tabla Usuario
INSERT INTO Usuario (NombreUsuario, Correo, Clave)
VALUES
('admin', 'admin@example.com', 'password123'),
('empleado1', 'empleado1@example.com', 'password456'),
('empleado2', 'empleado2@example.com', 'password789');

-- Inserci�n de datos en la tabla Satelite
INSERT INTO Satelite (Fabricante, PagoPrendas, Ganancias, Operacion, PagoOperacion, Inventariomaquinas, TipoMaquina, IdUsuario)
VALUES
('FabricanteA', 5000.00, 12000.00, 'Corte', 2000.00, 10, 'Cortadora', 1),
('FabricanteB', 3000.00, 8000.00, 'Costura', 1500.00, 8, 'Recta', 2),
('FabricanteC', 4000.00, 10000.00, 'Plancha', 1800.00, 5, 'Planchadora', 3);

-- Inserci�n de datos en la tabla PerfilAdministrador
INSERT INTO PerfilAdministrador (NombreAdministrador, ProduccionDiaria, ProduccionMensual, ControlPrendas, Registro, Ganancias, Pagos, Gastos, MetaPorCorte, ConsultarInformacion, ControlHorarios, ChatInterno, Proveedor, BotonAyuda, IdUsuario)
VALUES
('Administrador1', 1000.00, 30000.00, 1, 'Registro1', 15000.00, 5000.00, 2000.00, 500.00, 1, 1, 'Chat Soporte', 'ProveedorA', 'Boton Ayuda 1', 1),
('Administrador2', 800.00, 24000.00, 0, 'Registro2', 12000.00, 4000.00, 1000.00, 400.00, 1, 1, 'Chat Interno', 'ProveedorB', 'Boton Ayuda 2', 2);

-- Inserci�n de datos en la tabla PerfilEmpleado
INSERT INTO PerfilEmpleado (ProduccionDiaria, TipoPrenda, TipoOperacion, CantidadOperacion, ValorOperacion, ConsultarInformacion, ControlHorarios, HoraEntrada, HoraSalida, MetaPorCorte, BotonAyuda, Estadisticas, Observaciones, IdUsuario)
VALUES
(500.00, 'Camiseta', 'Corte', 50, 10.00, 'Informaci�n disponible', 1, '2024-12-10 08:00:00', '2024-12-10 17:00:00', 100.00, 'Bot�n 1', 'Estad�sticas b�sicas', 'Ninguna', 2),
(400.00, 'Pantal�n', 'Costura', 40, 15.00, 'Informaci�n parcial', 1, '2024-12-10 09:00:00', '2024-12-10 18:00:00', 90.00, 'Bot�n 2', 'Estad�sticas avanzadas', 'Revisi�n requerida', 3);

-- Inserci�n de datos en la tabla Registro
INSERT INTO Registro (Nombres, Apellidos, Documento, Correo, Contrase�a, ConfirmarContrase�a, FechaRegistro)
VALUES
('Juan', 'P�rez', '12345678', 'juan.perez@example.com', 'clave123', 'clave123', '2024-12-09 10:00:00'),
('Mar�a', 'L�pez', '87654321', 'maria.lopez@example.com', 'clave456', 'clave456', '2024-12-08 11:00:00'),
('Pedro', 'G�mez', '56789012', 'pedro.gomez@example.com', 'clave789', 'clave789', '2024-12-07 12:00:00');

-- Inserci�n de datos en la tabla Proveedor
INSERT INTO Proveedor (NombreProveedor, PrecioPrenda, TipoPrenda, Telefono, Direccion, Ciudad, Localidad, Barrio, CantidadPrendas)
VALUES
('Proveedor1', 25.50, 'Camiseta', '555-1234', 'Calle Falsa 123', 'Ciudad A', 'Localidad X', 'Barrio Alpha', 1000),
('Proveedor2', 30.75, 'Pantal�n', '555-5678', 'Avenida Siempreviva 742', 'Ciudad B', 'Localidad Y', 'Barrio Beta', 800),
('Proveedor3', 20.00, 'Short', '555-9012', 'Plaza Mayor 45', 'Ciudad C', 'Localidad Z', 'Barrio Gamma', 600);


