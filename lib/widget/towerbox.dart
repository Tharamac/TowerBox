import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

final _random = Random();
const colors = [Color.fromARGB(255, 216, 154, 174), Colors.blue];

class TowerBox extends StatelessWidget {
  const TowerBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.12,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: colors[_random.nextInt(colors.length)],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(width: 0.7, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
