import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class DenemosView extends StatelessWidget {
  final String _title = 'Create Your First Note';
  final String _description = 'Add to name bla bla bla';
  final _createNote = 'Create A Note';
  final _importNotes = 'Import Notes';
  const DenemosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PadingWithPage.horizanltolPaading,
        child: Column(
          children: [
            PngImage(name: ImageItems().apple),
            TitleWidget(title: _title),
            Padding(
              padding: PadingWithPage.verticalPadding,
              child: SubTitle(description: _description),
            ),
            const Spacer(),
            Padding(
              padding: PadingWithPage.verticalPaddingBottom,
              child: ButtonGroup(
                  createNote: _createNote, importNotes: _importNotes),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({
    Key? key,
    required String createNote,
    required String importNotes,
  })  : _createNote = createNote,
        _importNotes = importNotes,
        super(key: key);

  final String _createNote;
  final String _importNotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {},
            child: SizedBox(
                height: 50,
                child: Center(
                    child: Text(_createNote,
                        style: Theme.of(context).textTheme.headlineSmall)))),
        TextButton(onPressed: () {}, child: Text(_importNotes))
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black45, fontWeight: FontWeight.bold),
    );
  }
}

class SubTitle extends StatelessWidget {
  final TextAlign textAlign;
  const SubTitle({
    Key? key,
    required String description,
    this.textAlign = TextAlign.center,
  })  : _description = description,
        super(key: key);

  final String _description;

  @override
  Widget build(BuildContext context) {
    return Text(_description * 5,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black45,
            ));
  }
}

class PadingWithPage {
  static const EdgeInsets horizanltolPaading =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets verticalPaddingBottom =
      EdgeInsets.symmetric(vertical: 30);
}
