import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import 'custom_search_bar.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 30, left: 2),
                child: Column(
                  children: [
                    const CustomSearchAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Search Results',
                          style: Styles.textStyle18.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            state is SearchLoading
                ? const SliverFillRemaining(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomLoadingIndicator(),
                    ),
                  )
                : SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchSuccess) {
                            return SearchResultListView(
                              searchBooksResult: state.books,
                            );
                          } else if (state is SearchLoading) {
                            return const CustomLoadingIndicator();
                          } else if (state is SearchInitial) {
                            return Center(
                              child: Image.asset(
                                'assets/images/Animation.gif',
                                height: 300,
                                fit: BoxFit.fill,
                              ),
                            );
                          } else {
                            return CustomErrorWidget(
                              errMessage: state is SearchFailure
                                  ? state.errMessage
                                  : 'An error occurred',
                            );
                          }
                        },
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
