import 'package:app_escola/components/editor.dart';
import 'package:app_escola/models/saldo.dart';
import 'package:app_escola/models/transferencia.dart';
import 'package:app_escola/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Nova transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';
const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
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
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);
    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);

      Provider.of<Transferencias>(context, listen: false)
          .adiciona(novaTransferencia);
      Provider.of<Saldo>(context, listen: false).subtrai(valor);

      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          listen: false,
        ).valor;
    return _camposPreenchidos && _saldoSuficiente;
  }
}
