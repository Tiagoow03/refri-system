import 'package:flutter/material.dart';
import 'package:refri_g5/domain/cupom.dart';
import 'package:refri_g5_flutter/interfaces/constants.dart';
import 'package:refri_g5_flutter/interfaces/utils/formatar_string.dart';

class BotaoPagarWidget extends StatelessWidget {
  final Function() voltarCheckIn;
  final Function() finalizar;
  final Cupom cupom;

  const BotaoPagarWidget({
    Key? key,
    required this.cupom,
    required this.voltarCheckIn,
    required this.finalizar,
  }) : super(key: key);

  void _showCompraConcluidaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Image.asset(
            'assets/images/popup.png',
            height: 180,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'Retire sua bebida',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kPaddingPadrao / 2),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Confira se todas as suas bebidas estão ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF101333),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'liberadas',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6750A4),
                        ),
                      ),
                      TextSpan(
                        text: ', e não esqueça de pegar o ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF101333),
                        ),
                      ),
                      TextSpan(
                        text: 'troco',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6750A4),
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF101333),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFFEADDFF),
                        ),
                      ),
                      backgroundColor: const Color(0xFFFFFBFE),
                      elevation: 1,
                      minimumSize: const Size(75, 55),
                    ),
                    onPressed: () {
                      finalizar();
                      voltarCheckIn();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Color(0xFF6750A4),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 72,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.1),
              width: 0.74,
            ),
          ),
          backgroundColor: cupom.calcularValorFaltante() > 0
              ? const Color(0xFFE5E7E7)
              : const Color(0xFFC2F4F1),
          elevation: 1,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
        ),
        onPressed: () {
          if (cupom.calcularValorFaltante() <= 0) {
            _showCompraConcluidaDialog(context);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Text(
              'Pagar',
              style: TextStyle(
                color: Color(0xFF625B71),
                fontSize: 25,
              ),
            ),
            const Spacer(),
            Text(
              FormatarString.doubleParaReal(cupom.calcularValorPago()),
              style: const TextStyle(
                color: Color(0xFF625B71),
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
