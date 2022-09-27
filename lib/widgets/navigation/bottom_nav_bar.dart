import 'package:flutter/material.dart';
import 'package:kitty/recurses/app_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.currentTab, required this.onSelect})
      : super(key: key);
  final int currentTab;
  final void Function(int) onSelect;

  static const List<_BottomNavigationBarItem> _items = [
    _BottomNavigationBarItem(
      iconPath: AppIcons.report,
      title: 'Report',
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.home,
      title: 'Home',
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.settings,
      title: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(color: Colors.grey[100], boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
          offset: Offset(0.0, 0.0),
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ),
      ]),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 3.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.map((e) {
              final int i = _items.indexOf(e);
              return Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: kBottomNavigationBarHeight,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => onSelect(i),
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 3.0,
                          ),
                          Flexible(
                            flex: 10,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              child: e.iconPath == AppIcons.settings
                                  ? Container(
                                      color: Colors.transparent,
                                      child: Image.asset(
                                        e.iconPath,
                                        fit: BoxFit.fill,
                                        color: i == currentTab
                                            ? Colors.black
                                            : Colors.grey[700],
                                      ),
                                    )
                                  : Container(
                                      color: null,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                          e.iconPath,
                                          fit: BoxFit.fill,
                                          color: i == currentTab
                                              ? Colors.black
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Flexible(
                            flex: 4,
                            child: Text(e.title,
                                style: e.title == 'Запись'
                                    ? TextStyle(
                                        color: i == currentTab
                                            ? Colors.black
                                            : Colors.transparent,
                                        fontSize: 11.0,
                                        height: 1.18,
                                      )
                                    : TextStyle(
                                        color: i == currentTab
                                            ? Colors.black
                                            : Colors.grey[700],
                                        fontSize: 11.0,
                                        height: 1.18,
                                      )),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBarItem {
  const _BottomNavigationBarItem({
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;
}
