import 'package:flutter/material.dart';

class NewsPlaceholder extends StatelessWidget {
  const NewsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.grey,
      child: const Icon(Icons.broken_image),
    );
  }
}