import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';
part 'movie.freezed.dart';


@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    @JsonKey(name: 'medium_cover_image') required String image,
    required String genres,
    required int year,
    required double rating,
    required int runtime,
    @JsonKey(name: 'description_full') required String description,

}) = Movie$;

  factory Movie.fromJson(Map<dynamic, dynamic> json) => _$MovieFromJson(Map<String, dynamic>.from(json));
}
