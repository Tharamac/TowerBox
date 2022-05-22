import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tower_box_test/blocs/colors_blocs.dart';

class DestroyBoxButton extends StatelessWidget {
  final Color color;
  late Timer _timer;
  DestroyBoxButton({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TowerColorsCubit, List<Color>>(
        builder: (context, state) => RawGestureDetector(
                gestures: <Type, GestureRecognizerFactory>{
                  LongPressGestureRecognizer:
                      GestureRecognizerFactoryWithHandlers<
                          LongPressGestureRecognizer>(
                    () => LongPressGestureRecognizer(
                      debugOwner: this,
                      duration: const Duration(seconds: 2),
                    ),
                    (LongPressGestureRecognizer instance) {
                      instance.onLongPress = () {
                        if (color == state.last) {
                          print("correct");
                        } else {
                          print("incorrect");
                        }
                      };
                    },
                  ),
                },
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: color,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(32),
                      shadowColor: null,
                      elevation: 0,
                      side: const BorderSide(color: Colors.black)),
                  child: null,
                )));
  }
}
