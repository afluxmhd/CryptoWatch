import 'package:flutter/material.dart';

class CoinShowCase extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CoinShowCase(
      {required this.coinName,
      required this.coinShortForm,
      required this.coinImage,
      required this.coinPrice,
      required this.coinPriceChange});

  final String coinName;
  final String coinShortForm;
  final String coinImage;
  final String coinPrice;
  final String coinPriceChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 42, 59),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  coinImage,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(coinShortForm,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 151, 151, 151),
                            fontSize: 16))
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$coinPrice',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text('$coinPriceChange%',
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 219, 108),
                            fontSize: 16))
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
