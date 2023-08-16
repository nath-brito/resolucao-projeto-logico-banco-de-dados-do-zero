-- Populando cenário de oficina --
USE oficina;

INSERT INTO client(Fname, Minit, Lname, CPF, Adress) VALUES
			("Maria", "A", "Silva", 01234567890, "Rua ABC 123"),
            ("João", "B", "Matos", 12345678901, "Rua DEF 456"),
            ("Aurora", "C", "Souza", 23456789012, "Rua JKL 789"),
            ("Marcos", "D", "Moraes", 34567890123, "Rua ABC 456"),
            ("Pedro", "E", "Silva", 45678901234, "Rua DEF 789");
            
INSERT INTO vehicle(license, type, fk_client) VALUES
			("ABC1H34", "car", 1),
            ("DEF4S67", "motorcycle", 1),
            ("GHI7S94", "bicycle", 1),
            ("JIK7J93", "car", 2),
            ("WER0T93", "bicycle", 2),
            ("RET4S91", "car", 3),
            ("GVD4M89", "motorcycle", 3),
            ("SGE5T12", "truck", 5);

INSERT INTO mechanic(Fname, Minit, Lname, CPF, Adress, Expertise) VALUES
			("Alfredo", "A", "Cabral", 5678912345, "RUA JKL 456", "Manutenção Preventiva"),
            ("Bela", "B", "Matos", 67890123456, "RUA GFD 354", "Troca de Peças"),
            ("Joaquim", "C", "Nogueira", 78901234567, "RUA WER 864", "Manutenção Geral"),
            ("Joelma", "D", "Rocha",  89012345678, "RUA JYT 735", "Manutenção Preventiva"),
            ("Julio", "E", "Brito" , 90123456789, "RUA ASD 758", "Troca de Peças"),
            ("Osvaldo", "F", "Siqueira", 00123456789, "RUA GFD 114", "Troca de Peças"),
            ("Paula", "G", "Oliveira", 11234567890, "RUA UIO 257", "Manutenção Geral"),
            ("Raquel", "H", "Campos", 22345678901, "RUA RTE 367", "Manutenção Geral");
            
INSERT INTO vehicle_mechanic(fk_vehicle, fk_mechanic) VALUES
			(1,1),
            (1,5),
            (2,8),
            (3,7),
            (3,2),
            (4,2),
            (5,8),
            (5,6),
            (6,1),
            (7,7),
            (7,2),
            (8,8);

INSERT INTO product(Name, Value) VALUES
			("Pneu Bicicleta", 55.5),
            ("Pneu Moto", 149.9),
            ("Pneu Carro", 399.9),
            ("Pneu Caminhão", 2000.0),
            ("Óleo Lubrificante", 29.9), 
            ("Amortecedor de Suspensão", 149.9),
            ("Sapata de Freio", 79.9),
            ("Kit Embreagem", 399.9),
            ("Pastilha de Freio", 49.9);
            
INSERT INTO labor_cost(Type, Value) VALUES
			("Troca de Pneu", 25.0),
            ("Troca de Óleo", 60.0),
            ("Troca de Amortecedor", 150.0),
            ("Troca de Sapata de Freio", 45.0),
            ("Troca de Embreagem", 200.0),
            ("Troca de Pastilha de Freio", 75.0),
            ("Revisão Geral", 500.0),
            ("Manutenção Preventiva", 50.0);

INSERT INTO SO(fk_vehicle, Date_of_issue, Deadline, Status) VALUES
			(1, '2023-01-22', '2023-03-25','Complete'),
            (2, '2023-03-24', '2023-05-22', 'Work in progress'),
            (3, '2023-04-15', '2023-06-20','Billed'),
            (4, '2023-08-13', '2023-10-26', 'Processing'),
            (5, '2022-05-29', '2022-07-30', 'Complete'),
            (6, '2022-08-01', '2022-10-15', 'Complete'),
            (7, '2022-10-20', '2022-12-21', 'Delivered'),
            (8, '2022-12-16', '2023-02-17', 'Delivered');
            
INSERT INTO SO_product(fk_SO, fk_Product, Quantity) VALUES
			(1, 9, 1),
            (2, 5, 1),
            (3, 1, 1),
            (4, 6, 2),
            (5, 1, 1),
            (6, 5, 1),
            (6, 7, 1),
            (7, 6, 2),
            (8, 5, 2);
            
INSERT INTO SO_labor_cost(fk_SO, fk_Labor_cost, Quantity) VALUES
			(1, 8, 1),
            (1, 5, 1),
            (2, 7, 1),
            (3, 1, 2),
            (4, 3, 2),
            (5, 1, 2),
            (6, 8, 1),
            (7, 3, 2),
            (7, 7, 1),
            (8, 7, 1);