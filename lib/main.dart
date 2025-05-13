import 'package:flutter/material.dart';
import 'screens/input_view.dart';
import 'screens/message_view.dart';

void main() => runApp(BirthdayPizzaApp());

class BirthdayPizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'BirthdayPizzaApp',
      home: InputView(),
      // home: MessageView(),
    ); //MaterialApp
  }

}
