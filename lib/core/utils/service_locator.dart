import 'package:bookly_app/core/utils/dio_helper.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  //apply dependency injection to avoid duplicated code and
  // change of code reflect in all places uses it
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(dioHelper:
      getIt.get<DioHelper>(),
    ),
  );
}
