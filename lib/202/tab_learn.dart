import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/demos/my_collaction_demos.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchValue,
          child: _myTab(context),
        ),
        body: _tabBarView(),
      ),
    );
  }

  TabBar _myTab(BuildContext context) {
    return TabBar(
      splashBorderRadius: BorderRadius.circular(10),
      indicatorColor: Colors.red,
      onTap: (value) {},
      padding: const EdgeInsets.all(20),

      //indicatorPadding: const EdgeInsets.only(bottom: 20),
      labelStyle: Theme.of(context).textTheme.subtitle2,
      // indicatorSize: TabBarIndicatorSize.label,//Alt çizginin neye göre şekil alacağı
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
      controller: _tabController,
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const MyCollactionDemos(),
        IconLearnView(),
        const MyCollactionDemos(),
        IconLearnView(),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }
