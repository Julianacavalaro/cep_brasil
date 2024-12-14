import 'package:cep_brasil/feature/domain/usecase/conselho_usecase.dart';
import 'package:cep_brasil/feature/infraestruture/repository/conselho_repository.dart';
import 'package:flutter/material.dart';

import '../../external/http/http_client.dart';
import '../controller/conselho_controller.dart';

class ConselhoPage extends StatefulWidget {
  const ConselhoPage({super.key});

  @override
  State<ConselhoPage> createState() => _ConselhoPageState();
}

class _ConselhoPageState extends State<ConselhoPage> {
  final ConselhoController controller = ConselhoControllerImpl(
      usecase: ConselhoUsecaseImpl(
          repository: ConselhoRepository(client: HttpClient())));
  String resultado = 'Seu conselho aparecerá aqui';
  dynamic loading = const CircularProgressIndicator();
  @override
  void initState() {
    super.initState();
    getRandomAdvice();
  }
    var carregar = true;

  void getRandomAdvice() async {
    var advice = await controller.getAdvice();

    setState(() {
            resultado = advice.slip.advice;
            carregar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API de conselho"),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        surfaceTintColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              carregar ? loading : Text(resultado),
              Container(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}
