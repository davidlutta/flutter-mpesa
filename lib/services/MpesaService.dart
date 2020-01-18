import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mpesa/env.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MpesaService {
  final String _baseUrl;
  final String _clientKey;
  final String _clientSecret;
  final String _accessToken;
  final String _passKey;
  String _securityCredential;
  String _globalBusinessShortCode;

  MpesaService(
      {@required String clientKey,
      @required String clientSecret,
      @required String passKey,
      @required String baseurl
      })
      : _passKey = passKey,
        _clientKey = clientKey,
        _clientSecret = clientSecret,
        _accessToken =
            base64Url.encode((clientKey + ":" + clientSecret).codeUnits),
        _globalBusinessShortCode = "174379",
        _baseUrl=baseurl
         {}

  Future<String> _authenticate() async {
    try {
      http.Response response = await http.get(
          "$_baseUrl${Environment.oAuthPath}",
          headers: {"Authorization": "Basic $_accessToken"});
      var data = jsonDecode(response.body);
      return data["access_token"];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map> initializeMpesa({
    @required String phoneNumber,
    @required String amount,
    @required String callbackUrl,
    String businessShortCode = "174379",
    String transactionType = "CustomerPayBillOnline",
    String accountReference = "account",
    String transactionDescription = "Lipa Na Mpesa Online",
  }) async {
    if (!phoneNumber.startsWith("254")) {
      throw "Phone Number must start with 254";
    } else {
      try {
        var rawTimeStamp = new DateTime.now();
        var formatter = new DateFormat('yyyyMMddHHmmss');
        String actualTimeStamp = formatter.format(rawTimeStamp);

        String _rawPassword = businessShortCode + _passKey + actualTimeStamp;
        List<int> _paswordBytes = utf8.encode(_rawPassword);
        String password = base64.encode(_paswordBytes);

        String token = await _authenticate();

        //payload
        String _body = json.encode({
          'BusinessShortCode': businessShortCode,
          'Password': password,
          'Timestamp': actualTimeStamp,
          'TransactionType': transactionType,
          'Amount': amount,
          'PartyA': phoneNumber,
          'PartyB': businessShortCode,
          'PhoneNumber': phoneNumber,
          'CallBackURL': callbackUrl.toString(),
          'AccountReference': accountReference,
          'TransactionDesc': transactionDescription
        });

        http.Response response = await http.post(
          "$_baseUrl${Environment.stkQueryPath}",
          body: _body,
          headers: {
            'Authorization':'Bearer $token',
            'Content-Type':'application/json'
          }
        );

        if(response.statusCode == 200){
          return json.decode(response.body);
        }else{
          return json.decode(response.body);
        }
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }
}
