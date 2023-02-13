import 'package:flutter/material.dart';

class BiteTabBar extends StatefulWidget {
  List<BiteTab> posTabs;
  ValueChanged<int>? onChanged;
  BiteTabBar({Key? key, required this.posTabs, this.onChanged})
      : super(key: key);

  @override
  State<BiteTabBar> createState() => _BiteTabBarState();
}

class _BiteTabBarState extends State<BiteTabBar> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeBloc = Theme.of(context).brightness;
    return Container(
      //width: getWidth(context) * 0.4,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: themeBloc == Brightness.dark
              ? const Color(0xff343434)
              : const Color(0xffF4F5F5),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: themeBloc == Brightness.dark
                    ? Colors.white10
                    : Colors.black12,
                offset: const Offset(0, 0.5),
                spreadRadius: 0.7)
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            widget.posTabs.length,
            (index) => InkWell(
                onTap: () {
                  if (activeIndex != index) {
                    activeIndex = index;
                    if (widget.onChanged != null) {
                      widget.onChanged!(activeIndex);
                    }
                    setState(() {});
                  }
                },
                child: BiteTabContainer(
                    posTab: widget.posTabs[index]
                      ..activeIndex = activeIndex
                      ..index = index))),
      ),
    );
  }
}

class BiteTab extends StatefulWidget {
  String title;
  int? activeIndex;
  int? index;
  BiteTab({Key? key, required this.title, this.activeIndex, this.index})
      : super(key: key);

  @override
  State<BiteTab> createState() => _BiteTabState();
}

class _BiteTabState extends State<BiteTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        widget.title,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class BiteTabContainer extends StatefulWidget {
  BiteTab posTab;
  BiteTabContainer({super.key, required this.posTab});

  @override
  State<BiteTabContainer> createState() => _BiteTabContainerState();
}

class _BiteTabContainerState extends State<BiteTabContainer> {
  @override
  Widget build(BuildContext context) {
    final themeBloc = Theme.of(context).brightness;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.ease,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          //border: const Border(left: BorderSide(color: Colors.white, width: 1)),
          color: widget.posTab.activeIndex == widget.posTab.index
              ? (themeBloc == Brightness.dark ? Colors.white24 : Colors.white)
              : null,
          border: widget.posTab.activeIndex == widget.posTab.index
              ? Border.all(width: 0.5, color: Colors.grey)
              : null,
          borderRadius: BorderRadius.circular(4)),
      height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.posTab.index != 0 &&
                widget.posTab.activeIndex != widget.posTab.index &&
                widget.posTab.activeIndex != (widget.posTab.index! - 1),
            child: VerticalDivider(
              color: themeBloc == Brightness.dark
                  ? const Color(0xff434343)
                  : const Color(0xffDCDDDD),
              width: 0,
              indent: 3,
              thickness: 1.2,
              endIndent: 3,
            ),
          ),
          widget.posTab,
        ],
      ),
    );
  }
}
