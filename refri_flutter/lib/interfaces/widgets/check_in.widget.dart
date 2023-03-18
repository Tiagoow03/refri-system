import 'package:flutter/material.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5/domain/tipo_embalagem.dart';
import 'package:refri_g5_flutter/interfaces/constants.dart';
import 'package:refri_g5_flutter/interfaces/utils/formatar_string.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_limpar.widget.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_pagamento.widget.dart';
import 'botao_opcao_refri.widget.dart';

class CheckIn extends StatelessWidget {
  final Function(Refrigerante) aoSelecionarRefrigerante;
  final Function() pagamento;
  final Function() limpar;
  final List<Refrigerante> refrigerante;
  final Cupom cupom;

  CheckIn({
    Key? key,
    required this.pagamento,
    required this.limpar,
    required this.refrigerante,
    required this.cupom,
    required this.aoSelecionarRefrigerante,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 530,
          child: refrigerante.isEmpty
              ? const Text('Carregando refrigerantes!')
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingPadrao,
                      vertical: kPaddingPadrao / 1.8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: refrigerante.length,
                  itemBuilder: (context, index) {
                    return BotaoOpcaoRefri(
                      aoPressionar: () =>
                          aoSelecionarRefrigerante(refrigerante[index]),
                      descricao: refrigerante[index].descricao,
                      preco: refrigerante[index].valorUnitario,
                      imagem:
                          refrigerante[index].embalagem == TipoEmbalagem.lata
                              ? 'assets/images/lata.png'
                              : 'assets/images/garrafa.png',
                      quantidade:
                          cupom.calcularQuantidadeProduto(refrigerante[index]),
                      totalProduto:
                          cupom.calcularValorTotalProduto(refrigerante[index]),
                      cupom: cupom,
                    );
                  },
                ),
        ), //Opções de refrigerantes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingPadrao),
          child: Column(
            children: [
              if (cupom.itens.isNotEmpty)
                Container(
                  margin: EdgeInsets.symmetric(vertical: kPaddingPadrao - 20),
                  child: Row(
                    textBaseline: TextBaseline.ideographic,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF625B71),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        FormatarString.doubleParaReal(
                            cupom.calcularValorTotal()),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Color(0xFF625B71),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ), //Total
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cupom.itens.isNotEmpty)
                    BotaoLimparWidget(aoPressionar: limpar),
                  Spacer(),
                  BotaoPagamentoWidget(aoPressionar: pagamento),
                ],
              ), //Botões limpar e pagamento
            ],
          ),
        ),
      ],
    );
  }
}
