import 'package:refri_g5/domain/tipo_pagamento.dart';

class FormaPagamento {
  TipoPagamento tipo;
  double valor;

  FormaPagamento._(this.tipo, this.valor);

  factory FormaPagamento.criar(TipoPagamento tipo, double valor) {
    return FormaPagamento._(tipo, valor);
  }
}
