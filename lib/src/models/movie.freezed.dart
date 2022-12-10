// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie$.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  String get title => throw _privateConstructorUsedError;

  @JsonKey(name: 'medium_cover_image')
  String get image => throw _privateConstructorUsedError;

  List<String> get genres => throw _privateConstructorUsedError;

  int get year => throw _privateConstructorUsedError;

  double get rating => throw _privateConstructorUsedError;

  int get runtime => throw _privateConstructorUsedError;

  List<Torrent> get torrents => throw _privateConstructorUsedError;

  @JsonKey(name: 'description_full')
  String get description => throw _privateConstructorUsedError;

  @JsonKey(name: 'large_cover_image')
  String get largeImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) = _$MovieCopyWithImpl<$Res, Movie>;

  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'medium_cover_image') String image,
      List<String> genres,
      int year,
      double rating,
      int runtime,
      List<Torrent> torrents,
      @JsonKey(name: 'description_full') String description,
      @JsonKey(name: 'large_cover_image') String largeImage});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? genres = null,
    Object? year = null,
    Object? rating = null,
    Object? runtime = null,
    Object? torrents = null,
    Object? description = null,
    Object? largeImage = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      torrents: null == torrents
          ? _value.torrents
          : torrents // ignore: cast_nullable_to_non_nullable
              as List<Torrent>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      largeImage: null == largeImage
          ? _value.largeImage
          : largeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Movie$CopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$Movie$CopyWith(_$Movie$ value, $Res Function(_$Movie$) then) = __$$Movie$CopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'medium_cover_image') String image,
      List<String> genres,
      int year,
      double rating,
      int runtime,
      List<Torrent> torrents,
      @JsonKey(name: 'description_full') String description,
      @JsonKey(name: 'large_cover_image') String largeImage});
}

/// @nodoc
class __$$Movie$CopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res, _$Movie$> implements _$$Movie$CopyWith<$Res> {
  __$$Movie$CopyWithImpl(_$Movie$ _value, $Res Function(_$Movie$) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? genres = null,
    Object? year = null,
    Object? rating = null,
    Object? runtime = null,
    Object? torrents = null,
    Object? description = null,
    Object? largeImage = null,
  }) {
    return _then(_$Movie$(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      torrents: null == torrents
          ? _value._torrents
          : torrents // ignore: cast_nullable_to_non_nullable
              as List<Torrent>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      largeImage: null == largeImage
          ? _value.largeImage
          : largeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Movie$ implements Movie$ {
  const _$Movie$(
      {required this.title,
      @JsonKey(name: 'medium_cover_image') required this.image,
      required final List<String> genres,
      required this.year,
      required this.rating,
      required this.runtime,
      required final List<Torrent> torrents,
      @JsonKey(name: 'description_full') required this.description,
      @JsonKey(name: 'large_cover_image') required this.largeImage})
      : _genres = genres,
        _torrents = torrents;

  factory _$Movie$.fromJson(Map<String, dynamic> json) => _$$Movie$FromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'medium_cover_image')
  final String image;
  final List<String> _genres;

  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final int year;
  @override
  final double rating;
  @override
  final int runtime;
  final List<Torrent> _torrents;

  @override
  List<Torrent> get torrents {
    if (_torrents is EqualUnmodifiableListView) return _torrents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_torrents);
  }

  @override
  @JsonKey(name: 'description_full')
  final String description;
  @override
  @JsonKey(name: 'large_cover_image')
  final String largeImage;

  @override
  String toString() {
    return 'Movie(title: $title, image: $image, genres: $genres, year: $year, rating: $rating, runtime: $runtime, torrents: $torrents, description: $description, largeImage: $largeImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Movie$ &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            const DeepCollectionEquality().equals(other._torrents, _torrents) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.largeImage, largeImage) || other.largeImage == largeImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, const DeepCollectionEquality().hash(_genres), year, rating,
      runtime, const DeepCollectionEquality().hash(_torrents), description, largeImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Movie$CopyWith<_$Movie$> get copyWith => __$$Movie$CopyWithImpl<_$Movie$>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Movie$ToJson(
      this,
    );
  }
}

abstract class Movie$ implements Movie {
  const factory Movie$(
      {required final String title,
      @JsonKey(name: 'medium_cover_image') required final String image,
      required final List<String> genres,
      required final int year,
      required final double rating,
      required final int runtime,
      required final List<Torrent> torrents,
      @JsonKey(name: 'description_full') required final String description,
      @JsonKey(name: 'large_cover_image') required final String largeImage}) = _$Movie$;

  factory Movie$.fromJson(Map<String, dynamic> json) = _$Movie$.fromJson;

  @override
  String get title;

  @override
  @JsonKey(name: 'medium_cover_image')
  String get image;

  @override
  List<String> get genres;

  @override
  int get year;

  @override
  double get rating;

  @override
  int get runtime;

  @override
  List<Torrent> get torrents;

  @override
  @JsonKey(name: 'description_full')
  String get description;

  @override
  @JsonKey(name: 'large_cover_image')
  String get largeImage;

  @override
  @JsonKey(ignore: true)
  _$$Movie$CopyWith<_$Movie$> get copyWith => throw _privateConstructorUsedError;
}
