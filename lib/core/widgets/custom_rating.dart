import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.isReadOnly,
    required this.itemSize,
  });
  final bool isReadOnly;
  final double itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize,
      initialRating: 3.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: isReadOnly,
      itemBuilder: (context, _) => const Icon(
        Icons.star_outlined,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
