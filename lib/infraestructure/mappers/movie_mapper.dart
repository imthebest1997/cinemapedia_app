import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != "" 
      ? "https://image.tmdb.org/t/p/w500${moviedb.backdropPath}"
      : "https://i3.cpcache.com/merchandise/53_300x300_Front_Color-NA.jpg?Size=NA&AttributeValue=NA&c=True&OrientationNo=1&region={%22name%22:%22FrontCenter%22,%22width%22:13.5,%22height%22:13.5,%22alignment%22:%22MiddleCenter%22,%22orientation%22:1,%22dpi%22:150,%22crop_x%22:0,%22crop_y%22:0,%22crop_h%22:2100,%22crop_w%22:2100,%22scale%22:0,%22template%22:{%22id%22:79696520,%22params%22:{}}}&cid=PUartJBjiF%2Fyg4FdKqiggQ%3D%3D+%7C%7C+1FW2jAg%2F%2BiGpUHcyqwFrSQ%3D%3D&ProductNo=879723340%20&Filters=[{%22name%22:%22background%22,%22value%22:%22ddddde%22,%22sequence%22:2}]",
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != "")
      ? "https://image.tmdb.org/t/p/w500${ moviedb.posterPath }"
      : "no-poster",
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );
}
