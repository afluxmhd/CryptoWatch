import 'package:crpto_watch/screens/price_screen.dart';
import 'package:crpto_watch/services/price_fetching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    updateCryptoHome();
  }

  updateCryptoHome() async {
    List<double> cryptoPriceList = [];
    List<String> cryptoList = ['BTC', 'ETH', 'SOL', 'USDT', 'ADA', 'DOGE'];

    for (int i = 0; i < cryptoList.length; i++) {
      double cryptoPrice = await updateCrypto(cryptoList[i]);
      cryptoPriceList.add(cryptoPrice);
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PriceScreen(cryptoPriceList: cryptoPriceList)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 30,
      )),
    );
  }
}
