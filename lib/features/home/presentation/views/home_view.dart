import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/core/utils/managers/assets_manager.dart';
import 'package:netflix_clone/core/utils/managers/router_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/home/presentation/views/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const HomeViewBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p16,
          top: AppPadding.p8,
        ),
        child: SvgPicture.asset(
          Assets.imagesLogo2,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              RouterManager.kSearchRoute,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppPadding.p16,
              top: AppPadding.p8,
            ),
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
