import 'package:flutter/material.dart';
import 'package:tower_box_test/widget/destory_box_btn.dart';
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
                    children: [DestroyBoxButton(color: colors[0])]),
              )),
          Expanded(
              flex: 64,
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [DestroyBoxButton(color: colors[1])]),
              )),
        ],
      ));
}
