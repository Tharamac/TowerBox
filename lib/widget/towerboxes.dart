import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tower_box_test/blocs/animated_state_cubit.dart';
import 'package:tower_box_test/blocs/colors_blocs.dart';
import 'package:tower_box_test/widget/diamond_shape.dart';
import 'package:tower_box_test/widget/towerbox.dart';

class TowerBoxes extends StatefulWidget {
  const TowerBoxes({Key? key}) : super(key: key);

  @override
  State<TowerBoxes> createState() => _TowerBoxesState();
}

class _TowerBoxesState extends State<TowerBoxes> {
  final key = GlobalKey<AnimatedListState>();

  void removeItem(int index, List<Color> state) {
    key.currentState?.removeItem(index, (context, animation) {
      if (index == state.length) {
        return const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: DiamondShapeBox(),
        );
      } else {
        // print(state.length);
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TowerBox(color: state[index]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TowerColorsCubit, List<Color>>(
        builder: (context, state) =>
            BlocBuilder<AnimatedListStateCubit, GlobalKey<AnimatedListState>>(
                builder: ((context, state1) => AnimatedList(
                      key: state1,
                      reverse: true,
                      shrinkWrap: true,
                      initialItemCount: state.length + 1,
                      padding: const EdgeInsets.only(bottom: 24),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index, animation) {
                        if (index == state.length) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 30),
                            child: DiamondShapeBox(),
                          );
                        } else {
                          // print(state.length);
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TowerBox(color: state[index]),
                          );
                        }
                      },
                    ))));
  }
}
