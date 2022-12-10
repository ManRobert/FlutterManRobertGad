import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teme_flutter/src/models/torrent.dart';

part 'movie.g.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    @JsonKey(name: 'medium_cover_image') required String image,
    required List<String> genres,
    required int year,
    required double rating,
    required int runtime,
    required List<Torrent> torrents,
    @JsonKey(name: 'description_full') required String description,
    @JsonKey(name: 'large_cover_image') required String largeImage,
  }) = Movie$;

  factory Movie.fromJson(Map<dynamic, dynamic> json) => _$MovieFromJson(Map<String, dynamic>.from(json));
}
