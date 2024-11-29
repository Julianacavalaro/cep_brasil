import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String resultado = "Seu cep irá aparecer aqui";

TextEditingController txtCep = TextEditingController();
 
  void buscaCep(){
    String cep = txtCep.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
  }
  @override
  Widget build(BuildContext context) {  
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