import 'package:flutter/material.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/widgets/common/AppBar.dart';
import 'package:scootr/widgets/common/Drawer.dart';
import 'package:scootr/widgets/wallet/WalletDetails.dart';
import 'package:scootr/widgets/wallet/WalletPaymentMethods.dart';
import 'package:scootr/widgets/wallet/WalletSubscriptions.dart';
import 'package:scootr/widgets/wallet/WalletTransactions.dart';

class WalletRoute extends StatefulWidget {
  final Wallet _wallet;

  WalletRoute(this._wallet);

  @override
  _WalletRouteState createState() => _WalletRouteState(_wallet);
}

class _WalletRouteState extends State<WalletRoute> {
  Wallet _wallet;

  _WalletRouteState(this._wallet);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: _wallet.name,
          actions: [
            IconButton(
              icon: Icon(
                _wallet.isDefault ?? false
                  ? Icons.favorite
                  : Icons.favorite_border,
              ),
              tooltip: _wallet.isDefault ?? false
                ? "Rimuovi predefinito"
                : "Imposta come predefinito",
              onPressed: () {
                // TODO
              },
            ),
          ],
          tabs: [
            Tab(
              icon: Icon(Icons.info_outline),
              text: "Dettagli",
            ),
            Tab(
              icon: Icon(Icons.payment),
              text: "Metodi di pagamento",
            ),
            Tab(
              icon: Icon(Icons.schedule),
              text: "Ricariche periodiche",
            ),
            Tab(
              icon: Icon(Icons.history),
              text: "Storico transazioni",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            WalletDetails(
              _wallet,
              onUpdate: (newWallet) {
                setState(() {
                  _wallet = newWallet;
                });
              },
            ),
            WalletPaymentMethods(_wallet),
            WalletSubscriptions(_wallet),
            WalletTransactions(_wallet),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}
