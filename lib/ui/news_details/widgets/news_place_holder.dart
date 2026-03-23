import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';

class NewsPlaceholder extends StatelessWidget {
  const NewsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.height,
      width: double.infinity,
      color: Colors.grey.withValues(alpha: 0.2),
      child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
    );
  }
}