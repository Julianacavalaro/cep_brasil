import 'package:cep_brasil/feature/infraestruture/repository/conselho_repository.dart';

import '../model/conselho_model.dart';

abstract class ConselhoUsecase {
  final ConselhoRepository repository;

  ConselhoUsecase({required this.repository});
  Future<ConselhoModel> getAdvice();
}

class ConselhoUsecaseImpl extends ConselhoUsecase {
  ConselhoUsecaseImpl({required super.repository});
  @override
  Future<ConselhoModel> getAdvice() async {
    var advice = await repository.getAdvice();
    return advice;
  }
}
