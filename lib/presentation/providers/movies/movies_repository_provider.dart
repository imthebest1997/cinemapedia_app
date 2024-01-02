
import 'package:cinemapedia_app/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_app/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MovieDbDatasource());
});