import 'package:go_router/go_router.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/features/home/presentation/views/home_view.dart';
import 'package:netflix_clone/features/splash/presentation/views/splash_view.dart';

abstract class RouterManager {
  static const kInitialRoute = StringManager.initialRoute;
  static const kHomeRoute = StringManager.homeRoute;

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: kInitialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
