import 'dart:math';
import 'package:flutter/material.dart';
import 'package:refri_g5/component/check_out.component.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/state/check_out_state.dart';
import 'package:refri_g5/use_case/cupom_use_case.dart';
import 'package:refri_g5/use_case/forma_pagamento_use_case.dart';
import 'package:refri_g5/use_case/refrigerante_use_case.dart';
import 'package:refri_g5_flutter/infrastructure/cupom_memoria.repo.dart';
import 'package:refri_g5_flutter/infrastructure/refrigerante_memoria.repo.dart';
import 'package:refri_g5_flutter/infrastructure/forma_pagamento_memoria.repo.dart';
import 'package:refri_g5_flutter/interfaces/constants.dart';
import 'package:refri_g5_flutter/interfaces/widgets/check_in.widget.dart';
import 'package:refri_g5_flutter/interfaces/widgets/check_out.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with CheckOutComponent, CheckOutState {

  @override
  void initState() {
    super.initState();
    inicializarUseCase(
        RefrigeranteUseCase(), CupomUseCase(), FormaPagamentoUseCase());
    inicializarRepositorios(RefrigeranteMemoriaRepo(), CupomMemoriaRepo(),
        FormaPagamentoMemoriaRepo());
    inicializarState(this);
    obterRefrigerantesDisponiveis();
    obterFinalizadoraDisponiveis();
    var cupom = Cupom.criar(Random().nextInt(100));
    setarCupom(cupom);
  }

  void aoSelecionarRefrigerante(Refrigerante refrigerante) {
    registrar(refrigerante);
  }

  void aoSelecionarFinalizadora(FormaPagamento formaPagamento) {
    pagar(formaPagamento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(bottom: kPaddingPadrao, top: kPaddingPadrao + 20),
        child: mudancaTela
            ? CheckOut(
                voltar: voltar,
                cupom: cupom,
                formaPagamento: formasPagamento,
                aoSelecionarFinalizadora: aoSelecionarFinalizadora,
                refrigerante: refrigerantes,
                finalizar: finalizar,
              )
            : CheckIn(
                pagamento: pagamento,
                limpar: limpar,
                refrigerante: refrigerantes,
                cupom: cupom,
                aoSelecionarRefrigerante: aoSelecionarRefrigerante,
              ),
      ),
    );
  }

  @override
  void atualizar() {
    setState(() {});
  }
}
