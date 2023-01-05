import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final IconsSizes iconsSizes = IconsSizes();
  final IconsColors iconsColors = IconsColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Learn'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
            color: Theme.of(context).colorScheme.error,
            iconSize: IconsSizes.iconSmall2x,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outlined),
            color: iconsColors.ceriseRed,
            iconSize: IconsSizes.iconSmall2x,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.heart_broken),
            color: iconsColors.ceriseRed,
            iconSize: iconsSizes.iconSmall,
          ),
        ],
      ),
    );
  }
}

class IconsSizes {
  final double iconSmall = 20;
  static const double iconSmall2x = 40;
}

class IconsColors {
  final Color ceriseRed = const Color(0xffDE3B60);
}
