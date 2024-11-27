import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/core/utils/managers/assets_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text('Home View'),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p8),
        child: SvgPicture.asset(
          Assets.imagesLogo2,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: AppPadding.p8),
            child: SvgPicture.asset(
              Assets.imagesSearch,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
