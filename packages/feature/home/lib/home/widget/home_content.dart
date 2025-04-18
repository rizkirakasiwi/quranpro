import 'package:design_system/widget/app_image.dart';
import 'package:design_system/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:localization/helper/get_string.dart';

class HomeContent extends StatefulWidget {
  final Widget? surah;
  final Widget? juz;
  final Widget? page;

  const HomeContent({super.key, this.surah, this.juz, this.page});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _icons = [
    'icons/ic_surah.svg',
    'icons/ic_juz.svg',
    'icons/ic_page.svg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // only rebuilds this widget
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getIconColor(int index) {
    return _tabController.index == index
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: List.generate(3, (index) {
            final titles = [
              context.getString()?.surah ?? "Surah",
              context.getString()?.juz ?? "Juz",
              context.getString()?.page ?? "Page",
            ];
            return Tab(
              child: Row(
                children: [
                  AppImage.svg(_icons[index], color: _getIconColor(index)),
                  const SizedBox(width: 8),
                  AppText(titles[index]),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              widget.surah ?? const SizedBox.shrink(),
              widget.juz ?? const SizedBox.shrink(),
              widget.page ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
