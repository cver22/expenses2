// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_subcategory_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySubcategoryEntity _$MySubcategoryEntityFromJson(Map<String, dynamic> json) {
  return MySubcategoryEntity(
    id: json['id'],
    name: json['name'],
    iconCodePoint: json['iconCodePoint'],
    iconFontFamily: json['iconFontFamily'],
    parentCategoryId: json['parentCategoryId'] as String,
  );
}

Map<String, dynamic> _$MySubcategoryEntityToJson(
        MySubcategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconCodePoint': instance.iconCodePoint,
      'iconFontFamily': instance.iconFontFamily,
      'parentCategoryId': instance.parentCategoryId,
    };