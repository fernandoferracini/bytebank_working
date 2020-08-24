import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() => _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferências'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  rotulo: 'Número da conta',
                  dica: '0000',
                  icone: Icons.account_balance,
                  controladorNumeroConta: _controladorNumeroConta),
              Editor(
                  rotulo: 'Valor',
                  dica: 'Digite o Valor',
                  icone: Icons.monetization_on,
                  controladorNumeroConta: _controladorValor),
              Builder(builder: (context) {
                return RaisedButton(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 24.8,
                    ),
                  ),
                  onPressed: () {
                    _criaTransferencia(context);
                  },
                );
              }),
            ],
          ),
        )
    );
  }

  void dispose(){
    debugPrint('Chamou o dispose');
    _controladorNumeroConta.dispose();
    _controladorValor.dispose();
    super.dispose();
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroconta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if (numeroconta != null && valor != null) {
      final trasferenciaCriada = Transferencia(valor, numeroconta);
      debugPrint('$trasferenciaCriada');
      Navigator.pop(context, trasferenciaCriada);
    } else {
      final snackBar = SnackBar(
        content: Text('Valores inválidos!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      // Find the Scaffold in the widget tree and use
      // it to show a SnackBar.
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}