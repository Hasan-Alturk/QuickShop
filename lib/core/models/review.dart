class Review {
  final String userName;
  final String date;
  final String reviewText;
  final double rating;
  final List<String> imageUrls;

  Review({
    required this.userName,
    required this.date,
    required this.reviewText,
    required this.rating,
    required this.imageUrls,
  });
}
