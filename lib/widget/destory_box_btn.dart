import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tower_box_test/blocs/colors_blocs.dart';
import 'package:tower_box_test/blocs/double_tap.dart';
import 'package:tower_box_test/blocs/timer_bloc.dart';
import 'package:tower_box_test/blocs/timer_event.dart';
import 'package:tower_box_test/blocs/timer_state.dart';
import 'package:tower_box_test/widget/towerbox.dart';

import '../blocs/animated_state_cubit.dart';
import 'diamond_shape.dart';

class DestroyBoxButton extends StatefulWidget {
  DestroyBoxButton({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  State<DestroyBoxButton> createState() => _DestroyBoxButtonState();
}

class _DestroyBoxButtonState extends State<DestroyBoxButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLoading = false;
  bool timerStart = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TowerColorsCubit, List<Color>>(
        builder: (context, state) => BlocBuilder<AnimatedListStateCubit,
                GlobalKey<AnimatedListState>>(
            builder: ((context, animatedListState) => BlocBuilder<
                    DoubleHoldCubit, int>(
                builder: ((context, holdState) => BlocBuilder<TimerBloc,
                        TimerState>(
                    builder: (context, timerState) => RawGestureDetector(
                          gestures: <Type, GestureRecognizerFactory>{
                            LongPressGestureRecognizer:
                                GestureRecognizerFactoryWithHandlers<
                                    LongPressGestureRecognizer>(
                              () => LongPressGestureRecognizer(
                                debugOwner: this,
                                duration: const Duration(seconds: 2),
                              ),
                              (LongPressGestureRecognizer instance) {
                                instance.onLongPressCancel = () {
                                  context.read<DoubleHoldCubit>().removeCount();
                                  print(holdState);
                                };
                                instance.onLongPress = () {
                                  context.read<DoubleHoldCubit>().holdCount();

                                  if (state.isEmpty) {
                                    print(holdState);
                                    if (holdState >= 2) {
                                      print("object");
                                      animatedListState.currentState
                                          ?.removeItem(
                                              0,
                                              (context, animation) =>
                                                  FadeTransition(
                                                    opacity: animation,
                                                    child: SizeTransition(
                                                      sizeFactor: animation,
                                                      child: SizedBox(
                                                        height: 64,
                                                        child: Card(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 20),
                                                          elevation: 10,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                    }
                                    context
                                        .read<TimerBloc>()
                                        .add(TimerPaused());
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Ended'),
                                        content: Text('${timerState.duration}'),
                                      ),
                                    );
                                    return;
                                  } else if (widget.color == state.first) {
                                    if (!timerStart) timerStart = true;
                                    context.read<TimerBloc>().add(TimerStarted(
                                        duration: timerState.duration));
                                    print("correct");
                                    context
                                        .read<TowerColorsCubit>()
                                        .destroyBox();
                                    animatedListState.currentState?.removeItem(
                                        0,
                                        (context, animation) => FadeTransition(
                                              opacity: animation,
                                              child: SizeTransition(
                                                sizeFactor: animation,
                                                child: SizedBox(
                                                  height: 64,
                                                  child: Card(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 20),
                                                    elevation: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                            ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text('Wrong Answer!')),
                                    );
                                  }
                                };
                              },
                            ),
                          },
                          child: ElevatedButton(
                              // onLongPress: () async {
                              //   setState(() {
                              //     isLoading = true;
                              //   });
                              //   await Future.delayed(const Duration(seconds: 2));
                              //   setState(() {
                              //     isLoading = false;
                              //   });
                              // },
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: const Text('Press 2 second')),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: widget.color,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(32),
                                  shadowColor: null,
                                  elevation: 0,
                                  side: const BorderSide(color: Colors.black)),
                              child: null),
                        )))))));
  }
}
