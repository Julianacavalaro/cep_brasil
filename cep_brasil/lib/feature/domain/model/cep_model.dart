class CepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String regiao;

  CepModel(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.unidade,
      required this.bairro,
      required this.localidade,
      required this.uf,
      required this.estado,
      required this.regiao});

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
        cep: map['cep'],
        logradouro: map['logradouro'],
        complemento: map['complemento'],
        unidade: map['unidade'],
        bairro: map['bairro'],
        localidade: map['localidade'],
        uf: map['uf'],
        estado: map['estado'],
        regiao: map['regiao']);
  }
}
