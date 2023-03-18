import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/tipo_pagamento.dart';
import 'package:refri_g5/repo/forma_pagamento_repo.dart';

class FormaPagamentoMemoriaRepo implements FormaPagamentoRepo {
  @override
  Future<List<FormaPagamento>> obterFormasPagamento() async {
    return [
      FormaPagamento.criar(TipoPagamento.moeda, 0.25),
      FormaPagamento.criar(TipoPagamento.moeda, 0.50),
      FormaPagamento.criar(TipoPagamento.moeda, 1.00),
      FormaPagamento.criar(TipoPagamento.nota, 2.00),
      FormaPagamento.criar(TipoPagamento.nota, 5.00),
      FormaPagamento.criar(TipoPagamento.nota, 10.00),
      FormaPagamento.criar(TipoPagamento.nota, 20.00),
      FormaPagamento.criar(TipoPagamento.nota, 50.00),
      FormaPagamento.criar(TipoPagamento.nota, 100.00),
    ];
  }
}
