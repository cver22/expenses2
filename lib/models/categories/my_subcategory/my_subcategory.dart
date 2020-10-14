import 'package:expenses/models/categories/my_category/my_category.dart';
import 'package:expenses/models/categories/my_subcategory/my_subcategory_entity.dart';
import 'package:flutter/material.dart';

@immutable
class MySubcategory extends MyCategory {
  final String parentCategoryId;

  MySubcategory({id, name, iconData, isDefault, @required this.parentCategoryId})
      : super(id: id, name: name, iconData: iconData, isDefault: isDefault);

  @override
  List<Object> get props => [parentCategoryId, id, name, iconData, isDefault];

  @override
  MySubcategory copyWith({
    String parentCategoryId,
    String id,
    String name,
    IconData iconData,
    bool isDefault,
  }) {
    return MySubcategory(
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      id: id ?? this.id,
      name: name ?? this.name,
      iconData: iconData ?? this.iconData,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  String toString() {
    return 'MySubcategory {parentCategoryId: $parentCategoryId, id: $id, name: $name, iconData: $iconData, isDefault $isDefault}';
  }


  @override
  MySubcategoryEntity toEntity() {
    return MySubcategoryEntity(
      parentCategoryId: parentCategoryId,
      id: id,
      name: name,
      iconCodePoint: iconData?.codePoint.toString(),
      iconFontFamily: iconData?.fontFamily,
      isDefault: isDefault,
    );
  }

  @override
  static MySubcategory fromEntity(MySubcategoryEntity entity) {
    return MySubcategory(
      parentCategoryId: entity.parentCategoryId,
      id: entity.id,
      name: entity.name,
      iconData: entity?.iconCodePoint != null && entity?.iconFontFamily !=null ?IconData(int.parse(entity.iconCodePoint),
          fontFamily: entity.iconFontFamily) : null,
      isDefault: entity.isDefault,
    );
  }
}
