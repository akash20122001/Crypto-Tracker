import 'package:crypto_tracker/Widgets/detailsPageText.dart';
import 'package:crypto_tracker/Widgets/searchBox.dart';
import 'package:crypto_tracker/Widgets/topBar.dart';
import 'package:crypto_tracker/cryptoApi.dart';
import 'package:crypto_tracker/cryptoCurrenciesListModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinDetailsPage extends StatelessWidget {
  final current_price;
  final String name;
  final double price_change_percentage_24h;
  final String symbol;
  final String image;
  final int market_cap_rank;
  final high_24h;
  final low_24h;

  CoinDetailsPage(
      {Key? key,
      this.current_price,
      required this.name,
      required this.price_change_percentage_24h,
      required this.symbol,
      required this.image,
      required this.market_cap_rank,
      this.high_24h,
      this.low_24h})
      : super(key: key);
  DetailsPageText detailsPageText = DetailsPageText();
  getPercentageColor() {
    if (price_change_percentage_24h > 0) {
      return Colors.greenAccent;
    } else {
      return Colors.red;
    }
  }

  CryptoAPI cryptoAPI = CryptoAPI();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF201E29),
              const Color(0xFF0D0C18),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("$name/${symbol.toString().toUpperCase()}"),
            centerTitle: true,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: RawMaterialButton(
                  child: Icon(
                    Icons.replay,
                    color: Colors.grey.shade400,
                  ),
                  elevation: 6,
                  fillColor: Color(0xff262531),
                  onPressed: () {
                    cryptoAPI.getCryptoApi();
                  },
                  constraints: BoxConstraints.tightFor(width: 45, height: 45),
                  shape: CircleBorder(),
                ),
              )
            ],
          ),
          body: Center(
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(35),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(image),
                              radius: 45,
                            ),
                          ),
                          Text(
                            '₹${current_price.toString()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              '${price_change_percentage_24h.toStringAsFixed(2)}\%',
                              style: TextStyle(
                                  color: getPercentageColor(), fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          detailsPageText.getDetailsPageText(market_cap_rank,
                              "Market cap Rank", Colors.lightGreen),
                          detailsPageText.getDetailsPageText(
                              low_24h, "Lowest last 24h", Colors.red),
                          detailsPageText.getDetailsPageText(
                              high_24h, "Highest last 24h", Colors.lightGreen),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
