import 'package:flutter_mpesa/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences preferences;

  SharedPref() {
    _init();
  }

  void _init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void savePhoneNumber(String phoneNumber) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(Environment.phonePrefsKey, "254" + phoneNumber);
  }

  Future<int> getPhoneNumber() async {
    preferences = await SharedPreferences.getInstance();
    final myString = preferences.getString(Environment.phonePrefsKey) ?? null;
    if (myString != null) {
      print('Successfully Saved Number');
      return 1;
    } else {
      return 0;
    }
  }
}
