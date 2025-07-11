import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Solo en modo debug
    assert(() {
      print('${bloc.runtimeType} $change');
      return true;
    }());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    assert(() {
      print('${bloc.runtimeType} $transition');
      return true;
    }());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('${bloc.runtimeType} Error: $error');
    print('StackTrace: $stackTrace');
  }
}
