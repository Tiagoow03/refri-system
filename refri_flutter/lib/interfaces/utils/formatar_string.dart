class FormatarString {
  FormatarString(double valor);

  static String doubleParaReal(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
