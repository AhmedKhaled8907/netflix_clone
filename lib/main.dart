import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/app_bloc_observer.dart';
import 'package:netflix_clone/core/utils/functions/service_locator.dart';
import 'package:netflix_clone/core/utils/managers/router_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/theme_manager.dart';
import 'package:netflix_clone/features/home/presentation/controller/movie_cubit/movie_cubit.dart';
import 'package:netflix_clone/features/main/presentation/controller/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:netflix_clone/features/search/presentation/controller/search_bloc/search_bloc.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<BottomNavBarCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MovieCubit>()..getMovieList(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: StringManager.appName,
        theme: ThemeManager.darkTheme,
        routerConfig: RouterManager.routes,
      ),
    );
  }
}
