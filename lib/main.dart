import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/app_bloc_observer.dart';
import 'package:netflix_clone/core/utils/functions/service_locator.dart';
import 'package:netflix_clone/core/utils/managers/router_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/theme_manager.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringManager.appName,
      theme: ThemeManager.darkTheme,
      routerConfig: RouterManager.routes,
    );
  }
}
