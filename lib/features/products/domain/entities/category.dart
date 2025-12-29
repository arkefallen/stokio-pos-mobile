import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// Category entity for product classification
@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'is_active') bool? isActive,
    String? icon,
    int? color,
  }) = _Category;

  const Category._();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
      
        @override
        int? get color => throw UnimplementedError();
      
        @override
        String? get description => throw UnimplementedError();
      
        @override
        String? get icon => throw UnimplementedError();
      
        @override
        int get id => throw UnimplementedError();
      
        @override
        bool? get isActive => throw UnimplementedError();
      
        @override
        String get name => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}
