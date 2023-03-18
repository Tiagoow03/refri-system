import 'dart:math';

import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/refrigerante.dart';

abstract class CheckOutState {
  List<Refrigerante> refrigerantes = [];
  List<FormaPagamento> formasPagamento = [];
  late Cupom cupom;

  bool mudancaTela = false;
  bool carregando = false;
  bool erro = false;
  String mensagemErro = '';

  void atualizar();

  Future<void> setarCupom(Cupom cupomCriado) async {
    this.cupom = cupomCriado;
  }
}
