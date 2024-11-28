import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/utils/managers/api_manager.dart';
import 'package:netflix_clone/features/home/data/data_sources/movie_data_source.dart';
import 'package:netflix_clone/features/home/data/repos/movie_repo_impl.dart';
import 'package:netflix_clone/features/home/domain/repo/movie_repo.dart';
import 'package:netflix_clone/features/home/domain/usecase/get_movies_usecase.dart';
import 'package:netflix_clone/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(Dio()),
  );

  getIt.registerLazySingleton<MovieDataSource>(
    () => MovieDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(movieDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => GetMoviesUsecase(getIt()));

  getIt.registerFactory(() => MovieCubit(getIt()));
}
