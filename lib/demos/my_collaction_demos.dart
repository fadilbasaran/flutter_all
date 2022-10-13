import 'package:flutter/material.dart';

class MyCollactionDemos extends StatefulWidget {
  const MyCollactionDemos({Key? key}) : super(key: key);

  @override
  State<MyCollactionDemos> createState() => _MyCollactionDemosState();
}

class _MyCollactionDemosState extends State<MyCollactionDemos> {
  late final List<CollactionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollactionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _CategoryCard(
            model: _items[index],
            index: index,
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollactionModel model,
    required this.index,
  })  : _model = model,
        super(key: key);

  final CollactionModel _model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddigBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            ClipRRect(
              //image for rounded used

              borderRadius: BorderRadiusUtulity().radiusGeneral,
              child: Image.asset(
                _model.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: PaddingUtility().paddigTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${_model.title} ${index + 1}'),
                  Text('${_model.price} eth'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollactionModel {
  final String imagePath;
  final String title;
  final double price;

  CollactionModel(
      {required this.imagePath, required this.title, required this.price});
}

class PaddingUtility {
  final paddigTop = const EdgeInsets.only(top: 8.0);
  final paddigBottom = const EdgeInsets.only(bottom: 30);
  final paddingGeneral = const EdgeInsets.all(20.0);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 40);
}

class BorderRadiusUtulity {
  final radiusGeneral = BorderRadius.circular(20);
}

class CollactionItems {
  late final List<CollactionModel> items;
  CollactionItems() {
    items = [
      CollactionModel(
          imagePath: ProjectItems.imageCollaction,
          title: ProjectItems.title,
          price: ProjectItems.price),
      CollactionModel(
          imagePath: ProjectItems.imageCollaction,
          title: ProjectItems.title,
          price: ProjectItems.price),
      CollactionModel(
          imagePath: ProjectItems.imageCollaction,
          title: ProjectItems.title,
          price: ProjectItems.price),
      CollactionModel(
          imagePath: ProjectItems.imageCollaction,
          title: ProjectItems.title,
          price: ProjectItems.price),
    ];
  }
}

class ProjectItems {
  static const String imageCollaction = 'assets/images/dogIsFreak.jpg';
  static const String title = 'Abstract Art';
  static const double price = 3.4;
}
