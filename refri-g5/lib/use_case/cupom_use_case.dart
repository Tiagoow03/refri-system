import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/repo/cupom_repo.dart';
import 'package:refri_g5/state/check_out_state.dart';

class CupomUseCase {
  late CupomRepo repo;
  late CheckOutState state;

  Future<void> registrar(Refrigerante refrigerante) async {
    state.carregando = true;
    state.atualizar();
    _registrarItem(refrigerante);
    state.carregando = false;
    state.atualizar();
  }

  Future<void> _registrarItem(Refrigerante refrigerante) async {
    try {
      state.cupom.registrar(refrigerante);
    } catch (erro) {
      state.mensagemErro = 'não foi possível adicionar o item';
    }
  }

  Future<void> pagar(FormaPagamento formaPagamento) async {
    state.carregando = true;
    state.atualizar();
    _pagarCupom(formaPagamento);
    state.carregando = false;
    state.atualizar();
  }

  Future<void> _pagarCupom(FormaPagamento formaPagamento) async {
    try {
      state.cupom.pagar(formaPagamento);
    } catch (erro) {
      state.mensagemErro = 'não foi possível realizar o pagamento';
    }
  }

  Future<void> limparCupom() async {
    state.carregando = true;
    state.atualizar();
    _limpar();
    state.carregando = false;
    state.atualizar();
    print('limpar');
  }

  Future<void> _limpar() async {
    try {
      state.cupom.limpar();
    } catch (erro) {
      state.erro = true;
      state.mensagemErro = 'não foi possível limpar o cupom';
    }
  }

  Future<void> finalizar() async {
    state.carregando = true;
    state.atualizar();
    repo.salvar(state.cupom);
    state.cupom.limpar();
    print('finalizou');
    state.carregando = false;
    state.atualizar();
  }

  Future<void> voltar() async {
    state.carregando = true;
    state.atualizar();
    state.mudancaTela = false;
    state.atualizar();
    print('voltou');
    state.carregando = false;
    state.atualizar();
  }

  Future<void> pagamento() async {
    state.carregando = true;
    state.atualizar();
    if (state.cupom.itens.isNotEmpty) {
      state.mudancaTela = true;
    }
    print('pagou');
    state.carregando = false;
    state.atualizar();
  }
}
