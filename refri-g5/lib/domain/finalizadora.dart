import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/tipo_pagamento.dart';
import 'package:refri_g5/use_case/exception/valor_inv%C3%A1lido.dart';

class Finalizadora {
  TipoPagamento tipo;
  double valor;
  int quantidade;

  Finalizadora._(this.tipo, this.valor, this.quantidade);

  factory Finalizadora.criar(FormaPagamento formaPagamento) {
    validarValor(formaPagamento.valor);
    return Finalizadora._(formaPagamento.tipo, formaPagamento.valor, 1);
  }

  double obterValorTotal() {
    return quantidade * valor;
  }

  static void validarValor(double valor) {
    if (valor <= 0) throw ValorInvalido();
  }

  @override
  bool operator == (Object other) {
    if (other is Finalizadora) {
      return this.valor == other.valor;
    }
    return this == other;
  }
}
