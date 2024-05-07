A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Projeto teste de conexão com o banco de dados e implementação do backend para o projeto da faculdade com a empresa EXECUT

para rodar: dart run

rodando pela primeira vez: 
                            npm i mysql2
                            node index.js




/*  fazer o mesmo para as outras tabelas simples - de 16 a 50 , colocar no execute->main para testar e depois colocar no final deste arquivo


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

    //  clienteController.list();

    // clienteController.search(
    //     operator: "like", value: "'%Jo%'", paramter: "nomeCliente"); -->

<!-- usuario

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


<!-- TipoMaoDeObraController tipoMaoDeObraController = TipoMaoDeObraController();

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




--- 


