import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/core/di/injection_container.dart';
import 'package:blocs_app/core/observer/bloc_observer.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar orientación de pantalla
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Inicializar dependencias
  await initializeDependencies();

  // Configurar el observer de BLoC para debugging
  Bloc.observer = AppBlocObserver();

  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<UsernameCubit>()),
      BlocProvider(create: (context) => sl<RouterSimpleCubit>()),
      BlocProvider(create: (context) => sl<CounterCubit>()),
      BlocProvider(create: (context) => sl<ThemeCubit>()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final themeCubit = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: themeCubit.isDarkMode).getTheme(),
    );
  }
}
