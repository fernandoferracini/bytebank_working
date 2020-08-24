import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextEditingController controladorNumeroConta;

  Editor({this.rotulo, this.dica, this.icone, this.controladorNumeroConta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controladorNumeroConta,
        style: TextStyle(
          fontSize: 24.8,
        ),
        decoration: InputDecoration(
          icon: Icon(icone),
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}