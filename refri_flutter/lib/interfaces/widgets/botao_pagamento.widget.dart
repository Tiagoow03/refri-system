import 'package:flutter/material.dart';

class BotaoPagamentoWidget extends StatelessWidget {
  final Function() aoPressionar;
  const BotaoPagamentoWidget({Key? key, required this.aoPressionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 72,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(
              color: Color(0xFFEADDFF),
            ),
          ),
          backgroundColor: const Color(0xFFFFFBFE),
          elevation: 1,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
        ),
        onPressed: aoPressionar,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            Text(
              'Pagamento',
              style: TextStyle(
                color: Color(0xFF625B71),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xFF625B71),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
