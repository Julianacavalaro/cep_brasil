import 'dart:convert';

import 'package:cep_brasil/feature/domain/model/cep_model.dart';

import '../../external/http/http_client_datasource.dart';

abstract class IConsultaCepRepository {
  Future<CepModel> getEndereco({required String cep});
}

class ConsultaCepRepository implements IConsultaCepRepository {
  final HttpClient client;

  ConsultaCepRepository({required this.client});

  @override
  Future<CepModel> getEndereco({required String cep}) async {
    String url = "https://viacep.com.br/ws/$cep/json/";

    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      // final CepModel cep;

//   final body =jsonDecode(response.body);

//  var dados =  body['json'].map(body);

//   return dados;

      print("Resposta: " + response.body);
      print("StatusCode: " + response.statusCode.toString());

      Map<String, dynamic> dados = json.decode(response.body);
    //  String logradouro = dados["logradouro"];
    //  String complemento = dados["complemento"];
   //   String bairro = dados["bairro"];
    //  String localidade = dados["localidade"];
      final decode = CepModel.decode(dados);

      return decode;
    } else if (response.statusCode != 200) {
      throw Exception(
          'Bad request: certifique-se que o mesmo possua {8} dígitos');
    } else {
      throw Exception('Não foi possível encontrar o endereço');
    }
  }
}
