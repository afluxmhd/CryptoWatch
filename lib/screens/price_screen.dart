import 'package:crpto_watch/screens/searchscreen.dart';
import 'package:crpto_watch/widgets/coin_search_bar.dart';
import 'package:crpto_watch/widgets/coin_widget_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../services/price_fetching.dart';

class PriceScreen extends StatefulWidget {
  PriceScreen({
    required this.cryptoPriceList,
  });

  List<double> cryptoPriceList = [];

  List<dynamic> cryptoPriceChangeList = ['1', '3', '3', '3', '3', '2'];

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  bool showSpinner = false;
  refreshCrytoHome() async {
    setState(() {
      showSpinner = true;
    });
    List<String> cryptoList = ['BTC', 'ETH', 'SOL', 'USDT', 'ADA', 'DOGE'];

    for (int i = 0; i < cryptoList.length; i++) {
      double cryptoPrice = await updateCrypto(cryptoList[i]);
      widget.cryptoPriceList.insert(i, cryptoPrice);
    }
    setState(() {
      showSpinner = false;
    });
    print('Refresh Completed');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF001427),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Crypto Watch',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        leading: const Icon(Icons.menu),
        actions: [
          SizedBox(
            width: 50,
            height: double.infinity,
            child: IconButton(
              icon: const Icon(
                Icons.refresh_outlined,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  refreshCrytoHome();
                });
              },
            ),
          )
        ],
      ),
      body: ModalProgressHUD(
        color: const Color(0xFF001427),
        opacity: 0.7,
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Column(
                children: [
                  CoinSearchBar(),
                ],
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CoinShowCase(
                      coinName: 'Bitcoin',
                      coinShortForm: 'BTC',
                      coinImage: 'assets/bitcoin.png',
                      coinPrice: widget.cryptoPriceList[0].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[0],
                    ),
                    CoinShowCase(
                      coinName: 'Ethereum',
                      coinShortForm: 'ETH',
                      coinImage: 'assets/ether.png',
                      coinPrice: widget.cryptoPriceList[1].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[1],
                    ),
                    CoinShowCase(
                      coinName: 'Solana',
                      coinShortForm: 'SOL',
                      coinImage: 'assets/solano.png',
                      coinPrice: widget.cryptoPriceList[2].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[2],
                    ),
                    CoinShowCase(
                      coinName: 'Tether',
                      coinShortForm: 'USDT',
                      coinImage: 'assets/tether.png',
                      coinPrice: widget.cryptoPriceList[3].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[3],
                    ),
                    CoinShowCase(
                      coinName: 'Cardano',
                      coinShortForm: 'ADA',
                      coinImage: 'assets/cardano.png',
                      coinPrice: widget.cryptoPriceList[4].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[4],
                    ),
                    CoinShowCase(
                      coinName: 'Doge',
                      coinShortForm: 'DOGE',
                      coinImage: 'assets/dogecoin.png',
                      coinPrice: widget.cryptoPriceList[5].toStringAsFixed(2),
                      coinPriceChange: widget.cryptoPriceChangeList[5],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    );
  }
}
