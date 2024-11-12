import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkmode = false,
  }) : super(ThemeState(isDarkMode: darkmode));

  void toggleDarkMode() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode(bool isDarkMode) {
    emit(const ThemeState(isDarkMode: true));
  }

  void setLightMode() {
    emit(const ThemeState(isDarkMode: false));
  }
}
