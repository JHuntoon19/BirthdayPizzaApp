import 'package:flutter/material.dart';
import 'package:birthday_pizza/components/reusable_card.dart';
import 'package:birthday_pizza/constants.dart';
import 'package:birthday_pizza/screens/message_view.dart';
import 'package:birthday_pizza/components/bottom_button.dart';
import 'package:birthday_pizza/components/round_icon_button.dart';
import 'package:birthday_pizza/message_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class InputView extends StatefulWidget {
  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  int inputFeelAboutPizza = 300;
  int inputBirthMonth = 6;
  int inputBirthDay = 15;
  String birthMonth = "Jun";

  @override
  Widget build(BuildContext context) {
    String getBirthMonth(userInputBirthMonth) {
      List<String> monthArr = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      ];
      return monthArr[userInputBirthMonth];
      // switch (userInputBirthMonth) {
      //   case 1:
      //     return "Jan";
      //     break;
      //   case 2:
      //     return "Feb";
      //     break;
      //   case 3:
      //     return "Mar";
      //     break;
      //   case 4:
      //     return "Apr";
      //     break;
      //   case 5:
      //     return "May";
      //     break;
      //   case 6:
      //     return "Jun";
      //     break;
      //   case 7:
      //     return "Jul";
      //     break;
      //   case 8:
      //     return "Aug";
      //     break;
      //   case 9:
      //     return "Sep";
      //     break;
      //   case 10:
      //     return "Oct";
      //     break;
      //   case 11:
      //     return "Nov";
      //     break;
      //   case 12:
      //     return "Dec";
      //     break;
      //   default:
      //     return "Unk";
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "J HunBirthday Pizza App",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'Tell us about yourself',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'How do you feel about pizza?\n',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          'Hate                      Like                      Love',
                          style: kLabelTextStyle,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: inputFeelAboutPizza.toDouble(),
                            min: 100.0,
                            max: 500.0,
                            onChanged: (double newValue) {
                              setState(() {
                                inputFeelAboutPizza = newValue.round();
                                // print(inputFeelAboutPizza);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Birth month',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          birthMonth,
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    inputBirthMonth--;
                                    if (inputBirthMonth < 0) {
                                      inputBirthMonth = 1;
                                    }
                                    birthMonth = getBirthMonth(inputBirthMonth);
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    inputBirthMonth++;
                                    if (inputBirthMonth > 12) {
                                      inputBirthMonth = 12;
                                    }
                                    birthMonth = getBirthMonth(inputBirthMonth);
                                    // print(inputBirthMonth);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Birth day',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          inputBirthDay.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    inputBirthDay--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    inputBirthDay++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'BIRTHDAY MESSAGE',
            onTap: () {
              print('tapped BIRTHDAY MESSAGE');
              MessageModel messageModel =
              MessageModel(inputFeelAboutPizza: inputFeelAboutPizza, inputBirthMonth: inputBirthMonth, inputBirthDay: inputBirthDay);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageView(
                  nextBirthdayMessage: messageModel.getNextBirthdayMessage(),
                  birthdayGift: messageModel.getBirthdayGift(),
                  giftMessage: messageModel.getGiftMessage(),
                  lastMessageLine1: messageModel.getLastMessageLine1(),
                  lastMessageLine2: messageModel.getLastMessageLine2(),
                  lastMessageLine3: messageModel.getLastMessageLine3(),
                ))
              );
            },
          ), // BottomButton
        ],
      ),
    );
  }
}
