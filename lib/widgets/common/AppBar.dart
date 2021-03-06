import 'package:flutter/material.dart';

class ScootrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final List<Widget>? actions;
  final List<Tab>? tabs;

  @override
  final Size preferredSize;

  ScootrAppBar({
    this.title,
    this.actions,
    this.tabs,
  }): preferredSize = Size.fromHeight(kToolbarHeight + (tabs != null ? 74 : 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "scootr"),
      actions: actions,
      bottom: tabs != null
        ? TabBar(
          tabs: tabs ?? [],
          isScrollable: true,
        )
        : null,
    );
  }
}
