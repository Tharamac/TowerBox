import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoubleHoldCubit extends Cubit<int> {
  DoubleHoldCubit() : super(0);

  void holdCount() => emit(state + 1);
  void removeCount() {
    if (state > 0)
      emit(state - 1);
    else
      emit(0);
  }
}
