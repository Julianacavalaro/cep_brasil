import 'package:cep_brasil/feature/infraestruture/repository/conselho_repository.dart';

import '../model/advice_model.dart';

abstract class ConselhoUsecase {
  final ConselhoRepository repository;

  ConselhoUsecase({required this.repository});
  Future<AdviceModel> getAdvice();
}

class ConselhoUsecaseImpl extends ConselhoUsecase {
  ConselhoUsecaseImpl({required super.repository});
  @override
  Future<AdviceModel> getAdvice() async {
     final advice = await repository.getAdvice();
    return advice;
  }
}
