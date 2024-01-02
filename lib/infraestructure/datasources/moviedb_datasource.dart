import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource{
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {
      "api_key": Environment.movieDbKey,
      "language": "es-Mx"
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get("/movie/now_playing");
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-post')
      .map(
        (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();    

    return movies;
  }

}