import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/managers/font_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/style_manager.dart';
import 'package:netflix_clone/core/utils/managers/values_manager.dart';
import 'package:netflix_clone/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:netflix_clone/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:netflix_clone/features/search/presentation/views/widgets/search_results.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showNoDataMessage = false;
  String _lastQuery = '';
  final int _selectedSearchType = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
    _controller.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    final query = _controller.text;
    if (query.isEmpty) {
      context.read<SearchBloc>().add(ClearSearchResults());
      _startLoadingTimeout();
    } else {
      if (query != _lastQuery) {
        _lastQuery = query;

        _performSearch(query);
      }
    }
  }

  void _performSearch(String query) {
    if (_selectedSearchType == 0) {
      context.read<SearchBloc>().add(SearchMoviesQueryChanged(query: query));
    } else if (_selectedSearchType == 1) {
      context.read<SearchBloc>().add(SearchTvsQueryChanged(query: query));
    }
  }

  void _clearSearchWithUnfocus() {
    _controller.clear();
    _focusNode.unfocus();
    context.read<SearchBloc>().add(ClearSearchResults());
  }

  void _startLoadingTimeout() {
    final currentQuery = _lastQuery;

    setState(() {
      _showNoDataMessage = false;
    });

    Future.delayed(Duration(seconds: AppSize.s4.toInt()), () {
      if (mounted && _lastQuery == currentQuery && currentQuery.isNotEmpty) {
        final state = context.read<SearchBloc>().state;
        if (state is SearchLoading) {
          setState(() {
            _showNoDataMessage = true;
          });
        } else if (state is SearchMoviesSuccess && state.results.isEmpty) {
          setState(() {
            _showNoDataMessage = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.s16,
        // horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(
            controller: _controller,
            clearSearch: _clearSearchWithUnfocus,
            focusNode: _focusNode,
          ),
          const SizedBox(height: AppPadding.p20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: Text(
              StringManager.topSearch,
              style: StyleManager.styleBold18(context).copyWith(
                fontSize: FontSize.s22,
              ),
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          Expanded(
            child: _showNoDataMessage
                ? Center(
                    child: Text(
                      StringManager.noResultsFound,
                      style: StyleManager.styleMedium16(context),
                    ),
                  )
                : const SearchResults(),
          ),
        ],
      ),
    );
  }
}
