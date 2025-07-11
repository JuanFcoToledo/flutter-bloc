import 'package:get_it/get_it.dart';

import '../../config/router/app_router.dart';
import '../../presentation/blocs/blocs.dart';
import '../network/network_info.dart';

final sl = GetIt.instance; // Service Locator

Future<void> initializeDependencies() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Features - Theme
  _initTheme();

  // Features - Username
  _initUsername();

  // Features - Counter
  _initCounter();

  // Router
  sl.registerLazySingleton<RouterSimpleCubit>(() => RouterSimpleCubit());
}

void _initTheme() {
  // External
  // Data Sources
  // Repositories
  // Use Cases
  // Presentation
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
}

void _initUsername() {
  sl.registerFactory<UsernameCubit>(() => UsernameCubit());
}

void _initCounter() {
  sl.registerFactory<CounterCubit>(() => CounterCubit());
}
