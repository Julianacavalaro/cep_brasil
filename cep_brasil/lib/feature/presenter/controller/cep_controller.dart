import 'package:cep_brasil/feature/domain/model/cep_model.dart';
import 'package:cep_brasil/feature/infraestruture/repository/consulta_cep_repository.dart';
import 'package:flutter/material.dart';

class CepController {
  final IConsultaCepRepository consultaCepRepository;

  CepController({required this.consultaCepRepository});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  final ValueNotifier<CepModel> state = ValueNotifier<CepModel>('' as CepModel);

Future getEndereco() async {
  isLoading.value = true;


}
}