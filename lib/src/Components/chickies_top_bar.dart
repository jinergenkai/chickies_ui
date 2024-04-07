import 'package:chickies_ui/src/Colors.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Button',
  type: ChickiesTopBar,
)
ChickiesTopBar chickiesTopBarUseCase(BuildContext context) {
  return ChickiesTopBar(
    tabs: [
      Container(color: ChickiesColor.red),
      Container(color: ChickiesColor.green),
      // Container(color: ChickiesColor.blue),
    ],
    titles: ['Tab 1', 'Tab 2'],
    title: 'Title',
  );
}

class ChickiesTopBar extends StatefulWidget {
  const ChickiesTopBar({
    super.key,
    required this.tabs,
    required this.titles,
    required this.title,
    this.icons,
    this.titleStyle,
  });

  final List<Widget> tabs;
  final List<String> titles;
  final List<Icon?>? icons;
  final String title;
  final TextStyle? titleStyle;

  @override
  State<ChickiesTopBar> createState() => _ChickiesTopBarState();
}

class _ChickiesTopBarState extends State<ChickiesTopBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int length;

  @override
  void initState() {
    if (widget.titles.length != widget.tabs.length) throw Exception('Titles and Tabs must have the same length');
    length = widget.titles.length;
    _tabController = TabController(length: length, vsync: this);
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
        appBar: AppBar(
          backgroundColor: ChickiesColor.white,
          elevation: 0,
          toolbarHeight: 50,
          title: Text(
            widget.title,
            style: widget.titleStyle ?? TextStyle(
              color: ChickiesColor.grey2,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 95 / 100,
              decoration: BoxDecoration(
                color: ChickiesColor.grey,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TabBar(
                dividerColor: ChickiesColor.transparent,
                controller: _tabController,
                padding: EdgeInsets.all(3),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: ChickiesColor.primary,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ChickiesColor.white,
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
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.tabs.map((e) => e).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
