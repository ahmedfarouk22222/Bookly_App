import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> getSearchBooks(String query) async {
    emit(SearchLoading());
    final response = await searchRepo.getSearchResults(query: query);
    response.fold(
      (failure) {
        emit(SearchFailure(failure.toString()));
      },
      (searchBooksResult) {
        emit(SearchSuccess(searchBooksResult, query));
      },
    );
  }
}
