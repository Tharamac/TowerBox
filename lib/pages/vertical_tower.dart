import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tower_box_test/widget/destory_box_btn.dart';
import 'package:tower_box_test/widget/towerbox.dart';
import 'dart:math';

import 'package:tower_box_test/widget/towerboxes.dart';

const colors = [Color.fromARGB(255, 216, 154, 174), Colors.blue];

class VerticalTowerView extends StatelessWidget {
  const VerticalTowerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Column(
        children: [
          const Expanded(
              flex: 80,
              child: SizedBox(width: double.infinity, child: TowerBoxes())),
          Expanded(
            flex: 16,
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: colors
                      .map((e) => Flexible(child: DestroyBoxButton(color: e)))
                      .toList()),
            ),
          )
        ],
      ));
}
