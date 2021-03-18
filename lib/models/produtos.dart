class Produtos {
  int id;
  int codigoProduto;
  int codigoEmpresa;
  String nome;
  String unidademedida;
  String grupoProduto;
  String dataCadastro;
  String codigoAlternativo;
  String descricao;
  String ncm;
  String pesBruto;
  String pesoLiquido;
  int estoque;
  int estoqueMinimo;
  int estoqueMaximo;
  int multiplicidade;
  String codigoEan;
  String codigoEanTributavel;
  String foto;

  void setCodigo(int value) {
    this.codigoProduto = value;
  }

  int getCodigoProduto() {
    return this.codigoProduto;
  }

  Produtos();
}
