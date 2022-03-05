import 'package:crpto_watch/data/image_conditions.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.coinName, required this.coinPrice});
  final String coinName;
  double coinPrice;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001427),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Search Coins',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              GetImages().getImages(widget.coinName),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                " ${widget.coinName}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              " \$${widget.coinPrice.toStringAsFixed(2)} ",
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Search Another Coins"))
          ],
        ),
      ),
    );
  }
}
