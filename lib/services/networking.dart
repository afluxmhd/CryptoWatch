import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else if (response.statusCode == 429) {
      return 'try tommorow';
    } else {
      return response.statusCode;
    }
  }
}
