import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksGetSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDetailsViewPath,
                            extra: state.books[index]);
                      },
                      child: CustomBookItem(
                        imageUrl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                itemCount: state.books.length),
          );
        } else if (state is FeaturedBooksGetFailureState) {
          return CustomErrorWidget(error: state.error.toString());
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
