import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class Story {
  final StoryDetails? story;

  Story({this.story});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
  Map<String, dynamic> toJson() => _$StoryToJson(this);

  String get coverSrc => story?.item?.coverSrc ?? '';
}

@JsonSerializable()
class StoryDetails {
  final StoryItem? item;

  StoryDetails({this.item});

  factory StoryDetails.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StoryDetailsToJson(this);
}

@JsonSerializable()
class StoryItem {
  @JsonKey(name: 'cover_src', defaultValue: '')
  final String? coverSrc;

  StoryItem({required this.coverSrc});

  factory StoryItem.fromJson(Map<String, dynamic> json) =>
      _$StoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$StoryItemToJson(this);
}
