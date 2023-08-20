import 'package:bookly_app/core/utils/helper_functions/launch_url.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_text_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              onPressed: () async {
                await launchCustomUrl(
                    bookModel.volumeInfo!.previewLink, context);
              },
              text: 'Free',
              backGroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
              textStyle: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.w900, color: Colors.black),
            ),
          ),
          Expanded(
            child: CustomTextButton(
              onPressed: () async {
                await launchCustomUrl(
                    bookModel.volumeInfo!.previewLink, context);
              },
              text: getButtonText(bookModel),
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              textStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getButtonText(BookModel bookModel) {
  if (bookModel.volumeInfo!.previewLink != null) {
    return 'Free Preview';
  } else {
    return 'Not available';
  }
}
