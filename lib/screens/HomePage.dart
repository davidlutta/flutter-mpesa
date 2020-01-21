
import 'package:flutter/material.dart';
import 'package:flutter_mpesa/Constants.dart';
import 'package:flutter_mpesa/env.dart';
import 'package:flutter_mpesa/services/MpesaService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MpesaService mpesaService;
  @override
  void initState() {
    mpesaService = MpesaService(clientKey: Environment.CONSUMERKEY, clientSecret: Environment.CONSUMERSECRET, passKey: Environment.CONSUMERPASSKEY, baseurl: Environment.baseURl);
    super.initState();
  }
  var cream = Color(0xfffffdd0);
  String phoneNumber = "0";
  String amount = "";
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _amountTextController = TextEditingController();



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
                    controller: _phoneNumberTextController,
                  ),
                  SizedBox(height: 10,),
                  Text('Enter Amount'),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: kInputdecoration,
                    keyboardType: TextInputType.number,
                    controller: _amountTextController,
                  ),
                  SizedBox(height: 10,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("Pay",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 1.0,
                    height: 50.0,
                    minWidth: double.infinity,
                    color: cream,
                    onPressed:() {
                      phoneNumber = _phoneNumberTextController.text.toString();
                      amount = _amountTextController.text;
//                      makePayment(phoneNumber: phoneNumber,amount: amount);
                      _phoneNumberTextController.text='';
                      _amountTextController.text='';
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
