import 'package:flutter/material.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5/domain/tipo_embalagem.dart';
import 'package:refri_g5_flutter/interfaces/constants.dart';
import 'package:refri_g5_flutter/interfaces/utils/formatar_string.dart';

class BotaoOpcaoRefri extends StatelessWidget {
  final Function() aoPressionar;
  final Cupom cupom;

  const BotaoOpcaoRefri({
    Key? key,
    required this.aoPressionar,
    required this.descricao,
    required this.preco,
    required this.imagem,
    required this.quantidade,
    required this.totalProduto,
    required this.cupom,
  }) : super(key: key);
  final String descricao;
  final double preco;
  final String imagem;
  final int quantidade;
  final double totalProduto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ElevatedButton(
            onPressed: aoPressionar,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: const Color(0xFF000000).withOpacity(0.1),
                  width: 0.56,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagem,
                  width: 30,
                ),
                const SizedBox(width: kPaddingPadrao / 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      descricao,
                      style: const TextStyle(
                        color: Color(0xFF625B71),
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      FormatarString.doubleParaReal(preco),
                      style: const TextStyle(
                        color: Color(0xFF625B71),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (quantidade > 0)
                        Text(
                          FormatarString.doubleParaReal(totalProduto),
                          style: const TextStyle(
                            color: Color(0xFF625B71),
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (quantidade > 0)
            Positioned(
              left: -20,
              top: -12,
              child: Container(
                width: 35,
                height: 31,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8DEF8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '$quantidade' 'x',
                    style: const TextStyle(
                      color: Color(0xFF625B71),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
