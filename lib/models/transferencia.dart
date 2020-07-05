class Transferencia {
  final double valor;

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }

  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
