import 'package:flutter/material.dart';
import 'package:news/core/constants/app_routes.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/l10n/app_localizations.dart';

class ViewAllButton extends StatelessWidget {
  final bool isRight;
  const ViewAllButton({super.key, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.newsDetailsView);
      },
      child: Container(
        height: 54.height,
        width: 150.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(84),
        ),
        child: Row(
          mainAxisAlignment: isRight
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: isRight
              ? [text(context), 12.horizontalSizedBox, arrowContainer(context)]
              : [arrowContainer(context), 12.horizontalSizedBox, text(context)],
        ),
      ),
    );
  }

  Text text(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.viewAll,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.surface,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container arrowContainer(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 54.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isRight ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
