import 'package:flutter/material.dart';

class ShowImageDialog {
  ShowImageDialog._();

  static void showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: InteractiveViewer(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
