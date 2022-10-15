import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchUrl('https://pub.dev/packages/url_launcher');
          },
        ),
        body: const LoadingBar(
          size: 100,
        ));
  }
}

void _launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}
