create database siteFernanda;
use siteFernanda;

/* cadastro e login */
create table if not exists usuario (
idUsuario int primary key auto_increment,
email varchar(45) not null,
senha varchar(45) not null
);

/* orçamento */
create table if not exists orcamento (
idOrcamento int primary key auto_increment not null,
idUsuario int,
quantPaginas int not null,
script tinyint(1) not null,
layout tinyint(1) not null,
prazo tinyint(10) not null,
visita tinyint(1) not null
);

/* orçamento para usuário */
create table if not exists usuario_has_orcamento (
idUsuarioOrcamento int not null primary key auto_increment,
idUsuario int,
idOrcamento int,
foreign key (idUsuario) references usuario (idUsuario),
foreign key (idOrcamento) references orcamento (idOrcamento)
);

/* pagamento */
create table if not exists pagamento (
idCompra int primary key auto_increment not null,
idOrcamento int,
nome varchar(30) not null,
cvv tinyint(3) not null,
numeroCartao int(16) not null,
vencimento datetime not null,
foreign key (idOrcamento) references orcamento (idOrcamento)
);

/* mensagem */
create table if not exists mensagem (
idMensagem int primary key auto_increment not null,
idUsuario int,
nome varchar(50) not null,
email varchar(50) not null,
projeto varchar(50) not null,
mensagem varchar(5000) not null,
foreign key (idUsuario) references usuario (idUsuario)
);

insert into usuario (email, senha) values 
('fernannda.azevedo@gmail.com','123456'),
('fernannda.azevedo@outlook.com', '654321'),
('fernannda.azevedo@hotmail.com', '987654'),
('nascimentoadalberto678@gmail.com', '123456'),
('nascimentoadalberto678@outlook.com', '654321');

insert into orcamento (quantPaginas, script, layout, prazo, visita) values
('4','1','0','1','1'),
('14','0','1','3','0'),
('5','0','0','1','0'),
('9','1','1','5','1');

insert into mensagem (nome, email, projeto, mensagem) values
('Fernanda Azevedo', 'fernannda.azevedo@gmail.com', 'CVitae', 'Este app está em desenvolvimento'),
('Adalberto Nascimento', 'nascimentoadalberto678@gmail.com', 'Florence', 'Este layout possui o objetivo de trazer medicina às pessoas com mais facilidade');