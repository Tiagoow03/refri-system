import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/repo/forma_pagamento_repo.dart';
import 'package:refri_g5/state/check_out_state.dart';

class FormaPagamentoUseCase {
  late FormaPagamentoRepo repo;
  late CheckOutState state;

  void obterFormasPagamento() {
    state.carregando = true;
    state.atualizar();
    _obterFormasPagamento();
    state.carregando = false;
    state.atualizar();
  }

  Future<void> _obterFormasPagamento() async {
    try {
      List<FormaPagamento> formasPagamentoDisponiveis = await repo.obterFormasPagamento();
      state.formasPagamento = formasPagamentoDisponiveis;
    } catch (erro) {
      state.erro = true;
      state.mensagemErro = 'ocorreu um erro ao tentar obter as formas de pagamento';
    }
  }
}
