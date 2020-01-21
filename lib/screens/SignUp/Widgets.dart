import 'package:flutter/material.dart';
import 'package:flutter_mpesa/screens/Screens.dart';
import 'package:flutter_mpesa/services/sharedPref.dart';

class PhoneNumberForm extends StatelessWidget {
  SharedPref pref = SharedPref();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400],
                blurRadius: 15,
                offset: Offset(5, 5),
                spreadRadius: 5)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Center(
              child: Text(
                "+254",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    letterSpacing: 3),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 2.0, left: 2),
              child: SizedBox(
                height: double.infinity,
                width: 200,
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLength: 9,
                  maxLines: 1,
                  autofocus: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 2),
                  decoration: InputDecoration(
                    hintText: "717283742",
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onSubmitted: (String val) async {
                    if (val.length == 9) {
                      pref.savePhoneNumber(val.trim());
                      var res = await pref.getPhoneNumber();
                      if (res == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Please input your number again"),
                          duration: Duration(milliseconds: 2000),
                        ));
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Number must be nine digits"),
                        duration: Duration(milliseconds: 2000),
                      ));
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        width: 45,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome to",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Text(
            "Salad Delivery",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 2,
            width: 150,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            """
Welcome to Salad Delivery,
the healthiest Delivery Service in the world.
Let's get strarted by entering your phone number 
don't worry we're only using it for Mpesa services😂
            """,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      )
    ],
  );
}
