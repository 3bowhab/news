import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/utils/toast_utils.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  const ArticleWebView({super.key});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late WebViewController controller;
  late String? url;
  int loadingPercentage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    url = ModalRoute.of(context)?.settings.arguments as String?;

    if (url != null && url!.isNotEmpty) {
      controller.loadRequest(Uri.parse(url!));
    } else {
      ToastUtils.showErrorToast(AppLocalizations.of(context)!.noURLprovidedforWebView, context);
    }
  }

  @override
  void initState() {
    initializeWebView();
    super.initState();
  }

  void initializeWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => loadingPercentage = 0);
          },
          onProgress: (progress) {
            setState(() => loadingPercentage = progress);
          },
          onPageFinished: (url) {
            setState(() => loadingPercentage = 100);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: webAppBar(context),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100,
              color: AppColors.loading,
              backgroundColor: AppColors.grey,
            ),
        ],
      ),
    );
  }

  AppBar webAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.fullArticle),
      actions: [
        IconButton(
          onPressed: () async {
            if (await controller.canGoBack()) {
              controller.goBack();
            } else {
              if (!context.mounted) return;
              ToastUtils.showWarningToast(AppLocalizations.of(context)!.nopreviouspage, context);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => controller.reload(),
        ),
        IconButton(
          onPressed: () async {
            if (await controller.canGoForward()) {
              controller.goForward();
            } else {
              if (!context.mounted) return;
              ToastUtils.showWarningToast(AppLocalizations.of(context)!.nonextpage, context);
            }
          },
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
