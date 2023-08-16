part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksGetSuccessState extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksGetSuccessState(this.books);
}

class FeaturedBooksGetLoadingState extends FeaturedBooksState {}

class FeaturedBooksGetFailureState extends FeaturedBooksState {
  final String error;

  FeaturedBooksGetFailureState(this.error);
}
