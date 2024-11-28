import 'package:flutter/material.dart';
import 'package:netflix_clone/core/utils/managers/color_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';

class SearchBarItems extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? clearSearch;
  final FocusNode focusNode;

  const SearchBarItems({
    super.key,
    required this.controller,
    required this.clearSearch,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            cursorColor: ColorManager.primaryColor,
            style: StyleManager.styleMedium16(context),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16,
                horizontal: AppPadding.p8,
              ),
              hintText: StringManager.search,
              hintStyle: StyleManager.styleMedium14(context)
                  .copyWith(color: ColorManager.grey),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: ColorManager.grey,
              filled: true,
              fillColor: ColorManager.searchField,
              border: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              focusedBorder: _outlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      // borderRadius: BorderRadius.circular(
      //   AppSize.s16,
      // ),
      borderSide: BorderSide.none,
    );
  }
}
