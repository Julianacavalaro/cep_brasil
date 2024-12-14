import 'dart:convert';

import 'package:cep_brasil/feature/domain/model/cep_model.dart';

import '../../external/http/http_client.dart';

abstract class IConsultaCepRepository {
  Future<CepModel> getEndereco({required String cep});
}

class ConsultaCepRepository implements IConsultaCepRepository {
  final IHttpClient client;

  ConsultaCepRepository({required this.client});

  @override
  Future<CepModel> getEndereco({required String cep}) async {
    String url = "https://viacep.com.br/ws/$cep/json/";

    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      // final CepModel cep;

 final body =jsonDecode(response.body);

//  var dados =  body['json'].map(body);

//   return dados;

      print("Resposta: " + response.body);
      print("StatusCode: ${response.statusCode}");


        // Decodificando o JSON para Map
  Map<String, dynamic> data = jsonDecode(response.body);

  // Criando uma instância de CepModel
  CepModel cep = CepModel.fromMap(data);

      return cep;
    } else if (response.statusCode != 200) {
      throw Exception(
          'Bad request: certifique-se que o mesmo possua {8} dígitos');
    } else {
      throw Exception('Não foi possível encontrar o endereço');
    }
  }
}
