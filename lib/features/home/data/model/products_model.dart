class ProductstModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductstModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductstModel.fromJson(jsondata) {
    return ProductstModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: jsondata['price'],
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      rating: RatingModel.fromJson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsondata) {
    return RatingModel(rate: jsondata['rate'], count: jsondata['count']);
  }
}
