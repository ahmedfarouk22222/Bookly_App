import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/search/data/repo/search_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));

    getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  
  
}
