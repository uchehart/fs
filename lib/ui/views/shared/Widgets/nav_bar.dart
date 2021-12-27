
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem {
  final IconData img;
  final String iconText;
  NavBarItem({
    required this.img,
    required this.iconText,
  });
}

class NavBar extends StatefulWidget {
  final List<NavBarItem> items;
  final double height;
  final double iconSize;

  final int currentIndex;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final double fontSize;
  final ValueChanged<int> onTabSelected;
  @override
  NavBar({
    required this.items,
    this.height: 70.0,
    this.iconSize: 20.0,
    this.fontSize = 14.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
    this.currentIndex = 0,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  State<StatefulWidget> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  late int _selectedIndex;

  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  _updateIndex(int index) {
    widget.onTabSelected(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required NavBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.img,
                  color: color,
                  size: widget.iconSize,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.iconText,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontSize: widget.fontSize,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
