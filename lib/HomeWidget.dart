import 'package:flutter/material.dart';

import 'TunerWidget.dart';
import 'MetronomeWidget.dart';

class HomeWidget extends StatefulWidget {
  final BuildContext parentCtx;

  HomeWidget({Key key, this.parentCtx});

  @override
  State createState() => _HomeState();

}

class _HomeState extends State<HomeWidget>{
  final pageController = PageController(initialPage: 0);
  int _currentIndex = 0, today;

  @override
  void initState(){
    super.initState();
  }

  List<Widget> _children() => [
    MetronomeWidget(),
    TunerWidget()
  ];

  @override
  Widget build(BuildContext context){
    final List<Widget> children = _children();

    changePage(int index){
      setState(() {
        _currentIndex = index;
      });
    }

    // App Loads
    return Scaffold(
      body: PageView(
          onPageChanged: (index) {
            FocusScope.of(context).unfocus();
            changePage(index);
          },
          controller: pageController,
          children: children
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.av_timer_rounded),
            label: 'Metronome',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.tune_rounded),
            label: 'Tuner',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(
          index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}

