class AddToCartModel {
  final String id;
  final String productId;
  final String title;
  final int price;
  final int quantity;
  final String imgUrl;
  final int discountValue;
  final String color;
  final String size;

  AddToCartModel(
      {required this.id, required this.productId, required this.title, required this.price, this.quantity = 1,
        required this.imgUrl, this.discountValue = 0, this.color = 'Black', required this.size});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'color': color,
      'size': size,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AddToCartModel(
      id: documentId,
      productId: map['productId'] as String,
      title: map['title'] as String,
      price: map['price'] as int,
      quantity: map['quantity'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      color: map['color'] as String,
      size: map['size'] as String,
    );
  }
}