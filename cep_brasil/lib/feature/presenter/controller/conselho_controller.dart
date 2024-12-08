import 'package:cep_brasil/feature/domain/usecase/conselho_usecase.dart';

import '../../domain/model/conselho_model.dart';

abstract class ConselhoController {
  final ConselhoUsecase usecase;

  ConselhoController({required this.usecase});

  Future<ConselhoModel> getAdvice();
}

class ConselhoControllerImpl extends ConselhoController {
  ConselhoControllerImpl({required super.usecase});

  @override
  Future<ConselhoModel> getAdvice() {
    var conselho = usecase.getAdvice();
    return conselho;
  }
}
