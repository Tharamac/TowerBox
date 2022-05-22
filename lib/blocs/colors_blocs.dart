import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final random = Random();
const colors = [Color.fromARGB(255, 216, 154, 174), Colors.blue];
final colorsInit =
    List<Color>.generate(9, (index) => colors[random.nextInt(colors.length)]);

class TowerColorsCubit extends Cubit<List<Color>> {
  TowerColorsCubit() : super(colorsInit);

  void destroy() {
    state.removeLast();
    emit(state);
  }
}
