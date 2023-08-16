-- Criando o banco de dados para o cenário de oficina --

CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Adicionando tabelas --

-- Cliente --
CREATE TABLE client(
			idClient SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Fname VARCHAR(20),
            Minit CHAR(3),
            Lname VARCHAR(20),
            CPF CHAR (11) NOT NULL,
            Adress VARCHAR(45),
            CONSTRAINT unique_CPF_client UNIQUE (CPF)
);
-- Veículo --
CREATE TABLE vehicle(
			idVehicle SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            license CHAR(7),
            type ENUM('car', 'motorcycle', 'bicycle', 'truck'),
            fk_client SMALLINT,
            CONSTRAINT fk_client_vehicle FOREIGN KEY (fk_client) REFERENCES client (idClient) 
);

-- Mecânico --
CREATE TABLE mechanic(
			idMechanic SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Fname VARCHAR(20),
            Minit CHAR(3),
            Lname VARCHAR(20),
            CPF CHAR (11) NOT NULL,
            Adress VARCHAR(45),
            Expertise VARCHAR(30),
            CONSTRAINT unique_CPF_mechanic UNIQUE (CPF)
);

-- Veículo/Mecânico --
CREATE TABLE vehicle_mechanic(
			fk_vehicle SMALLINT,
            fk_mechanic SMALLINT,
            CONSTRAINT fk_vehicle FOREIGN KEY (fk_vehicle) REFERENCES vehicle (idVehicle),
            CONSTRAINT fk_mechanic FOREIGN KEY (fk_mechanic) REFERENCES mechanic (idMechanic)
);

-- Produtos (Peças) --
CREATE TABLE product(
			idProduct SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(30),
            Value FLOAT(6,2)
);

-- Custo da mão de obra --
CREATE TABLE labor_cost(
			idLabor_cost SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Type VARCHAR(30),
            Value FLOAT(5,2)
);

-- Ordem de serviço --
CREATE TABLE SO(
			idSO SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            fk_vehicle SMALLINT,
            Date_of_issue DATE,
            Deadline DATE,
            Status ENUM('Processing','Work in progress','Complete','Billed','Delivered') DEFAULT 'Processing',
            CONSTRAINT fk_vehicle_SO FOREIGN KEY (fk_vehicle) REFERENCES vehicle (idVehicle)
);


-- Custo dos produtos na ordem de serviço --
CREATE TABLE SO_product(
			fk_Product SMALLINT,
            Quantity SMALLINT,
            fk_SO SMALLINT,
            CONSTRAINT fk_Product FOREIGN KEY (fk_Product) REFERENCES Product (idProduct),
            CONSTRAINT fk_SO FOREIGN KEY (fk_SO) REFERENCES SO (idSO)
);

-- Custo da mão de obra na ordem de serviço -- 
CREATE TABLE SO_labor_cost(
			fk_Labor_cost SMALLINT,
            Quantity SMALLINT,
            fk_SO SMALLINT,
            CONSTRAINT fk_Labor_cost FOREIGN KEY (fk_Labor_cost) REFERENCES Labor_cost (idLabor_cost),
            CONSTRAINT fk_SO_Labor_cost FOREIGN KEY (fk_SO) REFERENCES SO (idSO)
            
);