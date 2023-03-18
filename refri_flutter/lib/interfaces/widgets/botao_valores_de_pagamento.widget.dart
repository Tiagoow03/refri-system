import 'package:flutter/material.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5_flutter/interfaces/utils/formatar_string.dart';

class BotaoValoresDePagamento extends StatelessWidget {
  final Function() aoPressionar;
  final double valor;

  const BotaoValoresDePagamento({
    Key? key,
    required this.aoPressionar,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5.4,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.1),
              width: 0.51,
            ),
          ),
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 1,
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 0,
          ),
        ),
        onPressed: aoPressionar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              FormatarString.doubleParaReal(valor),
              style: const TextStyle(
                color: Color(0xFF625B71),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
