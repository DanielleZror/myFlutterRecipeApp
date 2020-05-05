import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final data;
  final index;
  CardRow(this.data, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            card(data),
            planetThumbnail(data),
          ],
        ));
  }

  Widget planetThumbnail(data) {
    return Container(
      margin: (index % 2 == 0)
          ? const EdgeInsets.only(left: 270.0)
          : const EdgeInsets.only(left: 5.0),
//      margin: const EdgeInsets.only(left: 270.0),
//      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipOval(
        child: Image(
          image: AssetImage(data['image']),
          height: 92.0,
          width: 92.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget card(data) {
    return Container(
      height: 124.0,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 46.0, right: 46),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[700],
            blurRadius: 10.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${data['name']}',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30,
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${data['value']}',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
