import 'package:crypto_tracker/Screens/coinDetailsPage.dart';
import 'package:crypto_tracker/Widgets/searchBox.dart';
import 'package:crypto_tracker/Widgets/topBar.dart';
import 'package:crypto_tracker/cryptoApi.dart';
import 'package:crypto_tracker/cryptoCurrenciesListModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinsListUI extends StatefulWidget {
  const CoinsListUI({Key? key}) : super(key: key);

  @override
  _CoinsListUIState createState() => _CoinsListUIState();
}

class _CoinsListUIState extends State<CoinsListUI> {
  CryptoAPI cryptoAPI = CryptoAPI();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: FutureBuilder(
          future: cryptoAPI.getCryptoApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              print(snapshot.data);
              return RefreshIndicator(
                onRefresh: () {
                  return cryptoAPI.getCryptoApi();
                },
                color: Colors.teal,
                backgroundColor: Color(0xff262531),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    getPercentageColor() {
                      if (snapshot.data[index].price_change_percentage_24h >
                          0) {
                        return Colors.greenAccent;
                      } else {
                        return Colors.red;
                      }
                    }

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => CoinDetailsPage(
                                            name: snapshot.data[index].name,
                                            image: snapshot.data[index].image,
                                            current_price: snapshot
                                                .data[index].current_price,
                                            price_change_percentage_24h: snapshot
                                                .data[index]
                                                .price_change_percentage_24h,
                                            symbol: snapshot.data[index].symbol,
                                            high_24h:
                                                snapshot.data[index].high_24h,
                                            low_24h:
                                                snapshot.data[index].low_24h,
                                            market_cap_rank: snapshot
                                                .data[index].market_cap_rank,
                                          )));
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1),
                                ),
                                Text(
                                  snapshot.data[index].symbol
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Color(0xff504F57),
                                child: Image.network(
                                  snapshot.data[index].image,
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₹${snapshot.data[index].current_price}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  '${snapshot.data[index].price_change_percentage_24h.toStringAsFixed(2)}\%',
                                  style: TextStyle(
                                      color: getPercentageColor(),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22.5, vertical: 8),
                            child: Divider(
                              height: 0.5,
                              color: Colors.grey.shade800,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
    ));
  }
}
