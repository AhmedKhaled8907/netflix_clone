import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/managers/color_manager.dart';
import 'package:netflix_clone/features/main/presentation/controller/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<MainViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);
        return Scaffold(
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: ColorManager.primaryColor,
            unselectedItemColor: ColorManager.primaryColor.withOpacity(0.4),
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeCurrentIndex(index);
            },
            items: cubit.navBarItems,
          ),
        );
      },
    );
  }
}
