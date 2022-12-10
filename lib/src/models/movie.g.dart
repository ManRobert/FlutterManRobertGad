// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Movie$ _$$Movie$FromJson(Map<String, dynamic> json) => _$Movie$(
      title: json['title'] as String,
      image: json['medium_cover_image'] as String,
      genres: (json['genres'] as List<dynamic>).map((dynamic item) => item as String).toList(),
      year: json['year'] as int,
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'] as int,
      torrents: (json['torrents'] as List<dynamic>)
          .map((dynamic item) => Torrent.fromJson(item as Map<String, dynamic>))
          .toList(),
      description: json['description_full'] as String,
      largeImage: json['large_cover_image'] as String,
    );

Map<String, dynamic> _$$Movie$ToJson(_$Movie$ instance) => <String, dynamic>{
      'title': instance.title,
      'medium_cover_image': instance.image,
      'genres': instance.genres,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'torrents': instance.torrents,
      'description_full': instance.description,
      'large_cover_image': instance.largeImage,
    };
