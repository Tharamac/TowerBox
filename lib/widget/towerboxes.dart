import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tower_box_test/blocs/colors_blocs.dart';
import 'package:tower_box_test/widget/diamond_shape.dart';
import 'package:tower_box_test/widget/towerbox.dart';

class TowerBoxes extends StatelessWidget {
  const TowerBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TowerColorsCubit, List<Color>>(
        builder: (context, state) => AnimatedList(
              reverse: true,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 24),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index, animation) {
                if (index == state.length) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: DiamondShapeBox(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TowerBox(color: state[index]),
                  );
                }
              },
              initialItemCount: state.length + 1,
            ));
  }
}
