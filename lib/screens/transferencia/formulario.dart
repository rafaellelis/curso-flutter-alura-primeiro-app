import 'package:app_escola/components/editor.dart';
import 'package:app_escola/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Nova transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';
const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerFieldNumeroConta =
  TextEditingController();

  final TextEditingController _controllerFieldValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controller: _controllerFieldValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotao),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerFieldNumeroConta.text);
    final double valor = double.tryParse(_controllerFieldValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}