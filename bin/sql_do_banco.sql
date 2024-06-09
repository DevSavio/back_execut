create database execut;
use execut;

create table endereco(
	id INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    complemento VARCHAR(255),
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL );  
create table tipo_mao_de_obra(
	idTipo int auto_increment primary key,
    nomeTipo varchar(20) not null,
    descricao varchar(50) not null); 
create table tipo_de_fornecedor(
	idTipo int auto_increment primary key,
    nomeTipo varchar(50) not null,
    descricao varchar(80) not null);
create table tipo_de_obra(
	idTipo int auto_increment primary key,
    nomeTipo varchar(50) not null,
    descricaoTipo varchar(80) not null); 
create table origem_recurso(
	idOrigem int auto_increment primary key,
    tipoOrigem varchar(50) not null,
    valor double not null); 
create table pagamento(
	idPagamento int auto_increment primary key,
    tipoPagamento varchar(50) not null,
    moeda varchar(80)); 
create table funcao_prestador(
    idFuncao int auto_increment primary key,
    nomeFuncao varchar(40) not null,
    descricaoFuncao varchar(60) not null); 
create table usuario(
	idUsuario int auto_increment primary key,
    nomeUsuario varchar(100) not null,
    razaoSocial varchar(50) not null,
    cpfCnpj varchar(15) not null,
    telefone varchar(12) not null,
    idEndereco int,
    foreign key (idEndereco) references endereco(id)); 
create table cliente(
	idCliente int auto_increment primary key,
    nomeCliente varchar(100) not null,
    razaoSocial varchar(50) not null,
    cpfCnpj varchar(15) not null,
    telefone varchar(12) not null,
    idEndereco int,
    foreign key (idEndereco) references endereco(id)); 
create table fornecedor(
  idFornecedor int auto_increment primary key,
  razaoSocial varchar(100) not null,
  telefone varchar(12) not null,
  idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_de_fornecedor(idTipo),
  idEndereco int,
  foreign key (idEndereco) REFERENCES endereco(id));  
create table prestador(
	idPrestador int auto_increment primary key,
	nomePrestador varchar(50) not null,
	tipoPrestador varchar(80),
	cpfCnpj varchar(15),
	telefone varchar(12),
	idFuncao int not null,
	FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao)); 
create table custo_prestador(
	idCusto int auto_increment primary key,
  valor double not null,
  idPrestador int not null,
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  idFuncao int not null,
  FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao)); 
create table material_de_obra(
	idMaterial int auto_increment primary key,
	nomeMaterial varchar(50) not null,
	descricaoMaterial varchar(100),
	valor double not null,
	idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_de_obra(idTipo),
	idOrigem int not null,
	FOREIGN KEY (idOrigem) REFERENCES origem_recurso(idOrigem),
  idFornecedor int not null,
  FOREIGN KEY (idFornecedor) REFERENCES fornecedor(idFornecedor)); 
create table mao_de_obra(
	idMao int auto_increment primary key,
    descricao varchar(40) not null,
	idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_mao_de_obra(idTipo),
	idPrestador int not null,
	FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
	idFuncao int not null,
	FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao));  
create table obra(
	idObra int auto_increment primary key,
	valorFinal double not null,
	responsavelObra varchar(30) not null,
	dataInicio datetime not null,
	dataFim datetime not null,
	idCliente int not null,
	FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
	idPagamento int not null,
	FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
    idPrestador int not null,
    FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
    idEndereco int not null,
    FOREIGN KEY (idEndereco) REFERENCES endereco(id));  
create table prestador_obra(
	idPrestadorObra int auto_increment primary key,
	idPrestador int not null,
	FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
	idObra int not null,
	FOREIGN KEY (idObra) REFERENCES obra(idObra),
    dataInicio date not null,
    dataFim date not null); 

INSERT INTO endereco (logradouro, complemento, cidade, estado)
VALUES ('Rua dos Usuarios', 'Conjunto Usuario Apt A-101', 'Aparecida de Goiânia', 'GO'),
	     ('Rua dos Clientes', 'Conjunto Cliente Apt B-101', 'Aparecida de Goiânia', 'GO'),
       ('Rua dos Fornecedores', 'Conjunto Fornecedor Apt C-101', 'Goiânia', 'GO'),
       ('Rua das Obras', 'Conjunto Construção Apt D-101', 'Goiânia', 'GO');
INSERT INTO usuario (nomeUsuario, razaoSocial, cpfCnpj, telefone, idEndereco)
VALUES ('Antônio Almeida', 'Execut Construções e Reformas', '23132089000145', '62996551100', 1);
INSERT INTO cliente (nomeCliente, razaoSocial, cpfCnpj, telefone, idEndereco)
VALUES ('João Silva', 'JS Serviços', '12345678901234', '11987654321', 2);
INSERT INTO tipo_mao_de_obra (nomeTipo, descricao)
VALUES ('Eletricista', 'instalações elétricas');
INSERT INTO tipo_de_fornecedor (nomeTipo, descricao)
VALUES ('Material de construção', 'Fornecedor para construção civil');
INSERT INTO tipo_de_obra (nomeTipo, descricaoTipo)
VALUES ('Residencial', 'Obra destinada à construção de residências');
INSERT INTO origem_recurso (tipoOrigem, valor)
VALUES ('Recursos próprios', 27850.00);
INSERT INTO pagamento (tipoPagamento, moeda)
VALUES ('À vista', 'PIX');
INSERT INTO funcao_prestador (nomeFuncao, descricaoFuncao)
VALUES ('Encanador', 'Profissional responsável por instalações hidráulicas');
INSERT INTO fornecedor (razaoSocial, telefone, idTipo, idEndereco)
VALUES ('ConstruTudo Ltda', '1133344556', 1, 3);
INSERT INTO prestador (nomePrestador, tipoPrestador, cpfCnpj, telefone, idFuncao)
VALUES ('Maria Pereira', 'Autônomo', '98765432100', '234567890120', 1);
INSERT INTO custo_prestador (valor, idPrestador, idFuncao)
VALUES (200.0, 1, 1);
INSERT INTO material_de_obra (nomeMaterial, descricaoMaterial, valor, idTipo, idOrigem, idFornecedor)
VALUES ('Cimento', 'Saco de cimento 50kg', 22.5, 1, 1, 1);
INSERT INTO mao_de_obra (descricao, idTipo, idPrestador, idFuncao)
VALUES ('Próprio', 1, 1, 1);
INSERT INTO obra (valorFinal, responsavelObra, dataInicio, dataFim, idCliente, idPagamento, idPrestador, idEndereco)
VALUES (50000.00, 'João Silva', '2024-01-01', '2024-12-31', 1, 1, 1, 4);
INSERT INTO prestador_obra (idPrestador, idObra, dataInicio, dataFim)
VALUES (1, 1, '2024-04-01', '2024-07-01');