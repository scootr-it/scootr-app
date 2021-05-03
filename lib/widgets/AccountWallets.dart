import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/services/Auth.dart';

enum WalletButton
{
  SET_DEFAULT,
  DELETE,
}

class AccountWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<AuthService>(context).session!.user;

    return FutureBuilder<ApiResponse<List<Wallet>>>(
      future: ApiService.listWalletsForUser(user),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Wallet> wallets = snapshot.data!.data!;

        return ListView.builder(
          itemCount: wallets.length,
          itemBuilder: (context, index) {
            final Wallet wallet = wallets[index];

            return ListTile(
              title: Text(wallet.name),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<WalletButton>(
                      value: WalletButton.SET_DEFAULT,
                      child: Text("Imposta come predefinito"),
                    ),
                    const PopupMenuItem<WalletButton>(
                      value: WalletButton.DELETE,
                      child: Text(
                        "Elimina",
                        style: TextStyle(
                          color: Config.DANGER_COLOR,
                        ),
                      ),
                    ),
                  ];
                },
              ),
              onTap: () {
                // TODO
              },
            );
          },
        );
      }
    );
  }
}
