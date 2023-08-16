-- Criação de Querys para o cenário de oficina --

-- Aumento de 5% em todos os produtos da oficina --

SELECT Name AS Produto, Value AS "Valor original", Value*1.05 AS "Valor após aumento" FROM product ORDER BY Name;

-- Quantos produtos cada cliente adquiriu? -- 

SELECT Fname AS Cliente, SUM(Quantity) AS 'Quantidade de produtos adquiridos' FROM client INNER JOIN vehicle ON idClient = fk_client INNER JOIN SO ON idVehicle = fk_vehicle INNER JOIN SO_product ON idSO = fk_SO GROUP BY Fname ORDER BY SUM(Quantity);

-- Clientes com mais de 1 veículo cadastrado -- 

SELECT Fname AS Cliente, COUNT(idVehicle) AS 'Quantidade de veículos cadastrados' FROM client INNER JOIN vehicle ON idClient = fk_client GROUP BY Fname HAVING COUNT(idVehicle) > 1 ORDER BY COUNT(idVehicle);

-- Distribuição Mecânico / Veículo --

SELECT Fname AS Mecânico, Type AS "Tipo de veículo", license AS Placa FROM mechanic, vehicle, vehicle_mechanic WHERE idMechanic = fk_mechanic AND idVehicle = fk_vehicle;