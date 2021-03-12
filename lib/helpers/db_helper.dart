import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:box/utilities/constants.dart';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;
  static final String dbDatabase = Constants.dbDatabase;
  static final String dbSite = Constants.tbSite;
  static final String dbFtp = Constants.tbFtp;
  static final String dbEmpresas = Constants.tbEmpresas;
  static final String dbGrupoEmpresas = Constants.tbGrupoEmpresas;
  static final String dbNivelAcesso = Constants.tbNivelAcesso;
  static final String dbUsuarios = Constants.tbUsuarios;
  static final String dbEmpresasUsuarios = Constants.tbEempresasUsuarios;
  static final String dbClientes = Constants.tbClientes;
  static final String dbEmpresasClientes = Constants.tbEmpresasClientes;
  static final String dbGrupoCliente = Constants.tbGrupoClientes;
  static final String dbRankingClientes = Constants.tbRankingClientes;
  static final String dbClientesSemCompra = Constants.tbClientesSemCompra;
  static final String dbAcessoCliente = Constants.tbAcessoCliente;
  static final String dbProdutos = Constants.tbProdutos;
  static final String dbGrupoProdutos = Constants.tbGrupoProdutos;
  static final String dbRankingProdutos = Constants.tbRankingProdutos;
  static final String dbEstoqueProdutos = Constants.tbEstoqueProdutos;
  static final String dbBloqueioProdutos = Constants.tbBloqueioProdutos;
  static final String dbAcessoProdutos = Constants.tbAcessoProduto;
  static final String dbRota = Constants.tbRota;
  static final String dbTabelaPreco = Constants.tbTabelaPreco;
  static final String dbTabelaPrecoProduto = Constants.tbTabelaPrecoProduto;
  static final String dbTabelaPrecoEmpresa = Constants.tbTabelaPrecoEmpresa;
  static final String dbTabelaPrecoCliente = Constants.tbTabelaPrecoCliente;
  static final String dbFinanceiro = Constants.tbFinanceiro;
  static final String dbTitulos = Constants.tbTitulos;
  static final String dbRetornoPedido = Constants.tbRetornoPedido;
  static final String dbRetornoPedidoItens = Constants.tbRetornoPedidoItens;
  static final String dbTipoCobranca = Constants.tbTipoCobranca;
  static final String dbAgenteCobrador = Constants.tbAgenteCobrador;
  static final String dbCondicoesPagamento = Constants.tbCondicoesPagamento;
  static final String dbVendas = Constants.tbVendas;
  static final String dbVendasItens = Constants.tbVendasItens;
  static final String dbTransportadora = Constants.tbTransportadora;
  static final String dbUnidadeMedida = Constants.tbUnidadeMedida;
  static final String dbTipoPedido = Constants.tbTipoPedido;
  static final String dbTipoDocumento = Constants.tbTipoDocumento;
  static final String dbDesconto = Constants.tbDesconto;
  static final String dbFormaPagamento = Constants.tbFormaPagamento;
  static final String dbPrazo = Constants.tbPrazo;
  static final String dbFrete = Constants.tbFrete;
  static final String dbUltimasCompras = Constants.tbUltimasCompras;
  static final String dbUltimasComprasItens = Constants.tbUltimaComprasItens;
  static final String dbSincronizacao = Constants.tbSincronizacao;
  static final String dbLocalizacao = Constants.tbLocalizacao;
  static final String dbLogErro = Constants.tbLogErro;
  static final String dbBancos = Constants.tbBancos;

  // SITE
  static final String _createSite = "CREATE TABLE IF NOT EXISTS " +
      dbSite +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "site text NOT NULL, " +
      "licensa text);";

  // FTP
  static final String createFtp = "CREATE TABLE IF NOT EXISTS " +
      dbFtp +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "descricao text NOT NULL, " +
      "endereco text NOT NULL, " +
      "usuario text NOT NULL, " +
      "senha text," +
      "ativo bit);";

  // EMPRESAS
  static final String createEmpresas = "CREATE TABLE IF NOT EXISTS " +
      dbEmpresas +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "razao_social text(100) NOT NULL, " +
      "nome_fantasia text(100) NOT NULL," +
      "selecionada int);";
  static final String createIndexEmpresaCodigo =
      "CREATE UNIQUE INDEX index_empresa_codigo ON " +
          dbEmpresas +
          " (codigo);";

  // GRUPO EMPRESAS
  static final String createGrupoEmpresas = "CREATE TABLE IF NOT EXISTS " +
      dbGrupoEmpresas +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_empresa int NOT NULL, " +
      "nome text NOT NULL, " +
      "descricao text(250)," +
      "data_fundacao text(10)," +
      "endereco text(50)," +
      "bairro text(30)," +
      "municipio text(30)," +
      "uf character(2)," +
      "cep character(10)," +
      "fone text(20)," +
      "whatsapp text(20)," +
      "email text(40)," +
      "endereco_eletronico text," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo));";
  static final String createIndexGrupoEmpresasCodigoEmpresa =
      "CREATE UNIQUE INDEX index_grupo_empresas_codigo_empresa ON " +
          dbGrupoEmpresas +
          " (codigo_empresa);";

  // NIVEL ACESSO
  static final String createNivelAcesso = "CREATE TABLE IF NOT EXISTS " +
      dbNivelAcesso +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "nome text NOT NULL);";
  static final String createIndexNivelAcessoNivel =
      "CREATE INDEX index_nivel_acesso_nivel ON " +
          dbNivelAcesso +
          " (codigo);";

  // USUÁRIO
  static final String createUsuario = "CREATE TABLE IF NOT EXISTS " +
      dbUsuarios +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "nome text NOT NULL, " +
      "login text NOT NULL, " +
      "senha text, " +
      "imei text NOT NULL, " +
      "nivel_acesso int NOT NULL, " +
      "usuario_superior int, " +
      "admin bit, " +
      "ativo bit);";
  static final String createIndexUsuarioCodigo =
      "CREATE UNIQUE INDEX index_usuario_codigo ON " +
          dbUsuarios +
          " (codigo);";
  static final String createIndexUsuarioNivelAcesso =
      "CREATE INDEX index_usuario_nivel_acesso ON " +
          dbUsuarios +
          " (nivel_acesso);";
  static final String createIndexUsuarioSuperior =
      "CREATE INDEX index_usuario_usuario_superior ON " +
          dbUsuarios +
          " (usuario_superior);";
  static final String createIndexUsuarioAtivo =
      "CREATE INDEX index_usuario_ativo ON " + dbUsuarios + " (ativo);";

  // EMPRESA USUARIO
  static final String createEmpresaUsuario = "CREATE TABLE IF NOT EXISTS " +
      dbEmpresasUsuarios +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int, " +
      "codigo_empresa int," +
      "meta_venda text," +
      "meta_visita int," +
      "FOREIGN KEY (codigo_usuario) REFERENCES " +
      dbUsuarios +
      "(codigo)," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbUsuarios +
      "(codigo));";
  static final String createIndexEmpresaUsuarioCodigoUsuario =
      "CREATE INDEX index_empresa_usuario_codigo_usuario ON " +
          dbEmpresasUsuarios +
          " (codigo_usuario);";
  static final String createIndexEmpresaUsuarioCodigoEmpresa =
      "CREATE INDEX index_empresa_usuario_codigo_empresa ON " +
          dbEmpresasUsuarios +
          " (codigo_empresa);";

  // FIM TABELAS FUNDAMENTAIS/NECESSÁRIAS PARA INICIAR O APLICATIVO

  // CLIENTE
  static final String createCliente = "CREATE TABLE IF NOT EXISTS " +
      dbClientes +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int NOT NULL, " +
      "codigo int NOT NULL, " +
      "codigo_grupo int NOT NULL, " +
      "tipo character(1) NOT NULL, " +
      "razao_social text NOT NULL, " +
      "nome_fantasia text NOT NULL, " +
      "cpf_cnpj text NOT NULL, " +
      "insc_estadual text, " +
      "endereco text NOT NULL, " +
      "bairro text NOT NULL, " +
      "municipio text NOT NULL, " +
      "uf character(2) NOT NULL, " +
      "data_cadastro text, " +
      "cep character(10), " +
      "fone text, " +
      "whatsapp text, " +
      "contato text, " +
      "email text, " +
      "observacao text, " +
      "situacao bit," +
      "FOREIGN KEY (codigo_usuario) REFERENCES " +
      dbUsuarios +
      "(codigo_usuario)," +
      "FOREIGN KEY (codigo_grupo) REFERENCES " +
      dbGrupoCliente +
      "(codigo_grupo));";
  static final String createIndexClienteCodigoUsuario =
      "CREATE INDEX index_cliente_codigo_usuario ON " +
          dbClientes +
          " (codigo_usuario);";
  static final String createIndexClienteCodigo =
      "CREATE UNIQUE INDEX index_cliente_codigo ON " +
          dbClientes +
          " (codigo);";
  static final String createIndexClienteCodigoGrupo =
      "CREATE INDEX index_cliente_codigo_grupo ON " +
          dbClientes +
          " (codigo_grupo);";
  static final String createIndexClienteSituacao =
      "CREATE INDEX index_cliente_situacao ON " + dbClientes + " (situacao);";

  // EMPRESA CLIENTE
  static final String createEmpresaCliente = "CREATE TABLE IF NOT EXISTS " +
      dbEmpresasClientes +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "codigo_cliente int NOT NULL," +
      "FOREIGN KEY (codigo_usuario) REFERENCES " +
      dbUsuarios +
      "(codigo), " +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo), " +
      "FOREIGN KEY (codigo_cliente) REFERENCES " +
      dbClientes +
      "(codigo)); ";
  static final String createIndexEmpresaClienteCodigoUsuario =
      "CREATE INDEX index_empresa_cliente_codigo_usuario ON " +
          dbEmpresasClientes +
          " (codigo_usuario);";
  static final String createIndexEmpresaClienteCodigoEmpresa =
      "CREATE INDEX index_empresa_cliente_codigo_empresa ON " +
          dbEmpresasClientes +
          " (codigo_empresa);";
  static final String createIndexEmpresaClienteCodigoCliente =
      "CREATE INDEX index_empresa_cliente_codigo_cliente ON " +
          dbEmpresasClientes +
          " (codigo_cliente);";

  // GRUPO CLIENTE
  static final String createGrupoCliente = "CREATE TABLE IF NOT EXISTS " +
      dbGrupoCliente +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";
  static final String createIndexGrupoClienteCodigo =
      "CREATE UNIQUE INDEX index_grupo_cliente_codigo ON " +
          dbGrupoCliente +
          " (codigo);";

  // RANKING CLIENTE
  static final String createRankingCliente = "CREATE TABLE IF NOT EXISTS " +
      dbRankingClientes +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_cliente int, " +
      "codigo_empresa int, " +
      "valor decimal(9,2), " +
      "pedidos int, " +
      "valor_anterior decimal(9,2), " +
      "atuacao decimal(9,2));";
  static final String createIndexRankingClienteCodigoCliente =
      "CREATE INDEX index_ranking_cliente_codigo_cliente ON " +
          dbRankingClientes +
          " (codigo_cliente);";
  static final String createIndexRankingClienteCodigoEmpresa =
      "CREATE INDEX index_ranking_cliente_codigo_empresa ON " +
          dbRankingClientes +
          " (codigo_empresa);";

  // ACESSO CLIENTE
  static final String createAcessoCliente = "CREATE TABLE IF NOT EXISTS " +
      dbAcessoCliente +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_cliente int NOT NULL, " +
      "acessos int NOT NULL DEFAULT 0," +
      "data text," +
      "hora text," +
      "FOREIGN KEY (codigo_cliente) REFERENCES " +
      dbClientes +
      "(codigo));";
  static final String createIndexAcessoClienteCodigoCliente =
      "CREATE INDEX index_acesso_cliente_codigo_cliente ON " +
          dbAcessoCliente +
          " (codigo_cliente);";

  // CLIENTE SEM COMPRA
  static final String createClienteSdemCompra = "CREATE TABLE IF NOT EXISTS " +
      dbClientesSemCompra +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int, " +
      "codigo_cliente int);";
  static final String createIndexClienteSemCompraCodigoUsuario =
      "CREATE INDEX index_cliente_sem_compra_codigo_usuario ON " +
          dbClientesSemCompra +
          " (codigo_usuario);";
  static final String createIndexClienteSemCompraCodigoCliente =
      "CREATE INDEX index_cliente_sem_compra_codigo_cliente ON " +
          dbClientesSemCompra +
          " (codigo_cliente);";

  // PRODUTO
  static final String createProduto = "CREATE TABLE IF NOT EXISTS " +
      dbProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "codigo_empresa int NOT NULL," +
      "codigo_unidade int NOT NULL, " +
      "codigo_grupo int NOT NULL," +
      "nome text NOT NULL, " +
      "codigo_alternativo text, " +
      "descricao text, " +
      "data_cadastro text, " +
      "ncm text, " +
      "peso_bruto text, " +
      "peso_liquido text, " +
      "estoque_minimo int, " +
      "estoque_maximo int, " +
      "multiplicidade int, " +
      "codigo_ean text, " +
      "codigo_ean_tributavel text," +
      "foto bit," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo)," +
      "FOREIGN KEY (codigo_unidade) REFERENCES " +
      dbUnidadeMedida +
      "(codigo)," +
      "FOREIGN KEY (codigo_grupo) REFERENCES " +
      dbGrupoProdutos +
      "(codigo));";
  static final String createIndexProdutoCodigo =
      "CREATE INDEX index_produto_codigo ON " + dbProdutos + " (codigo);";
  static final String createIndexProdutoCodigoEmpresa =
      "CREATE INDEX index_produto_codigo_empresa ON " +
          dbProdutos +
          " (codigo_empresa);";
  static final String createIndexProdutoCodigoUnidade =
      "CREATE INDEX index_produto_codigo_unidade ON " +
          dbProdutos +
          " (codigo_unidade);";
  static final String createIndexProdutoCodigoGrupo =
      "CREATE INDEX index_produto_codigo_grupo ON " +
          dbProdutos +
          " (codigo_grupo);";

  // GRUPO PRODUTO
  static final String createGrupoProduto = "CREATE TABLE IF NOT EXISTS " +
      dbGrupoProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";
  static final String createIndexGrupoProdutoCodigo =
      "CREATE UNIQUE INDEX index_grupo_produto_codigo ON " +
          dbGrupoProdutos +
          " (codigo);";

  // BLOQUEIO PRODUTO
  static final String createBloqueioProduto = "CREATE TABLE IF NOT EXISTS " +
      dbBloqueioProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "codigo_produto int NOT NULL, " +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo)," +
      "FOREIGN KEY (codigo_produto) REFERENCES " +
      dbProdutos +
      "(codigo));";
  static final String createIndexBloqeuioProdutoCodigoUsuario =
      "CREATE INDEX index_bloqueio_produto_codigo_usuario ON " +
          dbBloqueioProdutos +
          " (codigo_usuario);";
  static final String createIndexBloqeuioProdutoCodigoUsuarioEmpresa =
      "CREATE INDEX index_bloqueio_produto_codigo_empresa ON " +
          dbBloqueioProdutos +
          " (codigo_empresa);";
  static final String createIndexBloqeuioProdutoCodigoUsuarioProduto =
      "CREATE INDEX index_bloqueio_produto_codigo_produto ON " +
          dbBloqueioProdutos +
          " (codigo_produto);";

  // ACESSO PRODUTO
  static final String createAcessoProduto = "CREATE TABLE IF NOT EXISTS " +
      dbAcessoProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_produto int NOT NULL, " +
      "acessos int NOT NULL DEFAULT 0," +
      "data text," +
      "hora text," +
      "FOREIGN KEY (codigo_produto) REFERENCES " +
      dbProdutos +
      "(codigo));";
  static final String createIndexAcessoProdutoCodigoProduto =
      "CREATE INDEX index_acesso_produto_codigo_produto ON " +
          dbAcessoProdutos +
          " (codigo_produto);";

  // ROTA
  static final String createRota = "CREATE TABLE IF NOT EXISTS " +
      dbRota +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "codigo_usuario int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "codigo_cliente int NOT NULL, " +
      "tipo int NOT NULL, " + // 1=AGENDAMENTO, 2=REAGENDAMENTO
      "status int NOT NULL, " + // 1=NÃO INICIADO, 2=EM ANDAMENTO, 3=CONCLUIDO, 4=CANCELADO
      "data_agendamento text NOT NULL, " +
      "hora_agendamento text NOT NULL, " +
      "proprietario INT NOT NULL, " + // 1=AGENDA, 2=PESSOAL
      "responsavel string, " +
      "ordem int, " +
      "observacao string, " +
      "data_inicio text, " +
      "hora_inicio text, " +
      "data_fim text, " +
      "hora_fim text, " +
      "reagendamento int, " + // CODIGO AGENDAMENTO ANTERIOR
      "data_reagendamento text, " +
      "hora_reagendamento text, " +
      "situacao int, " + // 1=POSITIVADO, 2=NEGATIVADO
      "negativacao string, " + // MOTIVO DA NEGATIVAÇÃO
      "cancelamento string, " + // MOTIVO DO CANCELAMENTO
      "FOREIGN KEY (codigo_usuario) REFERENCES " +
      dbUsuarios +
      "(codigo)," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo)," +
      "FOREIGN KEY (codigo_cliente) REFERENCES " +
      dbClientes +
      "(codigo));";
  static final String createIndexRotaCodigo =
      "CREATE INDEX index_rota_codigo ON " + dbRota + " (codigo);";
  static final String createIndexRotaCodigoUsuario =
      "CREATE INDEX index_rota_codigo_usuario ON " +
          dbRota +
          " (codigo_usuario);";
  static final String createIndexRotaCodigoEmpresa =
      "CREATE INDEX index_rota_codigo_empresa ON " +
          dbRota +
          " (codigo_empresa);";
  static final String createIndexRotaCodigoCliente =
      "CREATE INDEX index_rota_codigo_cliente ON " +
          dbRota +
          " (codigo_cliente);";

  // ESTOQUE PRODUTO
  static final String createEstoqueProduto = "CREATE TABLE IF NOT EXISTS " +
      dbEstoqueProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_produto int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "codigo_unidade_medida int NOT NULL, " +
      "estoque int, " +
      "estoque_min int, " +
      "estoque_max int, " +
      "FOREIGN KEY (codigo_produto) REFERENCES " +
      dbProdutos +
      "(codigo)," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo)," +
      "FOREIGN KEY (codigo_unidade_medida) REFERENCES " +
      dbUnidadeMedida +
      "(codigo));";
  static final String createIndexEstoqueProdutoCodigoProduto =
      "CREATE INDEX index_estoque_produto_codigo_produto ON " +
          dbEstoqueProdutos +
          " (codigo_produto);";
  static final String createIndexEstoqueProdutoCodigoEmpresa =
      "CREATE INDEX index_estoque_produto_codigo_empresa ON " +
          dbEstoqueProdutos +
          " (codigo_empresa);";
  static final String createIndexEstoqueProdutoCodigoUnidadeMedida =
      "CREATE INDEX index_estoque_produto_codigo_unidade_medida ON " +
          dbEstoqueProdutos +
          " (codigo_unidade_medida);";

  // VENDAS
  static final String createVendas = "CREATE TABLE IF NOT EXISTS " +
      dbVendas +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "data text," +
      "valor numeric," +
      "valor_desconto numeric);";
  static final String createIndexVendasCodigoUsuario =
      "CREATE INDEX index_vendas_codigo_usuario ON " +
          dbVendas +
          " (codigo_usuario);";
  static final String createIndexVendasCodigoEmpresa =
      "CREATE INDEX index_vendas_codigo_empresa ON " +
          dbVendas +
          " (codigo_empresa);";

  // RANKING PRODUTO
  static final String createRankingProduto = "CREATE TABLE IF NOT EXISTS " +
      dbRankingProdutos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_produto int, " +
      "quantidade decimal(9,2), " +
      "quantidade_anterior decimal(9,2), " +
      "pedidos int, " +
      "atuacao decimal(9,2), " +
      "codigo_unidade int, " +
      "codigo_grupo int);";

  // FINANCEIRO
  static final String createFinanceiro = "CREATE TABLE IF NOT EXISTS " +
      dbFinanceiro +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_cliente int, " +
      "limite_credito decimal(9,2), " +
      "saldo decimal(9,2), " +
      "maior_compra decimal(9,2), " +
      "data_maior_compra string, " +
      "ultima_compra decimal(9,2), " +
      "data_ultima_compra string);";

  // TITULOS
  static final String createTitulos = "CREATE TABLE IF NOT EXISTS " +
      dbTitulos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int NOT NULL, " +
      "codigo_usuario NOT NULL, " +
      "codigo_cliente int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "numero text NOT NULL, " +
      "data_emissao text NOT NULL, " +
      "data_vencimento text NOT NULL, " +
      "codigo_agente_cobrador int NOT NULL, " +
      "codigo_tipo_cobranca int NOT NULL, " +
      "vendedor text, " +
      "valor text, " +
      "saldo text, " +
      "juros text, " +
      "situacao int, " + // 1=A VENCER, 2=VENCIDO
      "FOREIGN KEY (codigo_usuario) REFERENCES " +
      dbUsuarios +
      "(codigo)," +
      "FOREIGN KEY (codigo_cliente) REFERENCES " +
      dbClientes +
      "(codigo)," +
      "FOREIGN KEY (codigo_empresa) REFERENCES " +
      dbEmpresas +
      "(codigo));";
  static final String createIndexTituloCodigo =
      "CREATE INDEX index_estoque_titulo_codigo ON " + dbTitulos + " (codigo);";
  static final String createIndexTituloCodigoUsuario =
      "CREATE INDEX index_titulo_codigo_usuario ON " +
          dbTitulos +
          " (codigo_usuario);";
  static final String createIndexTituloCodigoCliente =
      "CREATE INDEX index_titulo_codigo_cliente ON " +
          dbTitulos +
          " (codigo_cliente);";
  static final String createIndexTituloCodigoEmpresa =
      "CREATE INDEX index_titulo_codigo_empresa ON " +
          dbTitulos +
          " (codigo_empresa);";
  static final String createIndexTituloCodigoAgenteCobrador =
      "CREATE INDEX index_titulo_codigo_agente_cobrador ON " +
          dbTitulos +
          " (codigo_agente_cobrador);";
  static final String createIndexTituloCodigoTipoCobranca =
      "CREATE INDEX index_titulo_codigo_tipo_cobranca ON " +
          dbTitulos +
          " (codigo_tipo_cobranca);";

  // RETORNO PEDIDO
  static final String createRetornoPedido = "CREATE TABLE IF NOT EXISTS " +
      dbRetornoPedido +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_cliente int, " +
      "codigo_pedido int, " +
      "numero_pedido_mobile text, " +
      "data_pedido text, " +
      "valor_pedido decimal(9,2), " +
      "valor_desconto decimal(9,2), " +
      "codigo_tipo_pedido int," +
      "codigo_prazo int," +
      "situacao int);";

  // RETORNO PEDIDO ITENS
  static final String createRetornoPedidoItens = "CREATE TABLE IF NOT EXISTS " +
      dbRetornoPedidoItens +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_pedido int, " +
      "codigo_produto int, " +
      "codigo_unidade int," +
      "quantidade int," +
      "valor decimal(9,2), " +
      "valor_desconto decimal(9,2));";

  // TIPO COBRANCA
  static final String createTipoCobranca = "CREATE TABLE IF NOT EXISTS " +
      dbTipoCobranca +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // AGENTE COBRADOR
  static final String createAgenteCobrador = "CREATE TABLE IF NOT EXISTS " +
      dbAgenteCobrador +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // CONDICOES PAGAMENTO
  static final String creteCondicoesPagamento = "CREATE TABLE IF NOT EXISTS " +
      dbCondicoesPagamento +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // TABELA PRECO
  static final String createTabelaPreco = "CREATE TABLE IF NOT EXISTS " +
      dbTabelaPreco +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";
  static final String createIndexTabelaPrecoCodigo =
      "CREATE INDEX index_tabela_preco_codigo ON " +
          dbTabelaPreco +
          " (codigo);";

  // TABELA PRECO EMPRESA
  static final String createTabelaPrecoEmpresa = "CREATE TABLE IF NOT EXISTS " +
      dbTabelaPrecoEmpresa +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_tabela int, " +
      "codigo_tabela_empresa int, " +
      "codigo_empresa int); ";
  static final String createIndexTabelaPrecoEmpresaCodigoTabela =
      "CREATE INDEX index_tabela_preco_empresa_codigo_tabela ON " +
          dbTabelaPrecoEmpresa +
          " (codigo_tabela);";
  static final String createIndexTabelaPrecoEmpresaCodigoTabelaEmoresa =
      "CREATE INDEX index_tabela_preco_empresa_codigo_tabela_empresa ON " +
          dbTabelaPrecoEmpresa +
          " (codigo_tabela_empresa);";
  static final String createIndexTabelaPrecoEmpresaCodigoEmpresa =
      "CREATE INDEX index_tabela_preco_empresa_codigo_empresa ON " +
          dbTabelaPrecoEmpresa +
          " (codigo_empresa);";

  // TABELA PRECO PRODUTO
  static final String createTabelaPrecoProduto = "CREATE TABLE IF NOT EXISTS " +
      dbTabelaPrecoProduto +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_tabela int, " +
      "codigo_empresa int, " +
      "codigo_produto int, " +
      "codigo_unidade int, " +
      "preco decimal(9,2), " +
      "quantidade_minima int, " +
      "quantidade_maxima int, " +
      "valor_desconto decimal(9,2));";
  static final String createIndexTabelaPrecorodutoCodigoTabela =
      "CREATE INDEX index_tabela_preco_produto_codigo_tabela ON " +
          dbTabelaPrecoProduto +
          " (codigo_tabela);";
  static final String createIndexTabelaPrecorodutoCodigoEmpresa =
      "CREATE INDEX index_tabela_preco_produto_codigo_empresa ON " +
          dbTabelaPrecoProduto +
          " (codigo_empresa);";
  static final String createIndexTabelaPrecorodutoCodigoProduto =
      "CREATE INDEX index_tabela_preco_produto_codigo_produto ON " +
          dbTabelaPrecoProduto +
          " (codigo_produto);";
  static final String createIndexTabelaPrecorodutoCodigoUnidade =
      "CREATE INDEX index_tabela_preco_produto_codigo_unidade ON " +
          dbTabelaPrecoProduto +
          " (codigo_unidade);";

  // TRANSPORTADORA
  static final String createTransportadora = "CREATE TABLE IF NOT EXISTS " +
      dbTransportadora +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // UNIDADE MEDIDA
  static final String createUnidadeMedida = "CREATE TABLE IF NOT EXISTS " +
      dbUnidadeMedida +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string," +
      "sigla char(3));";

  // TIPO PEDIDO
  static final String createTipoPedido = "CREATE TABLE IF NOT EXISTS " +
      dbTipoPedido +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // TIPO DOCUMENTO
  static final String createTipoDocumento = "CREATE TABLE IF NOT EXISTS " +
      dbTipoDocumento +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string);";

  // DESCONTO
  static final String createDesconto = "CREATE TABLE IF NOT EXISTS " +
      dbDesconto +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_vendedor int, " +
      "perc_desconto decimal(9,2));";

  // PRAZO
  static final String createPrazo = "CREATE TABLE IF NOT EXISTS " +
      dbPrazo +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo int, " +
      "nome string, " +
      "prazo_venda int);";

  // PRECO CLIENTE
  static final String createTabelaPrecoCliente = "CREATE TABLE IF NOT EXISTS " +
      dbTabelaPrecoCliente +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_tabela int, " +
      "condicao_cliente);";

  // ULTIMAS COMPRAS
  static final String createUltimasCompras = "CREATE TABLE IF NOT EXISTS " +
      dbUltimasCompras +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_usuario int NOT NULL, " +
      "codigo int NOT NULL, " +
      "codigo_empresa int NOT NULL, " +
      "codigo_cliente int NOT NULL, " +
      "codigo_tipo_cobranca int NOT NULL, " +
      "codigo_agente_cobrador int NOT NULL, " +
      "codigo_prazo int, " +
      "data text, " +
      "vendedor string, " +
      "valor decimal(9,2), " +
      "valor_desconto decimal(9,2));";
  static final String createIndexUltimasComprasCodigoUsuario =
      "CREATE INDEX index_ultimas_compras_codigo_usuario ON " +
          dbUltimasCompras +
          " (codigo_usuario);";
  static final String createIndexUltimasComprasCodigo =
      "CREATE UNIQUE INDEX index_ultimas_compras_codigo ON " +
          dbUltimasCompras +
          " (codigo);";
  static final String createIndexUltimasComprasCodigoEMPRESA =
      "CREATE INDEX index_ultimas_compras_codigo_empresa ON " +
          dbUltimasCompras +
          " (codigo_empresa);";
  static final String createIndexUltimasComprasCodigoCliente =
      "CREATE INDEX index_ultimas_compras_codigo_cliente ON " +
          dbUltimasCompras +
          " (codigo_cliente);";
  static final String createIndexUltimasComprasCodigoTipoCobranca =
      "CREATE INDEX index_ultimas_compras_codigo_tipo_cobranca ON " +
          dbUltimasCompras +
          " (codigo_tipo_cobranca);";
  static final String createIndexUltimasComprasCodigoAgenteCobrador =
      "CREATE INDEX index_ultimas_compras_codigo_agente_cobrador ON " +
          dbUltimasCompras +
          " (codigo_agente_cobrador);";
  static final String createIndexUltimasComprasCodigoPrazo =
      "CREATE INDEX index_ultimas_compras_codigo_prazo ON " +
          dbUltimasCompras +
          " (codigo_prazo);";

  // ULTIMAS COMPRAS ITENS
  static final String createUltimasComprasItens =
      "CREATE TABLE IF NOT EXISTS " +
          dbUltimasComprasItens +
          " (" +
          "_id integer PRIMARY KEY AUTOINCREMENT, " +
          "codigo_usuario int NOT NULL, " +
          "codigo int NOT NULL, " +
          "codigo_produto int NOT NULL, " +
          "codigo_unidade int NOT NULL, " +
          "quantidade int," +
          "preco decimal(9,2)," +
          "valor decimal(9,2)," +
          "valor_desconto decimal(9,2));";
  static final String createIndexUltimasComprasItensCodigoUsuario =
      "CREATE INDEX index_ultimas_compras_itens_codigo_usuario ON " +
          dbUltimasComprasItens +
          " (codigo_usuario);";
  static final String createIndexUltimasComprasItensCodigo =
      "CREATE INDEX index_ultimas_compras_itens_codigo ON " +
          dbUltimasComprasItens +
          " (codigo);";
  static final String createIndexUltimasComprasItensCodigoProduto =
      "CREATE INDEX index_ultimas_compras_itens_codigo_produto ON " +
          dbUltimasComprasItens +
          " (codigo_produto);";
  static final String createIndexUltimasComprasItensCodigoUnidade =
      "CREATE INDEX index_ultimas_compras_itens_codigo_unidade ON " +
          dbUltimasComprasItens +
          " (codigo_unidade);";

  // SINCRONIZACAO
  static final String createSincronizacao = "CREATE TABLE IF NOT EXISTS " +
      dbSincronizacao +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "tabela string, " +
      "tipo string, " +
      "data_sinc text, " +
      "hora_sinc text);";

  // LOG ERRO
  static final String createLogErro = "CREATE TABLE IF NOT EXISTS " +
      dbLogErro +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "android_manufacturer string," +
      "android_model string," +
      "android_sdk int," +
      "android_name string," +
      "android_release string," +
      "activity string," +
      "class string," +
      "method string," +
      "line int," +
      "log string, " +
      "data text, " +
      "hora text);";

  // LOCALIZACAO
  static final String createLocalizacao = "CREATE TABLE IF NOT EXISTS " +
      dbLocalizacao +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo_vendedor int, " +
      "data text, " +
      "hora text, " +
      "latitude text, " +
      "longitude text);";

  // TABELAS PREENCHIDAS SEM SINCRONIZAÇÃO

  // BANCOS
  static final String createBancos = "CREATE TABLE IF NOT EXISTS " +
      dbBancos +
      " (" +
      "_id integer PRIMARY KEY AUTOINCREMENT, " +
      "codigo text, " +
      "nome text, " +
      "nome_completo text);";

  DBHelper._createInstance();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //Directory directory = await getApplicationDocumentsDirectory();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //String path = join(documentsDirectory.path, "TestDB.db");
    //String databasePath = await getDatabasesPath();
    String path = documentsDirectory.path + '/box.db';
    print('path to database $path');
    var box = await openDatabase(path, version: 1, onCreate: _createDB);

    return box;
  }

  void _createDB(Database db, int newVersion) async {
    print('entrou no create db');
    await db.execute(_createSite);
    await db.execute(createFtp);
    // EMPRESA
    await db.execute(createEmpresas);
    await db.execute(createIndexEmpresaCodigo);

    // GRUPO EMPRESA / MATRIZ
    await db.execute(createGrupoEmpresas);
    await db.execute(createIndexGrupoEmpresasCodigoEmpresa);

    // NIVEL ACESSO
    await db.execute(createNivelAcesso);
    await db.execute(createIndexNivelAcessoNivel);

    // USUARIO
    await db.execute(createUsuario);
    await db.execute(createIndexUsuarioCodigo);
    await db.execute(createIndexUsuarioNivelAcesso);
    await db.execute(createIndexUsuarioSuperior);
    await db.execute(createIndexUsuarioAtivo);

    // EMPRESA USUARIO
    await db.execute(createEmpresaUsuario);
    await db.execute(createIndexEmpresaUsuarioCodigoUsuario);
    await db.execute(createIndexEmpresaUsuarioCodigoEmpresa);
  }

  Future close() async {
    _database.close();
  }
}
