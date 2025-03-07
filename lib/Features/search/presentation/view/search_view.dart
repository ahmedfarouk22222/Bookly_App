
import 'package:bookly_app/Features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo/search_repo.dart';
import '../view_models/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepo>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
