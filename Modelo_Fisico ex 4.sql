create database produtos;

use produtos;

create table produtos (
ProdutoID int auto_increment primary key,
NomeProduto varchar(255),
Descricao text unique not null,
Preco float not null
);

insert into produtos (ProdutoID,NomeProduto,Descricao,Preco) values
("1", "Camisa", "Tamanho M", "80.00"),
("2", "Bermuda", "Tamanho P", "50.00"),
("3", "Regata", "Tamanho Extra GG", "40.00"),
("4", "Calca", "Tamanho G", "60.00"),
("5", "Jaqueta", "Tamanho GG", "70.00");

create table comentarios (
ComentarioID int auto_increment primary key,
Autor varchar(255),
TextoComentario text(45) unique not null,
DataComentario date not null,
ProdutoID int,
foreign Key (ProdutoID) references produtos (ProdutoID)
);

insert into comentarios (Autor,TextoComentario,DataComentario,ProdutoID) values
("Diogo", "Excelente Camisa", "2018-06-05",1),
("Andre", "Boa Bermuda", "2016-04-05",2),
("Matheus", "Grande Regata", "2019-03-05",3),
("Gabriel", "Otima Calca", "2020-07-05",4),
("Raul", "Perfeita Jaqueta", "2017-10-05",5);

insert into comentarios (Autor,TextoComentario,DataComentario,ProdutoID) values
("Gabriel", "Otima Calca00", "2020-07-05",4);

select
P.NomeProduto AS "Produto",
count(C.ComentarioID) AS "Quantidade de Comentário"
FROM produtos.produtos P
inner join produtos.comentarios C
ON P.ProdutoID = C.ProdutoID group by P.NomeProduto;












