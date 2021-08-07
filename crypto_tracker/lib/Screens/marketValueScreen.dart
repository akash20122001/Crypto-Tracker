import 'package:crypto_tracker/Widgets/coinsListUi.dart';
import 'package:crypto_tracker/Widgets/searchBox.dart';
import 'package:crypto_tracker/Widgets/topBar.dart';
import 'package:crypto_tracker/cryptoApi.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CryptoAPI cryptoAPI = CryptoAPI();
  String searchText = '';
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
            title: Text("Live Prices"),
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
          body: Column(
            children: [
              topBar(),
              Container(
                padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
                height: 57.5,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xff262531),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        onChanged: (value) {
                          value = value.toLowerCase();
                          setState(() {
                            searchText = value;
                            
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search...",
                            hintStyle: TextStyle(
                                color: Color(0xff504F57), fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CoinsListUI()
            ],
          ),
        ),
      ),
    );
  }
}
