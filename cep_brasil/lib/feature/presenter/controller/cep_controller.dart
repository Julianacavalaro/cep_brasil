import 'package:cep_brasil/feature/domain/usecase/find_address_usecase.dart';

import '../../domain/model/cep_model.dart';

abstract class CepController {
  final FindAddressUsecase usecase;

  CepController({required this.usecase});

Future<CepModel> getEndereco({required String cep});
}

class CepControllerImpl extends CepController{
  CepControllerImpl({required super.usecase});
  
  @override
  Future<CepModel> getEndereco({required String cep}) async {
     final dados = await usecase.findAddress(cep: cep);
   return dados;
  }

}
