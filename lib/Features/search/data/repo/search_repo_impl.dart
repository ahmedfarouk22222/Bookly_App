import 'dart:developer';


import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> getSearchResults(
      {required String query}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query',
      );
      List<BookModel> searchResultbooks = [];
      for (var item in data['items']) {
        searchResultbooks.add(BookModel.fromJson(item));
      }
      return right(searchResultbooks);
    } catch (e) {
      log('${e}error from here');
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure('$e'),
      );
    }
  }
}
