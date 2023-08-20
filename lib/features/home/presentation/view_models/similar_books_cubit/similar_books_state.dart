part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksGetSuccessState extends SimilarBooksState {
  final List<BookModel> bookModel;

  SimilarBooksGetSuccessState({required this.bookModel});
}

class SimilarBooksGetFailureState extends SimilarBooksState {
  final String error;

  SimilarBooksGetFailureState({required this.error});
}

class SimilarBooksGetLoadingState extends SimilarBooksState {}
