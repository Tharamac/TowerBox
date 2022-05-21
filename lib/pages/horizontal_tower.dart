import 'package:flutter/material.dart';

import '../widget/towerbox.dart';

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
              )),
        ],
      ));
}
