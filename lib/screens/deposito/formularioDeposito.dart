import 'package:app_escola/components/editor.dart';
import 'package:app_escola/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotao = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controllerFieldValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Receber Depósito',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaDeposito(context),
              child: Text(_textoBotao),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_controllerFieldValor.text);
    final depositoValido = _validaDeposito(valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  bool _validaDeposito(valor) {
    return valor != null;
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
