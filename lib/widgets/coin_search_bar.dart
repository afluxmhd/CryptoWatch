import 'package:crpto_watch/services/price_fetching.dart';
import 'package:flutter/material.dart';

import '../screens/searchscreen.dart';

class CoinSearchBar extends StatefulWidget {
  @override
  _CoinSearchBarState createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends State<CoinSearchBar> {
  String? coinName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 3, right: 3, bottom: 40),
      child: TextField(
        onChanged: (value) => coinName = value,
        decoration: InputDecoration(
            hintText: 'Search ticker',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () async {
                  double cryptoPrice =
                      await updateCrypto(coinName!.toUpperCase());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(
                                coinName: coinName!.toUpperCase(),
                                coinPrice: cryptoPrice,
                              )));
                },
                icon: const Icon(Icons.search))),
      ),
    );
  }
}
