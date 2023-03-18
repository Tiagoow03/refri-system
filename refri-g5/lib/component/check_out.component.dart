import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/repo/cupom_repo.dart';
import 'package:refri_g5/repo/forma_pagamento_repo.dart';
import 'package:refri_g5/repo/refrigerante_repo.dart';
import 'package:refri_g5/state/check_out_state.dart';
import 'package:refri_g5/use_case/cupom_use_case.dart';
import 'package:refri_g5/use_case/forma_pagamento_use_case.dart';
import 'package:refri_g5/use_case/refrigerante_use_case.dart';

abstract class CheckOutComponent {
  late RefrigeranteUseCase _refrigeranteUseCase;
  late CupomUseCase _cupomUseCase;
  late FormaPagamentoUseCase _formaPagamentoUseCase;

  void inicializarUseCase(
      RefrigeranteUseCase refrigeranteUseCase, CupomUseCase cupomUseCase, FormaPagamentoUseCase formaPagamentoUseCase) {
    _refrigeranteUseCase = refrigeranteUseCase;
    _cupomUseCase = cupomUseCase;
    _formaPagamentoUseCase = formaPagamentoUseCase;
  }

  void inicializarRepositorios(RefrigeranteRepo refrigeranteRepo, CupomRepo cupomRepo, FormaPagamentoRepo formaPagamentoRepo) {
    _refrigeranteUseCase.repo = refrigeranteRepo;
    _cupomUseCase.repo = cupomRepo;
    _formaPagamentoUseCase.repo = formaPagamentoRepo;
  }

  void inicializarState(CheckOutState checkOutState) {
    _refrigeranteUseCase.state = checkOutState;
    _cupomUseCase.state = checkOutState;
    _formaPagamentoUseCase.state = checkOutState;
  }

  void obterRefrigerantesDisponiveis() {
    _refrigeranteUseCase.obterRefrigerantesDisponiveis();
  }

  void obterFinalizadoraDisponiveis() {
    _formaPagamentoUseCase.obterFormasPagamento();
  }

  void registrar(Refrigerante refrigerante) {
    _cupomUseCase.registrar(refrigerante);
  }

  void pagar(FormaPagamento formaPagamento) {
    _cupomUseCase.pagar(formaPagamento);
  }

  void finalizar() {
    _cupomUseCase.finalizar();
  }

  void limpar() {
    _cupomUseCase.limparCupom();
  }

  //teste de passagem de tela:
  void voltar() {
    _cupomUseCase.voltar();
  }

  void pagamento() {
    _cupomUseCase.pagamento();
  }
}
