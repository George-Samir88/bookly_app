part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksGetSuccessState extends NewestBooksState {
  final List<BookModel> books;

  NewestBooksGetSuccessState(this.books);
}

class NewestBooksGetLoadingState extends NewestBooksState {}

class NewestBooksGetFailureState extends NewestBooksState {
  final String error;

  NewestBooksGetFailureState(this.error);
}
