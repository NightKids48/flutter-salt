part of 'models.dart';

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((e) => ProductModel.fromJson(e)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
