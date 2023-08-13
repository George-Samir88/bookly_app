import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.19,
                  ),
                  child: const CustomBookItem(),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'The Jungle Book',
                  style: Styles.textStyle30.copyWith(
                      fontWeight: FontWeight.bold, fontFamily: kGtSectraFine),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Rudyard Kipling',
                  style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37.0,
                ),
                const BookActions(),
                const Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),// if screen max size sized box will be expanded
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const SimilarBookListView(),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


