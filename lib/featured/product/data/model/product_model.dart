import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "rating")
  final Rating? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
    this.rating,
  }) : super(
    productId: id,
    productImage: image,
    name: title,
    productPrice: price,
    details: description,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}


@JsonSerializable()
class Rating {
  @JsonKey(name: "rate")
  final double? rate;
  @JsonKey(name: "count")
  final int? count;

  Rating ({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RatingToJson(this);
  }
}


