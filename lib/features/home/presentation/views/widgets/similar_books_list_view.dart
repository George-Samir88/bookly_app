import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksGetSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CustomBookItem(
                      imageUrl:
                          'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: 10),
          );
        } else if (state is SimilarBooksGetFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
