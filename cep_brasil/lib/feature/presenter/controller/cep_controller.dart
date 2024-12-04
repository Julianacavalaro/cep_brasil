import 'package:cep_brasil/feature/infraestruture/repository/consulta_cep_repository.dart';

abstract class CepController {
  final IConsultaCepRepository repository;

  CepController({required this.repository});

Future<String> getEnderecoCompleto({required String cep});


}

class CepControllerImpl extends CepController{
  CepControllerImpl({required super.repository});
  
  @override
  Future<String> getEnderecoCompleto({required String cep}) {

    throw UnimplementedError();
  }

}
