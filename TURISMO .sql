-- BANCO DE DADOS PARA AGENCIA DE TURISMO
-- DROP DATABASE "AG_TURISMO";


--A habilidade chega pelo uso e prática contínuos.
-- “Getting Started with SQL de Thomas Nield (O’Reilly). 
--Copyright 2016 Thomas Nield, 978-1-4919-3861-4”.

CREATE DATABASE "AG_TURISMO"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- TABELA CLIENTE

CREATE TABLE cliente(
    id serial primary key,
    nome varchar (40) not null,
    cpf integer not null,
    rg integer not null,
    endereco varchar (50) not null,
    passaporte integer,
    visto integer
)

-- TABELA agente de viagens

CREATE TABLE agente(
    id serial primary key,
    nome varchar (30) not null
)

-- TABELA atividade

CREATE TABLE atividade(
    id serial primary key,
    descricao varchar(50) not null,
    atv1 varchar(60) not null,
    atv2 varchar(60) not null,
    atv3 varchar(60) not null
)

-- TABELA pacote de viagens

CREATE TABLE pacote(
    id serial primary key,
    tipo varchar(40) not null,
    id_atividade integer not null,
    id_agente integer not null,
    data_inicio date,
    data_chegada date,
    quant integer not null,
    valor decimal (10,2),
    foreign key (id_agente) references agente(id),
    foreign key (id_atividade) references atividade(id)
)

-- INSERIR DADOS EM cliente
insert into cliente
    (nome, cpf, rg, endereco, passaporte, visto)
values
    ('Diego Roney', '12345600', '12365', 'Condeuba ba', '1234567', '1254'),
    ('Maria Viana', '15346551', '1274657', 'Rua 21 n 123, Cordeiros ba', '121157', '84445'),
    ('Karolina Souza', '546545580', '4651325', 'AV Davi n 152, Jacaraci ba', '1465215', '44454');

insert into cliente
    (nome, cpf, rg, endereco, passaporte, visto)
values
    ('João Brito Carvalho', '123458440', '012365', 'Vitoria da Conquista', '1246556', '154250');

-- conferir 
select * from public.cliente

-- inserir agente de viagens
insert into agente
    (nome)
values
    ('Paulo Sousa'),
    ('Erika Dias'),
    ('Bianca Ribeiro'),
    ('Thiago Neto')

-- conferir 
select * from public.agente

-- INSERIR atividade
insert into atividade
    (descricao, atv1, atv2, atv3)
values
    ('3 dias em Porto Seguro - BA', 'Passeio na Praia de Coroa Vermelha', 'Museu Indijena', ' Centro Histórico'),
    ('6 dias em Salvador - BA', '3 dias pelas praias mais famosas de Salvador', 'passeio de dois dias no Centro Histórico', ' um dia no zoologico'), 
    ('3 dias em São Paulo - SP', 'Passeio no Parque Ibirapuera', 'Passeio na Avenida Paulista', 'Museu de arte'),
    ('4 dias em NY USA', 'Primeiro dia Tour No Centro, Passeio Noturno', '2 dias  Tour No Brooklyn, Cruzeiro Fluvial', 'Estátua da Liberdade'),
    ('3 dias em Dallas USA', 'Museu de Arte Dallas', 'The Dallas World Aquarium', ' Arboredo de Dallas e Jardim Botânico'),
    ('PROMOÇÃO! UFPB', 'Conhecer a Univercidade Federal da Paraíba', 'Conhecer os Professores', 'Aulas de Banco de Dados e LPII'),
    ('3 dias em Condeúba - BA', 'Conhecer a Caatinga', 'Visita a Barragem de Condeúba', 'Visita a Igreja Matriz');
    
    -- inserir pacotes
insert into pacote
    (tipo, id_atividade, id_agente, data_inicio, data_chegada, quant, valor)
values
    ('Pacote Nacional', 1, 2, '2019-05-23', '2019-05-26', '20', '800.00');

 -- inserir mais pacotes
insert into pacote
    (tipo, id_atividade, id_agente, data_inicio, data_chegada, quant, valor)
values
    ('Pacote Nacional', 2, 3, '2019-06-01', '2019-06-06', '40', '2800.00'),
    ('Pacote Nacional', 3, 1, '2019-06-01', '2019-06-03', '25', '5300.00'),
    ('Pacote internacional', 4, 1, '2019-07-01', '2019-07-04', '15', '22800.00'),
    ('Pacote internacional', 5, 4, '2019-10-01', '2019-10-03', '20', '20800.00'),
    ('PROMOÇÃO! Pacote Nacional ', 6, 2, '2019-12-20', '2019-12-30', '12', '150.00'),
    ('Pacote Nacional ', 7, 3, '2020-01-20', '2020-01-30', '10', '100.00');

-- TABELA VENDA
CREATE TABLE VENDA(
    id serial primary key,
    id_agente integer not null,
    id_cliente integer not null,
    id_pacote integer not null,   
    foreign key (id_agente) references agente(id),
    foreign key (id_cliente) references cliente(id),
    foreign key (id_pacote) references pacote(id)
)

-- INSERIR UMA VENDA
insert into VENDA
    (id_agente, id_cliente, id_pacote)
values
    (1, 2, 3);
-- Foi vendido o pacote 1 = Pacote nacional para '3 dias em porto', 
-- o a gente de vendas foi Paulo Sousa, o cliente foi Maria Viana

-- INSERIR VARIAS VENDAS
insert into VENDA
    (id_agente, id_cliente, id_pacote)
values
    (3, 1, 4),
    (3, 1, 6),
    (4, 3, 3),
    (4, 2, 5),
    (2, 2, 7);

-- ATUALIZAR DADOS DE UM CLIENTE
UPDATE cliente SET nome = 'Diego Roney' WHERE id = 1
UPDATE cliente SET nome = 'Karolina Souza' WHERE id = 3

-- ATUALIZAR DADOS DE UM PACOTE DE VIAGENS O VALOR
UPDATE pacote SET valor = 1150.00 WHERE id = 1


--REMOVER UM CLIENTE
DELETE from cliente where id = 4

-- CONSULTAS
--consultar pacotes
SELECT * FROM public.pacote
--consultar clientes
SELECT * FROM public.cliente
--consultar atividades
SELECT * FROM public.atividade
--consultar vendas
SELECT * FROM public.venda
--consultar agente de viagem
SELECT * FROM public.agente

-- consulta detalhada das vendas / consulta com relacionamento
SELECT * FROM venda 
INNER JOIN cliente 
on venda.id_cliente = cliente.id

-- consulta detalhada das vendas / consulta com relacionamento
SELECT venda.id, cliente.nome, cpf, endereco, passaporte, visto, tipo, agente.nome, descricao, valor
FROM venda
    INNER JOIN cliente
    on venda.id_cliente = cliente.id
    INNER JOIN pacote
    on venda.id_pacote = pacote.id
    INNER JOIN agente
    on venda.id_agente = agente.id
    INNER JOIN atividade
    on venda.id_pacote = atividade.id

-- consulta detalhada das vendas / consulta pro promoção 

--pacote internacional

SELECT venda.id, cliente.nome, cpf, endereco, passaporte, visto, tipo, agente.nome, descricao, valor
FROM venda
    INNER JOIN cliente
    on venda.id_cliente = cliente.id
    INNER JOIN pacote
    on venda.id_pacote = pacote.id
    INNER JOIN agente
    on venda.id_agente = agente.id
    INNER JOIN atividade
    on venda.id_pacote = atividade.id

where tipo = 'Pacote internacional'

--pacote Nacional
SELECT venda.id, cliente.nome, cpf, endereco, passaporte, visto, tipo, agente.nome, descricao, valor
FROM venda
    INNER JOIN cliente
    on venda.id_cliente = cliente.id
    INNER JOIN pacote
    on venda.id_pacote = pacote.id
    INNER JOIN agente
    on venda.id_agente = agente.id
    INNER JOIN atividade
    on venda.id_pacote = atividade.id

where tipo = 'Pacote Nacional'

--pacote PROMOÇÃO
SELECT venda.id, cliente.nome, cpf, endereco, passaporte, visto, tipo, agente.nome, descricao, valor
FROM venda
    INNER JOIN cliente
    on venda.id_cliente = cliente.id
    INNER JOIN pacote
    on venda.id_pacote = pacote.id
    INNER JOIN agente
    on venda.id_agente = agente.id
    INNER JOIN atividade
    on venda.id_pacote = atividade.id

where tipo = 'PROMOÇÃO! Pacote Nacional '

-- descição dos pacotes com seus valores e atividades
SELECT tipo, quant, descricao, atv1, atv2, atv3, valor
FROM pacote
    INNER JOIN atividade
    on pacote.id_atividade = pacote.id
    







