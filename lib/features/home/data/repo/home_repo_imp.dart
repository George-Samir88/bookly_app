import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/dio_helper.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepoImp implements HomeRepo {
  final DioHelper dioHelper;

  HomeRepoImp({required this.dioHelper});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await dioHelper.get(
          endPoint:
              'v1/volumes?q=computer science&Filtering=free-ebooks&Sorting=newest');
      List<BookModel> books = [];
      for (var element in data['items']) {
        try {
          books.add(BookModel.fromJson(element));
        } catch (e) {
          books.add(BookModel.fromJson(element));
          debugPrint(e.toString());
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        debugPrint('from home repo imp dio exception type is ${e.type}');
        debugPrint('from home repo imp dio exception error is ${e.error}');
        debugPrint('from home repo imp dio exception message is ${e.message}');
        debugPrint(
            'from home repo imp dio exception response is ${e.response}');
        return left(ServerFailure.fromDioException(dioException: e));
      }
      return left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await dioHelper.get(
          endPoint: 'v1/volumes?q=subject:Programming&Filtering=free-ebooks');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }
      return left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await dioHelper.get(
          endPoint:
              'v1/volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=relevance');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(dioException: e));
      }
      return left(ServerFailure(error: e.toString()));
    }
  }
}
