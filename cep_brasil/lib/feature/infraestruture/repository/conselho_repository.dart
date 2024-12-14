import 'dart:convert';
import '../../domain/model/advice_model.dart';
import '../../external/http/http_client.dart';

abstract class IConselhoRepository {
  Future<AdviceModel> getAdvice();
}

class ConselhoRepository implements IConselhoRepository {
  final IHttpClient client;

  ConselhoRepository({required this.client});

  @override
  Future<AdviceModel> getAdvice() async {
    String url = "https://api.adviceslip.com/advice";

    final response = await client.get(url: url);

    if (response.statusCode == 200) {
 // Decodificando o JSON para um mapa
  final Map<String, dynamic> jsonMap = json.decode(response.body);

  // Convertendo o mapa para um objeto AdviceResponse
  final AdviceModel adviceResponse = AdviceModel.fromJson(jsonMap);

      return adviceResponse;
    } else  {
      var resposta = response.statusCode;
      throw Exception(
          'ERRO\n response: $resposta');
    }
  }

}
