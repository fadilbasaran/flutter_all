// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            //barrierDismissible:false, //böyle yapıldığı Sadece istenilem butonlar ile çıkabilir
            context: context,
            builder: (context) {
              return const  _ImageZoomDialog();
            },
          );
          //inspect(response);
        },
      ),
    );
  }
}

// ignore: unused_element
class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version Update!!'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update Now')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close')),
      ],
    );
  }
}

class Keys {
  static const String versionUpdate = 'Version Update!!';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Update Now')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close')),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url = 'https://picsum.photos/200';
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
