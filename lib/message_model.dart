import 'package:flutter/cupertino.dart';

class MessageModel {
  MessageModel(
      {this.inputFeelAboutPizza, this.inputBirthMonth, this.inputBirthDay});

  final int inputFeelAboutPizza;
  final int inputBirthMonth;
  final int inputBirthDay;

  String getNextBirthdayMessage() {
    int userBirthdayDayOfWeekNum;
    String nextBirthdayDayOfWeekStr;
    nextBirthdayDayOfWeekStr = 'Unknown';
    DateTime userBirthdayThisYear = new DateTime.utc(DateTime.now().year, inputBirthMonth, inputBirthDay);
    if (userBirthdayThisYear.compareTo(DateTime.now()) > 0){
      userBirthdayDayOfWeekNum = userBirthdayThisYear.weekday;
      nextBirthdayDayOfWeekStr = getDayOfWeekName(userBirthdayDayOfWeekNum);
    } else{
      DateTime userBirthdayNextYear = new DateTime.utc(DateTime.now().year + 1, inputBirthMonth, inputBirthDay);
      userBirthdayDayOfWeekNum = userBirthdayNextYear.weekday;
      nextBirthdayDayOfWeekStr = getDayOfWeekName(userBirthdayDayOfWeekNum);
    }
    return 'Your next birthday is a $nextBirthdayDayOfWeekStr';
  }

  String getBirthdayGift() {
    String birthdayGift;
    if(inputFeelAboutPizza >= 300){
      birthdayGift = 'pizza';
    }
    else{
      if(inputBirthMonth < 7){
        birthdayGift = 'amethyst';
      } else{
        birthdayGift = 'ruby';
      }
    }
    return birthdayGift;
  }

  String getGiftMessage() {
    String giftMessage;
    if(inputFeelAboutPizza < 300){
      giftMessage = "Maybe you'll get a " + getBirthdayGift();
    } else{
      giftMessage = "Maybe you'll get a yummy pizza!";
    }
    return giftMessage;
  }

  String getLastMessageLine1() {
    String lastMessageLine1;
    if(inputFeelAboutPizza < 300){
      lastMessageLine1 = "Your next birthday";
    } else{
      lastMessageLine1 = 'National Pizza Month';
    }
    return lastMessageLine1;
  }

  String getLastMessageLine2() {
    String lastMessageLine2;
    if(inputFeelAboutPizza >= 300){
      if(getCurrentMonthNum() == 10){
        lastMessageLine2 = "It's now National Pizza Month!";
      } else{
        int monthsUntilPizzaDay = getMonthsBeforePizzaMonth(getCurrentMonthNum());
        lastMessageLine2 = "$monthsUntilPizzaDay months until National Pizza Month";
      }
    } else{
      if(inputBirthMonth == getCurrentMonthNum()){
        lastMessageLine2 = "It's your birthday months";
      } else{
        int monthsUntilBirthday = inputBirthMonth - getCurrentMonthNum();
        if(monthsUntilBirthday > 0){
          lastMessageLine2 = "comes in $monthsUntilBirthday months";
        } else{
          lastMessageLine2 = "comes in " + (monthsUntilBirthday + 12).toString() + " months";
        }
      }
    }
      return lastMessageLine2;
    }

    String getLastMessageLine3() {
      String lastMessageLine3;
      if(inputFeelAboutPizza < 300 ){
        lastMessageLine3 = "Celebrate!";
      } else{
        lastMessageLine3 = 'Cowabunga!';
      }
      return lastMessageLine3;
    }

    int getCurrentMonthNum() {
      DateTime date = DateTime.now();
      int currentMonthNum = date.month;
      return currentMonthNum;
    }
    String getDayOfWeekName (dayOfWeekNum){
      String weekName;
      switch (dayOfWeekNum){
        case 1:
          weekName = "Monday";
          break;
        case 2:
          weekName = "Tuesday";
          break;
        case 3:
          weekName = "Wednesday";
          break;
        case 4:
          weekName = "Thursday";
          break;
        case 5:
          weekName = "Friday";
          break;
        case 6:
          weekName = "Saturday";
          break;
        case 7:
          weekName = "Sunday";
          break;
      }
      return weekName;
    }

    int getMonthsBeforePizzaMonth(currentMonth){
      int numMonths = 10 - currentMonth;
      if(numMonths >= 0){
        return numMonths;
      }
      else{
        return numMonths + 12;
      }
    }
  }
