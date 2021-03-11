import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable(createToJson: false)
class Movie {
  int id;

  @JsonKey(name: 'vote_average')
  var voteAverage;

  String title;

  @JsonKey(name: 'poster_path')
  String posterPath;

  String overview;

  String releaseDate;

  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  Movie(
      {this.id,
      this.voteAverage,
      this.title,
      this.posterPath,
      this.overview,
      this.releaseDate,
      this.genreIds});
  factory Movie.fromJson(Map<String, dynamic> js) => _$MovieFromJson(js);

}
