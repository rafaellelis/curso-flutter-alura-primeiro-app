import 'package:app_escola/models/transferencia.dart';
import 'package:flutter/material.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencias => _transferencias;

  adiciona(Transferencia novaTransferencia){
    _transferencias.add(novaTransferencia);
    notifyListeners();
  }
}