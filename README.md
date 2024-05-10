A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Projeto teste de conexão com o banco de dados e implementação do backend para o projeto da faculdade com a empresa EXECUT

para rodar: dart run

rodando pela primeira vez: 
                            npm i mysql2
                            node index.js




/*  fazer o mesmo para as outras tabelas simples - de 16 a 50 , colocar no execute->main para testar e depois colocar no final deste arquivo

cliente / usuario / tipoMaoDeObra /tempoDeObra / tipoDeFornecedor / origemRecurso / pagamento / funcaoPrestador / fornecedor / prestador

  <!-- // ClienteController clienteController = ClienteController();

    // clienteController.create(
    //   complemento: "'Apto 45'",
    //   cpfCnpj: "12345678901234",
    //   logradouro: "'Rua das Flores, 123'",
    //   nomeCliente: "'João Silva'",
    //   razaoSocial: "'JS Serviços'",
    //   telefone: "11987654321",
    // );

    // clienteController.readByID(
    //   idCliente: 9,
    // );

    // clienteController.update(
    //   complemento: "'Apto 1010'",
    //   cpfCnpj: "12345678901234",
    //   logradouro: "'Rua das Flores, 123'",
    //   nomeCliente: "'João Silva'",
    //   razaoSocial: "'JS Serviços'",
    //   telefone: "11987654321",
    //   idCliente: 8,
    // );

    // clienteController.delete(
    //   idCliente: 8,
    // );

    // clienteController.list();

    // clienteController.search(
    //     operator: "like", value: "'%Jo%'", paramter: "nomeCliente"); -->

<!--
    UsuarioController usuarioController = UsuarioController();

    usuarioController.create(
      complemento: "Quadra 13 Lote 20 Casa 01 Setor: Mansões Paraíso",
      cpfCnpj: "23132089000145",
      logradouro: "Rua J70, s/n",
      nomeUsuario: "Antônio Almeida",
      razaoSocial: "Execut Construções e Reformas",
      telefone: "62996551100",
    );

    usuarioController.readByID(
      idUsuario: 1,
    );

    usuarioController.update(
      complemento: "Quadra 13 Lote 20 Casa 01 Setor: Mansões Paraíso",
      cpfCnpj: "23132089000145",
      logradouro: "Rua J70, s/n",
      nomeUsuario: "Antônio Almeida de Souza",
      razaoSocial: "Execut Construções e Reformas",
      telefone: "62996551100",
      idUsuario: 1,
    );

    usuarioController.delete(
      idUsuario: 1,
    );

    usuarioController.list();

    usuarioController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomeCliente"); -->

<!-- 
TipoMaoDeObraController tipoMaoDeObraController = TipoMaoDeObraController();

    tipoMaoDeObraController.create(
       nomeTipo: "Eletricista",
       descricao: "instalações elétricas"
    );

    tipoMaoDeObraController.readByID(
      idTipo: 1,
    );

    tipoMaoDeObraController.update(
      nomeTipo: "",
      descricao: "",
      idTipo: 1,
    );

    tipoMaoDeObraController.delete(
      idTipo: 1,
    );

    tipoMaoDeObraController.list();

    tipoMaoDeObraController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomeCliente"); -->

<!--
    TempoDeObraController tempoDeObraController = TempoDeObraController();

    tempoDeObraController.create(
       nomeTempo: "Curto prazo",
    );

    tempoDeObraController.readByID(
      idTempo: 1,
    );

    tempoDeObraController.update(
      nomeTempo: "",
      idTempo: 1,
    );

    tempoDeObraController.delete(
      idTempo: 1,
    );

    tempoDeObraController.list();

    tempoDeObraController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomeCliente");
  -->

<!-- 
  TipoDeFornecedorController tipoDeFornecedorController = TipoDeFornecedorController();

  tipoDeFornecedorController.create(
      nomeTipo: "Material de construção",
      descricao: "Fornecedor de materiais para construção civil",
  );

  tipoDeFornecedorController.readByID(
    idTipo: 1,
  );

  tipoDeFornecedorController.update(
    nomeTipo: "Material elétrico",
    descricao: "Fornecedor de materiais para construção civil",
    idTipo: 1,
  );

  tipoDeFornecedorController.delete(
    idTipo: 1,
  );

  tipoDeFornecedorController.list();

  tipoDeFornecedorController.search(
      operator: "like", value: "'%Ex%'", paramter: "nomeCliente");
  -->

<!--
  OrigemRecursoController origemRecursoController = OrigemRecursoController();

  origemRecursoController.create(
      tipoOrigem: "Material de construção",
      percentual: "Fornecedor de materiais para construção civil",
  );

  origemRecursoController.readByID(
    idOrigem: 1,
  );

  origemRecursoController.update(
    tipoOrigem: "Material elétrico",
    percentual: "Fornecedor de materiais para construção civil",
    idOrigem: 1,
  );

  origemRecursoController.delete(
    idOrigem: 1,
  );

  origemRecursoController.list();

  origemRecursoController.search(
      operator: "like", value: "'%Ex%'", paramter: "nomeCliente");
-->

<!-- 
  PagamentoController pagamentoController = PagamentoController();

  pagamentoController.create(
    tipoPagamento: "À vista",
    moeda: "PIX",
  );

  pagamentoController.readByID(
    idPagamento: 1,
  );

  pagamentoController.update(
    tipoPagamento: "A prazo",
    moeda: "Cartão de Crédito 4x",
    idPagamento: 1,
  );

  pagamentoController.delete(
    idPagamento: 1,
  );

  pagamentoController.list();

  pagamentoController.search(
      operator: "like", value: "'%Ex%'", paramter: "tipoPagamento");
-->

<!--
FuncaoPrestadorController funcaoPrestadorController = FuncaoPrestadorController();
  funcaoPrestadorController.create(
    nomeFuncao: "Encanador",
    descricaoFuncao: "Profissional responsável por instalações hidráulicas",
  );

  funcaoPrestadorController.readByID(
    idFuncao: 1,
  );

  funcaoPrestadorController.update(
    nomeFuncao: "Técnico e Segurança do Trabalho",
    descricaoFuncao: "Responsável pela segurança da estrutura geral",
    idFuncao: 1,
  );

  funcaoPrestadorController.delete(
    idFuncao: 1,
  );

  funcaoPrestadorController.list();

  funcaoPrestadorController.search(
      operator: "like", value: "'%Ex%'", paramter: "tipoPagamento");
 -->

 <!--
 
 FornecedorController fornecedorController = FornecedorController();

    fornecedorController.create(
      complemento: "Quadra 13 Lote 20 Casa 01 Setor: Mansões Paraíso",
      logradouro: "Rua J70, s/n",
      nomeUsuario: "Antônio Almeida",
      razaoSocial: "Execut Construções e Reformas",
      telefone: "62996551100",
      idTipo: 1,
    );

    fornecedorController.readByID(
      idFornecedor: 1,
    );

    fornecedorController.update(
      complemento: "Loja 10",
      logradouro: "Avenida Central, 456",
      razaoSocial: "ConstruTudo Ltda",
      telefone: "1133344556",
      idTipo: 1,
      idFornecedor: 1
    );

    fornecedorController.delete(
      idFornecedor: 1,
    );

    fornecedorController.list();

    fornecedorController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomeCliente");
 -->

 <!--
 
  PrestadorController prestadorController = PrestadorController();

    prestadorController.create(
      nomePrestador: "Maria Pereira",
      tipoPrestador: "Autônomo",
      cpfCnpj: "23456789012345",
      telefone: "11999887766",
      idFuncao: 1,
    );

    prestadorController.readByID(
      idPrestador: 1,
    );

    prestadorController.update(
      nomePrestador: "Maria João",
      tipoPrestador: "Autônomo",
      cpfCnpj: "98765432100",
      telefone: "23456789012345",
      idFuncao: 1,
      idPrestador: 1
    );

    prestadorController.delete(
      idPrestador: 1,
    );

    prestadorController.list();

    prestadorController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomePrestador");
 
 -->




--- 


