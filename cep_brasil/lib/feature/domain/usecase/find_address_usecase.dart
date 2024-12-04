import '../../infraestruture/repository/consulta_cep_repository.dart';

abstract class FindAddressUsecase{

final  ConsultaCepRepository repository;

  FindAddressUsecase({required this.repository});

Future<ConsultaCepRepository>findAddress({required String cep});
}
class FindAddressUsecaseImpl extends FindAddressUsecase{
  FindAddressUsecaseImpl({required super.repository});

  @override
  Future<ConsultaCepRepository> findAddress({required String cep}) async {
     return repository;
  }

}