import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tower_box_test/blocs/timer_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      secondsStr,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
