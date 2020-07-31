import 'package:app_escola/screens/dashboard/saldo.dart';
import 'package:app_escola/screens/deposito/formularioDeposito.dart';
import 'package:app_escola/screens/transferencia/formulario.dart';
import 'package:app_escola/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('Receber depósito'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioDeposito();
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('Nova transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioTransferencia();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
