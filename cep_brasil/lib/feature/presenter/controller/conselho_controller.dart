import 'package:cep_brasil/feature/domain/usecase/conselho_usecase.dart';

import '../../domain/model/advice_model.dart';
import '../../domain/model/slip_model.dart';

abstract class ConselhoController {
  final ConselhoUsecase usecase;

  ConselhoController({required this.usecase});

  Future<AdviceModel> getAdvice();
}

class ConselhoControllerImpl extends ConselhoController {
  ConselhoControllerImpl({required super.usecase});

  @override
  Future<AdviceModel> getAdvice() {
    var conselho = usecase.getAdvice();
    return conselho;
  }
}
