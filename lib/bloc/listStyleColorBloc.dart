import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ColorBloc extends BlocBase{
  ColorBloc();
  var _colorController = BehaviorSubject<Color>.seeded(Colors.white);
  // Output
  Stream<Color> get colorStream => _colorController.stream;
  // Input
  Sink<Color> get colorSink => _colorController.sink;

  setColor(Color color){
    colorSink.add(color);
  }
  @override
  void dispose() {
    super.dispose();
    _colorController.close();
  }
}
