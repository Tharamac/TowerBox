import 'package:flutter/material.dart';
import 'package:tower_box_test/widget/destory_box_btn.dart';
import 'package:tower_box_test/widget/towerboxes.dart';
import 'dart:math';
import '../widget/towerbox.dart';

const colors = [Color.fromARGB(255, 216, 154, 174), Colors.blue];

class HorizontalTowerView extends StatelessWidget {
  const HorizontalTowerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Row(
        children: [
          Expanded(
              flex: 16,
              child: Container(
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DestroyBoxButton(color: colors[0]),
                        const SizedBox(
                          height: 16,
                        )
                      ]))),
          const Expanded(
              flex: 64,
              child: SizedBox(width: double.infinity, child: TowerBoxes())),
          Expanded(
              flex: 16,
              child: Container(
                color: Colors.white,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DestroyBoxButton(color: colors[1]),
                  const SizedBox(
                    height: 16,
                  )
                ]),
              )),
        ],
      ));
}
