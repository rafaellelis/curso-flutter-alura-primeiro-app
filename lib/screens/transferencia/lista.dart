import 'package:app_escola/models/transferencia.dart';
import 'package:app_escola/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(
        builder: (context, state, child) {
          return ListView.builder(
            itemCount: state.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = state.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
        },
        child: Icon(Icons.add),
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
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.toStringValor()),
      subtitle: Text(_transferencia.toStringConta()),
    ));
  }
}
