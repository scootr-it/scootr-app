import 'package:flutter/material.dart';
import 'package:scootr/widgets/AppBar.dart';
import 'package:scootr/widgets/Drawer.dart';

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: "Account",
          tabs: [
            Tab(
              icon: Icon(Icons.account_circle),
              text: "Dettagli",
            ),
            Tab(
              icon: Icon(Icons.account_balance_wallet),
              text: "Portafogli",
            ),
            Tab(
              icon: Icon(Icons.bike_scooter),
              text: "Corse",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Text("Dettagli"),
            Text("Portafogli"),
            Text("Corse"),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}