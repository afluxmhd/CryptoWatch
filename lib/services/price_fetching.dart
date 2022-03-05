import 'package:crpto_watch/services/networking.dart';

const apikey = 'DCC330C8-7573-44F4-862C-918455D5930B';
const coinapiUrl = 'https://rest.coinapi.io';

Future<double> updateCrypto(String cryptoShortForm) async {
  var crptoPriceData = await NetworkHelper(
          url:
              '$coinapiUrl/v1/exchangerate/$cryptoShortForm/USD?apikey=$apikey')
      .getData();
  var crptoPrice = crptoPriceData['rate'];
  return crptoPrice;
}
