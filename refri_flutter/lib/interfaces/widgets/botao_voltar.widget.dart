import 'package:flutter/material.dart';

class BotaoVoltarWidget extends StatelessWidget {
  final Function() aoPressionar;
  const BotaoVoltarWidget({
    Key? key,
    required this.aoPressionar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 72,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 0),
            Icon(
              Icons.chevron_left,
              color: Color(0xFF625B71),
            ),
          ],
        ),
      ),
    );
  }
}
