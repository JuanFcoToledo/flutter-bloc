import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocs_app/features/theme/presentation/cubit/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    late ThemeCubit themeCubit;

    setUp(() {
      themeCubit = ThemeCubit();
    });

    tearDown(() {
      themeCubit.close();
    });

    test('initial state should be light theme', () {
      expect(themeCubit.state, const ThemeState(isDarkMode: false));
    });

    blocTest<ThemeCubit, ThemeState>(
      'should emit dark theme when toggleDarkMode is called from light theme',
      build: () => themeCubit,
      act: (cubit) => cubit.toggleDarkMode(),
      expect: () => [const ThemeState(isDarkMode: true)],
    );

    blocTest<ThemeCubit, ThemeState>(
      'should emit light theme when toggleDarkMode is called from dark theme',
      build: () => ThemeCubit(darkmode: true),
      act: (cubit) => cubit.toggleDarkMode(),
      expect: () => [const ThemeState(isDarkMode: false)],
    );

    blocTest<ThemeCubit, ThemeState>(
      'should emit dark theme when setDarkMode is called with true',
      build: () => themeCubit,
      act: (cubit) => cubit.setDarkMode(true),
      expect: () => [const ThemeState(isDarkMode: true)],
    );

    blocTest<ThemeCubit, ThemeState>(
      'should emit light theme when setLightMode is called',
      build: () => ThemeCubit(darkmode: true),
      act: (cubit) => cubit.setLightMode(),
      expect: () => [const ThemeState(isDarkMode: false)],
    );
  });
}
