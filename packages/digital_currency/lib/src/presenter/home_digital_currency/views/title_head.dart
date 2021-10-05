import 'package:flutter/material.dart';

///
class TitleHead extends StatelessWidget {
  ////
  const TitleHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          DateTime.now().toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
        Row(
          children: const [
            Image(
              height: 35,
              width: 35,
              image: AssetImage(
                'assets/bitcoin.png',
                package: 'digital_currency',
              ),
            ),
            Text(
              'Bitcoin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
