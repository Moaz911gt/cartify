class CartProductsModel {
  final int id;
  final String title;
  final dynamic price;
  final String image;
  // final RatingModel? rating;

  int quantity;

  CartProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    // this.rating,

    this.quantity = 1,
  });
  // @override
  // bool operator ==(Object other) {
  //   return other is CartProductsModel && other.id == id;
  // }

  factory CartProductsModel.fromJson(jsondata) {
    return CartProductsModel(
      id: jsondata['product_id'],
      title: jsondata['Pname'],
      price: jsondata['Pprice'],
      image: jsondata['Pimg'],
      // rating: jsondata['rating'] != null
      //     ? RatingModel.fromJson(jsondata['rating'])
      //     : null,
      quantity: int.parse(jsondata['Pquantity'].toString()),
    );
  }
  // factory CartProductsModel.fromMap(Map<String, dynamic> map) {
  //   return CartProductsModel(
  //     id: map['product_id'],
  //     title: map['Pname'],
  //     price: map['Pprice'],
  //     image: map['Pimg'],
  //     quantity: map['Pquantity'],
  //     //  int.tryParse(map['Pquantity'].toString()) ?? 1,
  //   );
  // }
  Map<String, dynamic> toMap() {
    return {
      'product_id': id,
      'Pname': title,
      'Pprice': price,
      'Pimg': image,
      'Pquantity': quantity.toString(),
    };
  }
}

// class RatingModel {
//   final dynamic rate;
//   final int count;

//   RatingModel({required this.rate, required this.count});

//   factory RatingModel.fromJson(jsondata) {
//     if (jsondata == null) {
//       return RatingModel(rate: 0, count: 0); // قيمة افتراضية
//     }
//     return RatingModel(
//       rate: jsondata['rate'] ?? 0,
//       count: jsondata['count'] ?? 0,
//     );
//   }
// }

// class CartProductsModel {
//   final int id;
//   final String title;
//   final dynamic price;
//   final String image;
//   int quantity;

//   CartProductsModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.image,
//     this.quantity = 1,
//   });

//   factory CartProductsModel.fromMap(Map<String, dynamic> map) {
//     return CartProductsModel(
//       id: map['product_id'],
//       title: map['Pname'],
//       price: map['Pprice'],
//       image: map['Pimg'],
//       quantity: int.tryParse(map['Pquantity'].toString()) ?? 1,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'product_id': id,
//       'Pname': title,
//       'Pimg': image,
//       'Pprice': price.toString(),
//       'Pquantity': quantity.toString(),
//     };
//   }
// }
