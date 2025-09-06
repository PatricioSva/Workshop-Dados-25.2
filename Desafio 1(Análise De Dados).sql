
create database selecao_estagio;
use selecao_estagio;

 CREATE TABLE candidatos
 (  
 candidatos_id INT auto_increment 
 primary key,
 nome VARCHAR(100) NOT NULL,
 cidade VARCHAR(100) NOT NULL,
 idade INT NOT NULL,
 curso VARCHAR(56),
 disponivel BOOLEAN DEFAULT TRUE
 );
 
 CREATE TABLE estagios
 ( 
 estagio_id INT auto_increment
 primary key,
 empresa VARCHAR(100) NOT NULL,
 cargo VARCHAR(50) NOT NULL,
 salario decimal(8,2) NOT NULL,
 localidade VARCHAR(130) NOT NULL,
 candidatos_id INT, 
 data_inicio DATE,
 `status` VARCHAR(25) DEFAULT
 'pendente',
  foreign key
  (candidatos_id) references candidatos(candidatos_id)
 );
 
 INSERT INTO candidatos ( nome, idade, cidade, curso, disponível) VALUES
 ('Joao silva', 22, 'joao pessoa', 'analise de sistemas', TRUE),
 ('Maria Costa', 21, 'Recife', 'Ciência De Dados', TRUE),
 ('Lucas Silva', 23 , 'Campina Grande', 'Engenheiro de Sistemas',TRUE),
 ('Sarah Leite', 25, 'petrópolis', 'Química', TRUE),
 ('Samily Lopes', 21, 'Pau Dos Ferros','Ciências Da Computação', TRUE),
 ('Samuel Brandão', 18, 'Petrolina', 'Tecnico de Sistemas', TRUE),
 ("Thalyta Reis", 23, 'Jundiaí', 'Engenharia Mecânica', TRUE),
 ('Maria Da Penha', 38, 'Sapé', 'Analise e Desenvolvimento De Dados', TRUE),
 ('Melson Lopes', 63, 'cabedelo', 'Engenharia Naval', TRUE),
 ('Aluizio Cândido', 48, 'Juazeiro', 'Administração', TRUE);
 
 INSERT INTO estagios (empresa, cargo, salario, localidade, candidato_id , data_inicio , `status`) values 
 ('TechTech', 'Desenvolvedor Front-End', 1500, 'Joao-Pessoa', 1, '01-08-2025' , 'aprovado'),
 ('DevTech', 'Back-End Jr', 1200, 'Recife', 2, '02-08-2025', 'aprovado'),
 ('WebTech', 'Estagiário Web', 1100, 'Campina Grande', 3, '03-08-2025', 'aprovado'),
 ('TechNova', 'QA junior', 1220, 'Joao Pessoa', 4, 04-08-2025, 'pendente'),
 ('DataTech','Estágio Data',1350, 'Patos',5, '05-08-2025','Pendente'),
 ('DevDev','DEVOPS jr',1248,'Natal',6,'06-08-2025','aprovado'),
 ('CloudTech', 'CLOUD inter', 1520,'Natal', 7, '07-08-2025', 'aprovado'),
 ('CodeTech','Analista de Sistemas', 1689,'Joao Pessoa', 8, 08-08-2025, 'pendente'),
 ('CodeCode', 'Codificador De Dados',2020,'Campina Grande',9, 09-08-2025, 'aprovado'),
 ('DataData', 'Cientista Da Computação', 2320, 'Joao Pessoa', 10, 10-08-2025, 'pendente');
 
 update estagios
 SET salario = ROUND (salario * 1.10,2)
 where empresa= 'TechTech';
 
 select*from candidatos order by candidatos_id;
 
 select count(*) AS total_estagios,
 sum(salario) AS soma_salarial,
 avg(salario) AS media_salarial
 from estagios;
 
 Select empresa, count(*)
  AS vagas, AVG(Salario) AS salario_medio from estagios
 GROUP BY empresa
 ORDER BY vagas DESC;
 
 select
 cidade,
  count(*) AS candidatos_por_cidade
 FROM candidatos
 group by cidade
 order by Candidatos_por_cidade desc;
 
 select
 c.candidatos_id AS candidato_id,
 c.nome,
 c.cidade,
 e.empresa,
 e.cargo,
 e.salario
 from estagios e
  Join candidatos c ON e.candidato_id= c.id = c.candidatos_id
 order by c.candidatos_id, e.estagio_id;

 
 
 
 
 
 
 
 
 