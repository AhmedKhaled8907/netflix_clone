import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/movies/data/data_sources/movie_data_source.dart';
import 'package:netflix_clone/core/movies/data/repos/movie_repo_impl.dart';
import 'package:netflix_clone/core/movies/domain/repo/movie_repo.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_search_usecase.dart';
import 'package:netflix_clone/core/movies/domain/usecase/get_movies_usecase.dart';
import 'package:netflix_clone/features/home/presentation/controller/movie_cubit/movie_cubit.dart';
import 'package:netflix_clone/features/main/presentation/controller/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:netflix_clone/features/movie_details/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
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
  getIt.registerLazySingleton(() => GetMovieDetailsUsecase(getIt()));

  getIt.registerFactory(() => MovieCubit(getIt()));
  getIt.registerFactory(() => SearchBloc(getIt()));
  getIt.registerFactory(() => BottomNavBarCubit());
  getIt.registerFactory(() => MovieDetailsBloc(getIt()));
}
