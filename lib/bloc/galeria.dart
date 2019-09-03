import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class GaleriaBloc extends BlocBase {
  final _blocUpdate = BehaviorSubject<double>();
  Stream get update => _blocUpdate.stream;
  double positionEnd = 0.0;
  double height = 0.0;
  bool delta = false;

  GaleriaBloc() {
    _blocUpdate.sink.add(0.0);
  }

  updateBloc(double val, height) {
    this.height = height;
    if (val < 0) {
      positionEnd = 0.0;
      _blocUpdate.sink.add(0.0);
    } else {
      if (height <= -25) {
        positionEnd = val;
        _blocUpdate.sink.add(val);
      }
    }
  }

  bottomBloc(heigth) {
    if (this.delta) {
       _blocUpdate.sink.add(0);
    } else {
      _blocUpdate.sink.add(heigth - 75);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _blocUpdate.close();
  }
}
