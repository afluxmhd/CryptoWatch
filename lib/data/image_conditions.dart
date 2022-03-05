class GetImages {
  String getImages(String coinName) {
    if (coinName == 'BTC') {
      return "assets/bitcoin.png";
    } else if (coinName == 'ETH') {
      return "assets/ether.png";
    } else if (coinName == 'SOL') {
      return 'assets/solano.png';
    } else if (coinName == 'DOGE') {
      return 'assets/dogecoin.png';
    } else if (coinName == 'USDT') {
      return 'assets/tether.png';
    } else if (coinName == 'ADA') {
      return 'assets/cardano.png';
    } else if (coinName == 'SHIB') {
      return 'assets/shiba inu.png';
    } else if (coinName == 'XRP') {
      return 'assets/xrp.png';
    } else if (coinName == 'DOT') {
      return 'assets/polkadot.png';
    } else if (coinName == 'LTC') {
      return 'assets/litecoin.png';
    } else if (coinName == 'XLM') {
      return 'assets/stellar.png';
    } else if (coinName == 'USDC') {
      return 'assets/usdc.png';
    } else if (coinName == 'MATIC') {
      return 'assets/polygon.png';
    } else {
      return 'assets/dogecoin.png';
    }
  }
}
