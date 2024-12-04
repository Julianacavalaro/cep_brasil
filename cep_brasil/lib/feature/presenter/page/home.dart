import 'dart:convert';

import 'package:cep_brasil/feature/domain/model/cep_model.dart';
import 'package:cep_brasil/feature/infraestruture/repository/consulta_cep_repository.dart';
import 'package:cep_brasil/feature/presenter/controller/cep_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late CepControllerImpl controller;
 late ConsultaCepRepository repository;

String resultado = "Seu cep irá aparecer aqui";
    TextEditingController txtCep = TextEditingController();

  void buscaCep() async{
    String cep = txtCep.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;
    response = await  http.get(Uri.parse(url));
    print("Resposta: " + response.body);
    print("StatusCode: " + response.statusCode.toString());

    Map<String, dynamic> dados = json.decode(response.body);

    String logradouro = dados["logradouro"];
    String complemento = dados["complemento"];
    String bairro = dados["bairro"];
    String localidade = dados["localidade"];


    String endereco = "O endereço é $logradouro, $complemento, $bairro, $localidade";
 
 setState(() {
  resultado = endereco;
   } );
  }
  @override
  Widget build(BuildContext context) {  
    TextEditingController txtCep = TextEditingController();
String cep = txtCep.text;
controller.getEnderecoCompleto(cep: cep);
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de API"),
        backgroundColor: Colors.purple,
        titleTextStyle:const TextStyle(fontSize: 20,color: Colors.white),
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: txtCep,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Digite um cep:'),
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
              Container(height: 20),
              ElevatedButton(
                child: Text('Consultar'),
                onPressed: buscaCep,
              ),
              Text(resultado),
            ],
          ),
        ),
      ),
    );  
  }
}