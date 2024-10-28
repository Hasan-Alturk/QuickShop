class Product {
  final List<String> images;
  final String title;
  final String description;
  final String originalPrice;
  final String? discountedPrice;
  final double rating;

  Product({
    required this.images,
    required this.title,
    required this.description,
    required this.originalPrice,
    this.discountedPrice,
    this.rating = 3.5,
  });
}
