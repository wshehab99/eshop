class Rating {
  final double rate;
  final int count;
  Rating({required this.count, required this.rate});
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        count: json['count'],
        rate: double.parse(json['rate'].toString()),
      );
}
