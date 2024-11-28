import 'package:flutter/material.dart';
import 'package:netflix_clone/features/main/presentation/views/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainViewBody(),
    );
  }
}
