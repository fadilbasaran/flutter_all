import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({Key? key, required this.initialColor})
      : super(key: key);
  final Color? initialColor;
  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroudColor;
  final Map<String, Color> _colors = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green
  };
  void _changeBackgroundColor(Color? color) {
    setState(() {
      _backgroudColor = color!;
    });
  }

  @override
  void initState() {
    super.initState();
    _backgroudColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialColor != _backgroudColor) {
      _changeBackgroundColor(widget.initialColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroudColor,
      appBar: AppBar(
        title: const Text('Color Demos View'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: [
          BottomNavigationBarItem(
              icon: _ColorContainer(
                color: _colors['red'],
              ),
              label: 'Red'),
          BottomNavigationBarItem(
              icon: _ColorContainer(
                color: _colors['blue'],
              ),
              label: 'Blue'),
          BottomNavigationBarItem(
              icon: _ColorContainer(color: _colors['green']), label: 'Green'),
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColor.red.index) {
      _changeBackgroundColor(_colors['red']);
    } else if (value == _MyColor.blue.index) {
      _changeBackgroundColor(_colors['blue']);
    } else if (value == _MyColor.green.index) {
      _changeBackgroundColor(_colors['green']);
    }
  }
}

enum _MyColor { red, blue, green }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
