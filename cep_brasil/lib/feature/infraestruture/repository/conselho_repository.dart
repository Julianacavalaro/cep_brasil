import 'dart:convert';
import '../../domain/model/conselho_model.dart';
import '../../external/http/http_client.dart';

abstract class IConselhoRepository {
  Future<ConselhoModel> getAdvice();
}

class ConselhoRepository implements IConselhoRepository {
  final IHttpClient client;

  ConselhoRepository({required this.client});

  @override
  Future<ConselhoModel> getAdvice() async {
    String url = "https://api.adviceslip.com/advice";

    final response = await client.get(url: url);

    if (response.statusCode == 200) {

      Map<String, dynamic> dados = json.decode(response.body);

      final decode = ConselhoModel.decode(dados);

      return decode;
    } else  {
      var resposta = response.statusCode;
      throw Exception(
          'ERRO\n response: $resposta');
    }
  }

}
