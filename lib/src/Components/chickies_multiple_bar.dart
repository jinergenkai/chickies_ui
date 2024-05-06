import 'package:chickies_ui/src/Colors.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ChickiesMultipleBar extends StatefulWidget {
  const ChickiesMultipleBar({
    super.key,
    required this.tabs,
    required this.titles,
    required this.title,
    this.icons,
    this.titleStyle,
    this.floatingActionButton,
    this.leading,
    this.actionWhenChangeTab,
    this.actions,
  });

  final List<Widget> tabs;
  final List<String> titles;
  final List<Icon?>? icons;
  final String title;
  final TextStyle? titleStyle;
  final Widget? floatingActionButton;
  final Widget? leading;
  final Function(int)? actionWhenChangeTab;
  final List<Widget>? actions;

  @override
  State<ChickiesMultipleBar> createState() => _ChickiesTopBarState();
}

class _ChickiesTopBarState extends State<ChickiesMultipleBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int length;

  @override
  void initState() {
    if (widget.titles.length != widget.tabs.length) throw Exception('Titles and Tabs must have the same length');
    length = widget.titles.length;
    _tabController = TabController(length: length, vsync: this);
    _tabController.addListener(() {
      if (widget.actionWhenChangeTab != null) widget.actionWhenChangeTab!(_tabController.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: length,
      child: Scaffold(
        backgroundColor: ChickiesColor.white,
        appBar: AppBar(
          leading: widget.leading,
          backgroundColor: ChickiesColor.white,
          elevation: 0,
          toolbarHeight: 50,
          title: Text(
            widget.title,
            style: widget.titleStyle ??
                TextStyle(
                  color: ChickiesColor.grey2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
          actions: widget.actions,
        ),
        body: Column(
          children: [
            TabBar(
              dividerColor: ChickiesColor.transparent,
              controller: _tabController,
              isScrollable: true,
              indicatorColor: ChickiesColor.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ChickiesColor.primary,
              unselectedLabelColor: ChickiesColor.grey2,
              tabs: widget.titles
                  .asMap()
                  .map((index, title) => MapEntry(
                        index,
                        Tab(
                          // text: title,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [widget.icons?[index] ?? SizedBox(width: 0), SizedBox(width: 2), Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))],
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            ),
            SizedBox(height: 1),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.tabs.map((e) => e).toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: widget.floatingActionButton,
      ),
    );
  }
}
