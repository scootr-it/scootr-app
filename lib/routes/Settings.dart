import 'package:flutter/material.dart';
import 'package:scootr/widgets/settings/AdvancedSettings.dart';
import 'package:scootr/widgets/common/AppBar.dart';
import 'package:scootr/widgets/common/Drawer.dart';

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: "Impostazioni",
          tabs: [
            Tab(
              icon: Icon(Icons.settings),
              text: "Avanzate",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            AdvancedSettings(),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}
