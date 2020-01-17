import 'package:flutter/material.dart';
import 'package:flutter_mpesa/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cream = Color(0xfffffdd0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cream,
        body: Center(
          child: Container(
            height: 320,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Text('MPESA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 30,),
                  Text('Enter Your Phone Number'),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: kInputdecoration.copyWith(hintText: 'Eg:07XXXXXXXX'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  Text('Enter Amount'),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: kInputdecoration,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("Pay",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),
                    elevation: 1.0,
                    height: 50.0,
                    minWidth: double.infinity,
                    color: cream,
                    onPressed:(){
                      print('I HAVE BEEN PRESSED !!');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
