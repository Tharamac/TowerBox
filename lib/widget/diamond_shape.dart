import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class DiamondShapeBox extends StatelessWidget {
  const DiamondShapeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.35,
        // heightFactor: 0.5,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                pi / 4,
              ),
              child: Container(
                  // height: 140,

                  decoration: BoxDecoration(
                color: const Color(0xFFD27AFF),
                border: Border.all(
                  width: 0.7,
                  color: Colors.black,
                ),
              ))),
        ));
  }
}
