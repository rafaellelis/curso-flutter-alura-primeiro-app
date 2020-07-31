import 'package:app_escola/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = "Últimas transferências";

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, state, child) {
          final _ultimasTransferencias = state.transferencias.reversed.toList();
          final _quantidade = state.transferencias.length;
          int tamanho = 2;

          if(_quantidade == 0){
            return _SemTransferenciaCadastrada();
          }

          if (_quantidade < 2) {
            tamanho = _quantidade;
          }

          return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: tamanho,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                return ItemTransferencia(_ultimasTransferencias[indice]);
              });
        }),
        RaisedButton(
          color: Colors.green,
          child: Text('Lista Transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaTransferencias();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: const Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
