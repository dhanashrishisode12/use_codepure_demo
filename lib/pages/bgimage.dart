import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/nature.jpg",
      height: 60.0,
      width: 60.0,
      scale: 1.0,
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.6),
      colorBlendMode: BlendMode.darken,
    );
  }
}
