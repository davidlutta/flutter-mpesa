import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mpesa/bloc/CartListBloc.dart';
import 'package:flutter_mpesa/bloc/listStyleColorBloc.dart';
import 'package:flutter_mpesa/screens/Screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i)=> ColorBloc())
      ],
      child: MaterialApp(
        title: 'Salad Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: SignUpScreen(),
      ),
    );
  }
}
