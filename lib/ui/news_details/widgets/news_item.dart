import 'package:flutter/material.dart';
import 'package:news/core/constants/app_images.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 200));
    
    return Container(
      padding: 8.allPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.surface),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              Assets.imagesNewsImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
    
          10.verticalSizedBox,
          Text(
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
    
          10.verticalSizedBox,
          Row(
            children: [
              Text(
                'By : Jon Haworth',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.grey),
              ),
              const Spacer(),
              Text(
                timeago.format(fifteenAgo).toString(),
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
