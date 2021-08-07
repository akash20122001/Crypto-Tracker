import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class CryptoAPI {
  List<Coin> coins = [];
  List<Coin> searchCoins = [];


  Future<List<Coin>> getCryptoApi() async {
    var data = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h'));
    var jsonData = json.decode(data.body);
    print(jsonData);

    
    for (var u in jsonData) {
      Coin coin = Coin(
          name: u["name"],
          image: u["image"],
          current_price: u["current_price"],
          price_change_percentage_24h: u["price_change_percentage_24h"],
          symbol: u["symbol"],
          high_24h: u["high_24h"],
          low_24h: u["low_24h"],
          market_cap_rank: u["market_cap_rank"]);

      coins.add(coin);
    }


   
  
    return coins;
  }

 
    
}

class Coin {
  final String name;
  final String symbol;
  final String image;
  final current_price;
  final double price_change_percentage_24h;
  final int market_cap_rank;
  final high_24h;
  final low_24h;

  Coin(
      {required this.name,
      required this.symbol,
      required this.image,
      required this.high_24h,
      required this.low_24h,
      required this.market_cap_rank,
      required this.current_price,
      required this.price_change_percentage_24h});
}
