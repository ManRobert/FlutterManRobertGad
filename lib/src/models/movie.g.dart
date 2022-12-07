// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Movie$ _$$Movie$FromJson(Map<String, dynamic> json) => _$Movie$(
      title: json['title'] as String,
      image: json['medium_cover_image'] as String,
      genres: json['genres'].toString(),
      year: json['year'] as int,
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'] as int,
      description: json['description_full'] as String,
    );

Map<String, dynamic> _$$Movie$ToJson(_$Movie$ instance) => <String, dynamic>{
      'title': instance.title,
      'medium_cover_image': instance.image,
      'genres': instance.genres,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'description_full': instance.description,
    };
