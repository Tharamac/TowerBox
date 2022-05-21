import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tower_box_test/widget/towerbox.dart';

class VerticalTowerView extends StatelessWidget {
  const VerticalTowerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List<Widget>.generate(
                    18,
                    (i) => (i % 2 == 0)
                        ? const TowerBox()
                        : const SizedBox(height: 4)),
              )),
          Expanded(
              flex: 16,
              child: Container(
                color: Colors.white,
              )),
        ],
      ));
}
