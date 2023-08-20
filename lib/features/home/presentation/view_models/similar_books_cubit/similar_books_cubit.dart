import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  static SimilarBooksCubit getOb(context) => BlocProvider.of(context);

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksGetLoadingState());
    var data = await homeRepo.fetchSimilarBooks(category: category);
    data.fold((failure) {
      emit(SimilarBooksGetFailureState(error: failure.error));
    }, (books) {
      emit(SimilarBooksGetSuccessState(bookModel: books));
    });
  }
}
