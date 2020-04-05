import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int index;
  final int activeIndex;
  final String text;
  final IconData icon;

  const CustomTab({
    Key key,
    @required this.index,
    @required this.activeIndex,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: (width - 120) / 4,
      child: Tab(
        child: activeIndex == index ? Text(text) : null,
        icon: activeIndex == index ? null : Icon(icon),
      ),
    );
  }
}
