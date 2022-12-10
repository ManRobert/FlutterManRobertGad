import 'package:freezed_annotation/freezed_annotation.dart';

part 'torrent.g.dart';

part 'torrent.freezed.dart';

@freezed
class Torrent with _$Torrent {
  const factory Torrent({
    required String url,
    required String quality,
    required String size,
  }) = Torrent$;

  factory Torrent.fromJson(Map<dynamic, dynamic> json) => _$TorrentFromJson(Map<String, dynamic>.from(json));
}
