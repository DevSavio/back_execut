create database execut;
use execut;

create table usuario(
  idUsuario int auto_increment primary key,
  nomeUsuario varchar(100) not null,
  razaoSocial varchar(50) not null,
  logradouro varchar(50) not null,
  complemento varchar(100),
  cpfCnpj varchar(15) not null,
  telefone varchar(12) not null
); 
create table cliente(
  idCliente int auto_increment primary key,
  nomeCliente varchar(100) not null,
  razaoSocial varchar(50) not null,
  logradouro varchar(50) not null,
  complemento varchar(100),
  cpfCnpj varchar(15) not null,
  telefone varchar(12) not null
);  
create table tipo_mao_de_obra(
  idTipo int auto_increment primary key,
  nomeTipo varchar(20) not null,
  descricao varchar(50) not null
);  
create table tempo_de_obra(
  idTempo int auto_increment primary key,
  nomeTempo varchar(20) not null
);
create table tipo_de_fornecedor(
  idTipo int auto_increment primary key,
  nomeTipo varchar(50) not null,
  descricao varchar(80) not null
);
create table tipo_de_obra(
  idTipo int auto_increment primary key,
  nomeTipo varchar(50) not null,
  descricaoTipo varchar(80) not null
);    
create table origem_recurso(
  idOrigem int auto_increment primary key,
  tipoOrigem varchar(50) not null,
  percentual float
);    
create table pagamento(
  idPagamento int auto_increment primary key,
  tipoPagamento varchar(50) not null,
  moeda varchar(80)
);
create table funcao_prestador(
  idFuncao int auto_increment primary key,
  nomeFuncao varchar(40) not null,
  descricaoFuncao varchar(60) not null
);
create table fornecedor(
    idFornecedor int auto_increment primary key,
    razaoSocial varchar(100) not null,
    logradouro varchar(50) not null,
    complemento varchar(100),
    telefone varchar(12) not null,
    idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_de_fornecedor(idTipo)
);
create table prestador(
	idPrestador int auto_increment primary key,
	nomePrestador varchar(50) not null,
	tipoPrestador varchar(80),
	cpfCnpj varchar(15),
	telefone varchar(12),
	idFuncao int not null,
	FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao)
);
create table custo_prestador(
  idCusto int auto_increment primary key,
  valor float not null,
  idPrestador int not null,
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  idFuncao int not null,
  FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao)
);    
create table material_de_obra(
	idMaterial int auto_increment primary key,
	nomeMaterial varchar(50) not null,
	descricaoMaterial varchar(80),
	valor float not null,
	idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_de_obra(idTipo),
	idOrigem int not null,
	FOREIGN KEY (idOrigem) REFERENCES origem_recurso(idOrigem),
	idFornecedor int not null,
	FOREIGN KEY (idFornecedor) REFERENCES fornecedor(idFornecedor)
);
create table mao_de_obra(
	idMao int auto_increment primary key,
  	descricao varchar(40) not null,
	idTipo int not null,
	FOREIGN KEY (idTipo) REFERENCES tipo_mao_de_obra(idTipo),
	idPrestador int not null,
	FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
	idFuncao int not null,
	FOREIGN KEY (idFuncao) REFERENCES funcao_prestador(idFuncao)
);
create table obra(
	idObra int auto_increment primary key,
	valorFinal float not null,
	responsavelObra varchar(30) not null,
	dataInicio date not null,
	dataFim date not null,
	logradouro varchar(50) not null,
	complemento varchar(100),
	idCliente int not null,
	FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
	idPagamento int not null,
	FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
	idTempo int not null,
	FOREIGN KEY (idTempo) REFERENCES tempo_de_obra(idTempo),
	idPrestador int not null,
	FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador)
);
create table prestadorObra(
	idPrestadorObra int auto_increment primary key,
	idPrestador int not null,
	FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
	idObra int not null,
	FOREIGN KEY (idObra) REFERENCES obra(idObra)
);

INSERT INTO usuario (nomeUsuario, razaoSocial, logradouro, complemento, cpfCnpj, telefone)
VALUES ('Antônio Almeida', 'Execut Construções e Reformas', 'Rua J70, s/n', 'Quadra 13 Lote 20 Casa 01 Setor: Mansões Paraíso', '23132089000145', '62996551100');
INSERT INTO cliente (nomeCliente, razaoSocial, logradouro, complemento, cpfCnpj, telefone)
VALUES ('João Silva', 'JS Serviços', 'Rua das Flores, 123', 'Apto 45', '12345678901234', '11987654321');
INSERT INTO tipo_mao_de_obra (nomeTipo, descricao)
VALUES ('Eletricista', 'instalações elétricas');
INSERT INTO tempo_de_obra (nomeTempo)
VALUES ('Curto prazo');
INSERT INTO tipo_de_fornecedor (nomeTipo, descricao)
VALUES ('Material de construção', 'Fornecedor de materiais para construção civil');
INSERT INTO tipo_de_obra (nomeTipo, descricaoTipo)
VALUES ('Residencial', 'Obra destinada à construção de residências');
INSERT INTO origem_recurso (tipoOrigem, percentual)
VALUES ('Recursos próprios', 100.0);
INSERT INTO pagamento (tipoPagamento, moeda)
VALUES ('À vista', 'PIX');
INSERT INTO funcao_prestador (nomeFuncao, descricaoFuncao)
VALUES ('Encanador', 'Profissional responsável por instalações hidráulicas');
INSERT INTO fornecedor (razaoSocial, logradouro, complemento, telefone, idTipo)
VALUES ('ConstruTudo Ltda', 'Avenida Central, 456', 'Loja 10', '1133344556', 1);
INSERT INTO prestador (nomePrestador, tipoPrestador, cpfCnpj, telefone, idFuncao)
VALUES ('Maria Pereira', 'Autônomo', '98765432100', '23456789012345', '11999887766', 1);

INSERT INTO custo_prestador (valor, idPrestador, idFuncao)
VALUES (200.0, 1, 1);
INSERT INTO material_de_obra (nomeMaterial, descricaoMaterial, valor, idTipo, idOrigem, idFornecedor)
VALUES ('Cimento', 'Saco de cimento 50kg', 22.5, 1, 1, 1);
INSERT INTO mao_de_obra (descricao, idTipo, idPrestador, idFuncao)
VALUES ('Próprio', 1, 1, 1);
INSERT INTO obra (valorFinal, responsavelObra, dataInicio, dataFim, logradouro, complemento, idCliente, idPagamento, idTempo, idPrestador)
VALUES (50000.00, 'João Silva', '2024-01-01', '2024-12-31', 'Rua das Flores, 123', 'Apto 45', 1, 1, 1, 1);
INSERT INTO prestador_obra (idPrestador, idObra)
VALUES (1, 1);
 