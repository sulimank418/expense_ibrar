// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyChanger with ChangeNotifier {
  // Dialogbox data
  static String currencyPickerVal = "PKR";
  static bool isCheckedManagement = false;
  static bool isCheckedExpenses = false;
  static bool isDailyReminderOn = false;
  static bool isSmartReminderOn = false;

  static bool isCurrencySelect = false;
  static List<CurrencyPicker> testercurrency = <CurrencyPicker>[];
  // textfield data
  static String textfieldData = "";
  String switchCurrency() {
    return currencyPickerVal;
  }

  void switchValue(val) {
    currencyPickerVal = val;
    for (var i = 0; i < testercurrency.length; i++) {
      if (val == testercurrency[i].countrySymbol) {
        testercurrency[i].selectedCurrency = true;
      } else {
        testercurrency[i].selectedCurrency = false;
      }
    }
    notifyListeners();
  }
}

class CurrencyPicker {
  CurrencyPicker({required this.countrySymbol, required this.selectedCurrency});
  final String countrySymbol;
  bool selectedCurrency;
}

// themedata 
class MyTheme with ChangeNotifier{
  static int selectTheme = 1;
  ThemeMode currentTheme(){
    return selectTheme == 1? ThemeMode.light : ThemeMode.dark;
  }
  void switchTheme(val){
    selectTheme = val;
    notifyListeners();
  }

}
