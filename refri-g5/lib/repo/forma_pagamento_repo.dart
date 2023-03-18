import 'package:refri_g5/domain/forma_pagamento.dart';

abstract class FormaPagamentoRepo {
  Future<List<FormaPagamento>> obterFormasPagamento();
}
