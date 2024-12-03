import '../../infraestruture/repository/consulta_cep_repository.dart';

abstract class FindAddress{
Future<ConsultaCepRepository>findAddress();
}
class FindAddressImpl extends FindAddress{
  @override
  Future<ConsultaCepRepository> findAddress() {
    // TODO: implement findAddress
    throw UnimplementedError();
  }

}