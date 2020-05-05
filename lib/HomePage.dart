import 'package:flutter/material.dart';
import './data.dart';

class HomePage extends StatelessWidget {
  var cryptoData = Data.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
// scrollDirection: Axis.horizontal,
                itemCount: cryptoData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 200,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 2.0,
                                color: cryptoData[index]['iconColor']),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              cryptoIcon(cryptoData[index]),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              cryptoNameSymbol(
                                                  cryptoData[index]),
                                              Spacer(),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              cryptoAmount(cryptoData[index])
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    )));
  }

  Widget cryptoIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            data['icon'],
            color: data['iconColor'],
            size: 40,
          )),
    );
  }

  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 30),
        ),
      ),
    );
  }

  Widget cryptoAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n${data['value']}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
