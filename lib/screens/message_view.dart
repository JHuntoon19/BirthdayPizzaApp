import 'package:flutter/material.dart';
import 'package:birthday_pizza/components/bottom_button.dart';

class MessageView extends StatelessWidget {
  MessageView({
    @required this.nextBirthdayMessage,
    @required this.birthdayGift,
    @required this.giftMessage,
    @required this.lastMessageLine1,
    @required this.lastMessageLine2,
    @required this.lastMessageLine3,
});
  final String nextBirthdayMessage;
  final String birthdayGift;
  final String giftMessage;
  final String lastMessageLine1;
  final String lastMessageLine2;
  final String lastMessageLine3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Birthday Pizza App",
          style: TextStyle(fontSize: 15.0),
        ), // Text
      ), // AppBar
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              nextBirthdayMessage,
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                  'images/$birthdayGift.jpg'), //add image location here
            ),
          ),
          Expanded(
            child: Text(
              giftMessage,
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                lastMessageLine1,
                style: TextStyle(color: Colors.white, fontSize: 26.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                lastMessageLine2,
                style: TextStyle(color: Colors.white, fontSize: 26.0),
              ),
            ),
          ),
          Expanded(
            child: Text(
              lastMessageLine3,
              style: TextStyle(color: Colors.white, fontSize: 36.0),
            ),
          ),
          BottomButton(
            buttonTitle: 'TRY AGAIN',
            onTap: () {
              print('tapped TRY AGAIN');
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
