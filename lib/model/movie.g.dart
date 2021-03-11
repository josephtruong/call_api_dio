// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    voteAverage: json['vote_average'],
    title: json['title'] as String,
    posterPath: json['poster_path'] as String,
    overview: json['overview'] as String,
    releaseDate: json['releaseDate'] as String,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}
