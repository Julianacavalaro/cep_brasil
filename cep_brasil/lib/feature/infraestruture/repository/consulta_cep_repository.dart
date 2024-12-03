import 'dart:convert';

import 'package:cep_brasil/feature/domain/model/cep_model.dart';

import '../../external/http/http_client.dart';

abstract class IConsultaCepRepository{
  Future<CepModel> getEndereco();
}

class ConsultaCepRepository implements IConsultaCepRepository{
 final IHttpClient response;

  ConsultaCepRepository({required this.response});
  
  @override
  Future<CepModel> getEndereco() async {
   
  final response = await client.get(url: 'viacep.com.br/ws/09310150/json/',
);
if(response.status == 200){
 // final CepModel cep;

  final body =jsonDecode(response.body);

 var dados =  body['json'].map(body);

  return dados;
}else if(response.status == 400){
  throw Exception('Bad request: certifique-se que o mesmo possua {8} dígitos');
} else {
  throw Exception('Não foi possível encontrar o endereço');
}
  }
  

}