import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView>
    with ProductSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            showCustomSheet(context, const ImageLearn202());
          },
          child: const Text('Show')),
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              elevation: 5,
              backgroundColor: Colors.orange,
              barrierColor: Colors.white.withOpacity(0.5),
              //arka renk
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return const _CustomSheet();
              });
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.share_outlined),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  // ignore: unused_field
  Color _backgroundColor = Colors.white;
  final double _gripHeight = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _gripHeight,
              child: Stack(
                children: [
                  Divider(
                    color: Colors.black26,
                    indent: MediaQuery.of(context).size.width * 0.45,
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                    thickness: 3,
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.width * 0.01,
                      top: 0,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close_rounded)))
                ],
              ),
            ),
            const Text('hebele hübele'),
            Image.network('https://picsum.photos/200'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.blue;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget widget) async {
    return showModalBottomSheet<T>(
        elevation: 5,
        backgroundColor: Colors.orange,
        barrierColor: Colors.white.withOpacity(0.5),
        //arka renk

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return _CustomMainSheet(
            child: widget,
          );
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _BaseSheetHeader(), Expanded(child: child)],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 30,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.black26,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
            thickness: 3,
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.01,
              top: 0,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close_rounded)))
        ],
      ),
    );
  }
}
