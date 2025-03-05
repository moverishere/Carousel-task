// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
  story:
      json['story'] == null
          ? null
          : StoryDetails.fromJson(json['story'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
  'story': instance.story,
};

StoryDetails _$StoryDetailsFromJson(Map<String, dynamic> json) => StoryDetails(
  item:
      json['item'] == null
          ? null
          : StoryItem.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StoryDetailsToJson(StoryDetails instance) =>
    <String, dynamic>{'item': instance.item};

StoryItem _$StoryItemFromJson(Map<String, dynamic> json) =>
    StoryItem(coverSrc: json['cover_src'] as String? ?? '');

Map<String, dynamic> _$StoryItemToJson(StoryItem instance) => <String, dynamic>{
  'cover_src': instance.coverSrc,
};
