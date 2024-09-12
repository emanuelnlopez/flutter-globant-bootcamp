import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  ImageSection({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) => Image.asset(
        image,
        width: double.infinity,
        fit: BoxFit.cover,
      );
}
