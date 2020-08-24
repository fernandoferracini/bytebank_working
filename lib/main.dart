import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DarkModeModel extends Model {
  bool _darkmode = false;

  void toggle() {
    _darkmode = !_darkmode;
    debugPrint('Darkmode is now $_darkmode');
    notifyListeners();
  }
}

void main() => runApp(
      BytebankApp(),
    );

class BytebankApp extends StatelessWidget {
  const BytebankApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DarkModeModel>(
      model: DarkModeModel(),
      child: ScopedModelDescendant<DarkModeModel>(
        builder: (context, child, model) {
          return MaterialApp(
            theme: model._darkmode ? ThemeData.dark() : buildThemeData(),
            //theme: ThemeData.dark(),
            home: Listatransferencia(),
          );
        }
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ));
  }
}
//Crt + alt + L quebra o codigo nas virgulas
//alt + enter dá as opções
