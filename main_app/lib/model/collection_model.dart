import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class Collection {
  @JsonKey(name: 'cover_image_url', defaultValue: '')
  final String coverImageUrl;

  Collection({required this.coverImageUrl});

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
