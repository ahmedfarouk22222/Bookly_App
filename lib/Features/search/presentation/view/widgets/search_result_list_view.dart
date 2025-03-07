import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.searchBooksResult});
  final List<BookModel> searchBooksResult;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookModel: searchBooksResult[index],
          ),
        );
      },
    );
  }
}
