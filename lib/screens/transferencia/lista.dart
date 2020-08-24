import 'package:bytebank/main.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Listatransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  _ListatransferenciaState createState() => _ListatransferenciaState();
}

class _ListatransferenciaState extends State<Listatransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: Text('Transferências')),
            Container(
              child: ScopedModelDescendant<DarkModeModel>(
                builder: (context, child, model) {
                  return IconButton(
                    icon: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: (){
                      model.toggle();
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            return ItemTransferencia(widget._transferencias[indice]);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          ).then((transferenciaCriada) {
            debugPrint('Voltou para tela inicial: $transferenciaCriada');
            if (transferenciaCriada != null) {
              setState(() {
                widget._transferencias.add(transferenciaCriada);
              });
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(_transferencia.numeroconta.toString()),
            subtitle: Text(_transferencia.valor.toString()),
            leading: Icon(Icons.monetization_on),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroconta;

  Transferencia(this.valor, this.numeroconta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroconta: $numeroconta}';
  }
}
