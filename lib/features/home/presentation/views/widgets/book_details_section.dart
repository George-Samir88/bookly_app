import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.19,
          ),
          child: const CustomBookItem(
            imageUrl:
                'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30
              .copyWith(fontWeight: FontWeight.bold, fontFamily: kGtSectraFine),
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
          count: 0,
          rating: 0,
        ),
        const SizedBox(
          height: 37.0,
        ),
        const BookActions(),
      ],
    );
  }
}
