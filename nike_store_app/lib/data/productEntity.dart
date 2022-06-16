class ProductSort {
  static const int latest = 0;
  static const int popular = 1;
  static const int highToLow = 2;
  static const int lowToHigh = 3;
}

class ProductEntity {
  final int id;
  final String title;
  final int price;
  final int discount;
  final String imageUrl;
  final int previousPrice;

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        discount = json['discount'],
        imageUrl = json['image'],
        previousPrice = json['previous_price'] ?? json['price'];
}
