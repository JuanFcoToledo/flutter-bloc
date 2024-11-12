import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1);

  void increment(int value) => emit(value + state);

  void decrement(int value) => emit(state - value);
}
