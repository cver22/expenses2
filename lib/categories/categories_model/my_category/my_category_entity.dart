import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_category_entity.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class MyCategoryEntity extends Equatable {
  final String id;
  final String name;
  final String emojiChar;
  final Map<String, int> tagIdFrequency;

  const MyCategoryEntity(
      {this.id, this.name, this.emojiChar, this.tagIdFrequency});

  @override
  List<Object> get props => [id, name, emojiChar, tagIdFrequency];

  @override
  String toString() {
    return 'MyCategoryEntity {id: $id, name: $name, emojiChar $emojiChar tagIdFrequency: $tagIdFrequency}';
  }

  factory MyCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$MyCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyCategoryEntityToJson(this);

}
