import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tower_box_test/widget/destory_box_btn.dart';
import 'package:tower_box_test/widget/towerbox.dart';
import 'dart:math';

const colors = [Color.fromARGB(255, 216, 154, 174), Colors.blue];

class VerticalTowerView extends StatelessWidget {
  const VerticalTowerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 80,
              child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                              Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(
                                    pi / 4,
                                  ),
                                  child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD27AFF),
                                        border: Border.all(
                                          width: 0.7,
                                          color: Colors.black,
                                        ),
                                      ))),
                              const SizedBox(
                                height: 36,
                              )
                            ] +
                            List<Widget>.generate(
                                18,
                                (i) => (i % 2 == 0)
                                    ? const TowerBox()
                                    : const SizedBox(height: 4)),
                      )))),
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
