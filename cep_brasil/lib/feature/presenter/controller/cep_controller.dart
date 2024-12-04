import 'package:cep_brasil/feature/domain/usecase/find_address_usecase.dart';

import '../../domain/model/cep_model.dart';

abstract class CepController {
  final FindAddressUsecase usecase;

  CepController(this.usecase);

Future<CepModel> getEnderecoCompleto({required String cep});
}

class CepControllerImpl extends CepController{
  CepControllerImpl(super.usecase);
  
  @override
  Future<CepModel> getEnderecoCompleto({required String cep}) {
   return usecase.findAddress(cep: cep);
    throw UnimplementedError();
  }

}
