import 'package:flutter/material.dart';

class MobileProject extends StatelessWidget {
  final VoidCallback ontab;
  final String image;

  const MobileProject({
    super.key,
    required this.ontab,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontab,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
