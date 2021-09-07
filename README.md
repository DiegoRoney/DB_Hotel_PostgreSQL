# DB_Hotel_PostgreSQL

banco de dados
atv 2019

# 1. Sistema de uma agência de turismo:
O objetivo deste trabalho é projetar um sistema de vendas de
pacotes turísticos para uma agencia. o sistema contará com um
banco de dados central que será acessado por aplicações clientes,
rodando tanto dentro da própria companhia, quanto fora dela.

a. A transação central do sistema é a venda de pacotes turísticos.
uma venda é identificada por um código gerado pelo sistema
computacional, que depende a existência de vagas no pacote
escolhido pelo cliente. a venda é feita para um único cliente,
doqual se conhece o nome, cpf, rg, endereço e nro. do
passaporte, para pacotes internacionais.

b. o pacote turístico compreende um conjunto de atividades que
podem ser realizadas em uma única cidade destino, ou várias
cidades, que acontecerão em determinada data/hora. para
cada atividade, existe uma pequena descrição da mesma, e
para cada pacote, é descrito o nome do pacote, como por
exemplo “sul jovem”, ou “disney 2007”, como também suas
datas de início e término, bem como a quantidade de vagas
para o mesmo.

c. um pacote é identificado por um código e compreende também
os meios de transporte que serão utilizados em todo o período.
por exemplo, trecho aéreo João Pessoa –porto alegre, em 14
de julho de 2007 e São Paulo –João Pessoa, em 28 de julho de 
2007. e os trechos terrestres também que serão percorridos no
decorrer do período entre a saída dos passageiros até o seu
retorno a sua cidade de origem.

d. caso o pacote seja internacional, os valores serão
administrados na moeda americana. Além disso, tanto o
passaporte como o visto para o país de destino serão exigidos
no ato da compra do referido pacote.

e. a agencia conta com agentes para vendas de pacotes
nacionais e agentes para vendas de pacotes internacionais.
para cada cliente, é atribuído um único agente.