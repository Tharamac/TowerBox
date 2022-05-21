import 'package:flutter/material.dart';
import 'package:tower_box_test/widget/destory_box_btn.dart';

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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [DestroyBoxButton(color: colors[1])]),
              )),
        ],
      ));
}
