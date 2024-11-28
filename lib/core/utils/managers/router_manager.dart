import 'package:go_router/go_router.dart';
import 'package:netflix_clone/features/home/presentation/views/home_view.dart';
import 'package:netflix_clone/features/main/presentation/views/main_view.dart';
import 'package:netflix_clone/features/search/presentation/views/search_view.dart';
import 'package:netflix_clone/features/splash/presentation/views/splash_view.dart';

abstract class RouterManager {
  static const kInitialRoute = '/';
  static const kHomeRoute = '/home';
  static const kSearchRoute = '/search';
  static const kMainRoute = '/main';

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
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kMainRoute,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
