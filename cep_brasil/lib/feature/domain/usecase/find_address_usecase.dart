import '../../infraestruture/repository/consulta_cep_repository.dart';
import '../model/cep_model.dart';

abstract class FindAddressUsecase{

final  ConsultaCepRepository repository;

  FindAddressUsecase({required this.repository});

Future<CepModel>findAddress({required String cep});
}
class FindAddressUsecaseImpl extends FindAddressUsecase{
  FindAddressUsecaseImpl({required super.repository});

  @override
  Future<CepModel> findAddress({required String cep}) async {
     return repository.getEndereco(cep: cep);
  }

}