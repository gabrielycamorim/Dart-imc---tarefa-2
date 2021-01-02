import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String _resultado = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text('Calculo do IMC', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        
        children: <Widget>[
            Center(
               child: Text(
              'Tabela IMC',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            )),
            DataTable(
              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent),
              columns: [
                DataColumn(label: Text('IMC')),
                DataColumn(label: Text('Classificação')),
              ],
              rows: [
                DataRow(
                  cells: [
                  DataCell(Text('abaixo de 18.5')),
                  DataCell(Text('abaixo do peso')),
                ]),
                DataRow(
                  cells: [
                  DataCell(Text('entre 18.6 e 24.9')),
                  DataCell(Text('peso ideal')),
                  
                ]),
                DataRow(
                  cells: [
                  DataCell(Text('entre 25.0 e 29.9')),
                  DataCell(Text('levemente acima do peso')),
                  
                ]), 
                  DataRow(
                  cells: [
                  DataCell(Text('entre 30.0 e 34.9')),
                  DataCell(Text('obesidade grau I')),
                  
                ]),
                  DataRow(
                  cells: [
                  DataCell(Text('entre 35.0 e 39.9')),
                  DataCell(Text('obesidade grau II')),
                  
                ]),
                  DataRow(
                  cells: [
                  DataCell(Text('acima de 40')),
                  DataCell(Text('obesidade morbida III')),
                  
                ]),
              ],
            ),
             Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Seu peso em kg",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Sua altura em metros",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                height: 50.0,
                width: 200.0,
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.blueAccent,
                 
                  onPressed: () {
                    double peso = double.parse(pesoController.text);
                    double altura = double.parse(alturaController.text);
                    double imc = peso / ( altura * altura);
                  
                    setState(() {
 	                  
                      if (imc < 18.60)                    
                        _resultado = "abaixo do peso";
                      else if (imc <25.0)
                        _resultado = "peso ideal";
                      else if(imc <30.0)
                        _resultado = "levemente acima do peso";
                      else if(imc <35.0)
                        _resultado = "obesidade grau I";
                      else if(imc <40.0)
                        _resultado = "obesidade grau II";
                      else
                        _resultado = "obesidade morbida III";
                          
                    });
            
                  },
                ),
              ),
              Container(
                
                margin: EdgeInsets.only(top: 40, left:350),
                child: Text(
                  _resultado, 
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  
                ),
              )     
            ],
          ),
    );
  }
}
