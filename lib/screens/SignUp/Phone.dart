import 'package:flutter/material.dart';
import 'package:flutter_mpesa/screens/SignUp/Widgets.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              title(),
              SizedBox(
                height: 50,
              ),
              PhoneNumberForm(),
            ],
          ),
        ),
      ),
    );
  }
}
