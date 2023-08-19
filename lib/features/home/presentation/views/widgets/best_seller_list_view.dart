import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item_of_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksGetSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BestSellerItemOfListView(
                    bookModel: state.books[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15.0,
                  );
                },
                itemCount: state.books.length),
          );
        } else if (state is NewestBooksGetFailureState) {
          return CustomErrorWidget(error: state.error.toString());
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
