import 'package:flutter/material.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/forma_pagamento.dart';
import 'package:refri_g5/domain/refrigerante.dart';
import 'package:refri_g5_flutter/interfaces/constants.dart';
import 'package:refri_g5_flutter/interfaces/utils/formatar_string.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_opcao_refri.widget.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_pagar.widget.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_valores_de_pagamento.widget.dart';
import 'package:refri_g5_flutter/interfaces/widgets/botao_voltar.widget.dart';

class CheckOut extends StatelessWidget {
  final Function(FormaPagamento) aoSelecionarFinalizadora;
  final Function() voltar;
  final Function() finalizar;
  final List<FormaPagamento> formaPagamento;
  final List<Refrigerante> refrigerante;
  final Cupom cupom;

  const CheckOut({
    Key? key,
    required this.voltar,
    required this.cupom,
    required this.aoSelecionarFinalizadora,
    required this.formaPagamento,
    required this.refrigerante,
    required this.finalizar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 180,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: kPaddingPadrao, vertical: kPaddingPadrao / 1.8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 70,
              mainAxisSpacing: 15,
            ),
            itemCount: cupom.itens.length,
            itemBuilder: (context, index) {
              return BotaoOpcaoRefri(
                aoPressionar: () {},
                descricao: cupom.itens[index].descricao,
                preco: cupom.itens[index].valorUnitario,
                imagem: cupom.itens[index].valorUnitario == 3.5
                    ? 'assets/images/lata.png'
                    : 'assets/images/garrafa.png',
                quantidade: cupom.itens[index].quantidade,
                totalProduto: cupom.itens[index].obterValorTotal(),
                cupom: cupom,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingPadrao),
          child: Container(
            height: 490,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                    Text(
                      FormatarString.doubleParaReal(cupom.calcularValorTotal()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                  ],
                ), //Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Falta',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                    Text(
                      FormatarString.doubleParaReal(
                          cupom.calcularValorFaltante()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                  ],
                ), //Falta
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Troco',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                    Text(
                      FormatarString.doubleParaReal(cupom.calcularTroco()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF625B71),
                      ),
                    ),
                  ],
                ), //Troco
                const SizedBox(),
                Container(
                  height: 245,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 70,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: formaPagamento.length,
                    itemBuilder: (context, index) {
                      return BotaoValoresDePagamento(
                        aoPressionar: () =>
                            aoSelecionarFinalizadora(formaPagamento[index]),
                        valor: formaPagamento[index].valor,
                      );
                    },
                  ),
                ),
                const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BotaoVoltarWidget(aoPressionar: voltar),
                    BotaoPagarWidget(
                      cupom: cupom,
                      voltarCheckIn: voltar,
                      finalizar: finalizar,
                    ),
                  ],
                ), //Botao de Baixo
              ],
            ),
          ),
        ),
      ],
    );
  }
}
