import 'package:cep_brasil/feature/domain/usecase/find_address_usecase.dart';
import 'package:cep_brasil/feature/external/http/http_client.dart';
import 'package:cep_brasil/feature/infraestruture/repository/consulta_cep_repository.dart';
import 'package:cep_brasil/feature/presenter/controller/cep_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CepController controller = CepControllerImpl(
      usecase: FindAddressUsecaseImpl(
          repository: ConsultaCepRepository(client: HttpClient())));

  String resultado = "Seu cep irá aparecer aqui";
  TextEditingController txtCep = TextEditingController();

  void conselhoPage(){
Navigator.of(context).pushNamed('/conselho-page');
  }

  void buscaCep() async {
    String cep = txtCep.text;
    var dados = await controller.getEndereco(cep: cep);

    String endereco =
        "O endereço é ${dados.logradouro}, ${dados.complemento}, ${dados.bairro}, ${dados.localidade} - ${dados.uf}";
    setState(() {  
      resultado = endereco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumo de API"),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: txtCep,
                keyboardType: TextInputType.number,
                decoration:const InputDecoration(labelText: 'Digite um cep:'),
                style:const TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
              Container(height: 20),
              ElevatedButton(
                onPressed: buscaCep,
                child: const Text('Consultar'),
              ),
              Text(resultado),
                            Container(height: 20),
              ElevatedButton(
                onPressed: conselhoPage,
                child: const Text('Quero um conselho'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
