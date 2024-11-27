import 'package:go_router/go_router.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/features/splash/presentation/views/splash_view.dart';

abstract class RouterManager {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: StringManager.initialRoute,
      builder: (context, state) => const SplashView(),
    ),
  ]);
}
