import 'rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final Rating rating;
  Product({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
    required this.category,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        description: json['description'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        image: json['image'],
        category: json['category'],
        rating: Rating.fromJson(json['rating']),
      );
  static List<Product> fromList(List list) =>
      list.map((e) => Product.fromJson(e)).toList();
}
