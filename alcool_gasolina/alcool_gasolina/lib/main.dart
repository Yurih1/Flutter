import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String _resultado = "Informe os valores";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset() {
    alcoolController.text = "";
    gasolinaController.text = "";
    setState(() {
      _resultado = "Informe os valores";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaCombustivelIdeal() {
    setState(() {
      double vAlcool = double.parse(alcoolController.text.replaceAll(',', '.'));
      double vGasolina =
          double.parse(gasolinaController.text.replaceAll(',', '.'));
      double proporcao = vAlcool / vGasolina;

      _resultado =
          (proporcao < 0.7) ? "Abasteça com Álcool" : "Abasteça com Gasolina!";
    });

    // if(proporcao < 0.7) {
    //   _resultado = "Abasteça com Álcool";
    // } else {
    //   _resultado = "Abasteça com Gasolina";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Álcool ou Gasolina?",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _reset();
                })
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.local_gas_station,
                  size: 150.0,
                  color: Colors.lightBlue[900],
                ),
                TextFormField(
                  controller: alcoolController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value.isEmpty ? "Infrome o valor do Álcool" : null,
                  decoration: InputDecoration(
                    labelText: "Valor do Álcool",
                    labelStyle: TextStyle(color: Colors.lightBlue[900]),
                  ),
                  style:
                      TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                ),
                TextFormField(
                  controller: gasolinaController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value.isEmpty ? "Informe o valor da gasolina!" : null,
                  decoration: InputDecoration(
                      labelText: "Valor da Gasolina",
                      labelStyle: TextStyle(color: Colors.lightBlue[900])),
                  style:
                      TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          _calculaCombustivelIdeal();
                      },
                      child: Text(
                        "Verificar",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.lightBlue[900],
                    ),
                  ),
                ),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                )
              ],
            ),
          ),
        ));
  }
}
