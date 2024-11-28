import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/home/presentation/views/home_view.dart';
import 'package:netflix_clone/features/search/presentation/views/search_view.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial(HomeView()));
  static BottomNavBarCubit get(BuildContext context) =>
      BlocProvider.of(context);
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget> views = [
    const HomeView(),
    const SearchView(),
  ];

  List<BottomNavigationBarItem> get navBarItems => [
        const BottomNavigationBarItem(
        icon: Icon(Icons.movie),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ];

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    emit(
      ChangeCurrentIndexState(
        views[_currentIndex],
      ),
    );
  }
}
