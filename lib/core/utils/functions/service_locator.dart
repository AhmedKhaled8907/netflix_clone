import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/movies/data/data_sources/movie_data_source.dart';
import 'package:netflix_clone/core/movies/data/repos/movie_repo_impl.dart';
import 'package:netflix_clone/core/movies/domain/repo/movie_repo.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_usecase.dart';
import 'package:netflix_clone/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:netflix_clone/features/search/presentation/controller/search_bloc/search_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<MovieDataSource>(
    () => MovieDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(movieDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => GetMoviesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetSearchMoviesUseCase(getIt()));

  getIt.registerFactory(() => MovieCubit(getIt()));
  getIt.registerFactory(() => SearchBloc(getIt()));
}
