import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 0 : 1);
        },
      ),
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      body: Column(
        children: [
          ListTile(
              title: AnimatedOpacity(
                opacity: _isOpacity ? 1 : 0,
                duration: _DurationItems.durationLow,
                child: const Text('Data'),
              ),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.vertical_split))),
          AnimatedDefaultTextStyle(
            style: _isVisible
                ? context.textTheme().headline1 ?? const TextStyle()
                : context.textTheme().subtitle1 ?? const TextStyle(),
            duration: _DurationItems.durationLow,
            child: const Text('Data'),
          ),
          AnimatedIcon(icon: AnimatedIcons.home_menu, progress: controller),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        duration: _DurationItems.durationLow,
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond);
  }
}

extension BuildContextExtantion on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
