import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Auth.dart';

class AccountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Session session = Provider.of<AuthService>(context).session!;

    return ListView(
      children: [
        ListTile(
          title: Text("Nome"),
          subtitle: Text(session.user.firstName),
        ),
        ListTile(
          title: Text("Cognome"),
          subtitle: Text(session.user.lastName),
        ),
        ListTile(
          title: Text("Email"),
          subtitle: Text(session.user.email),
        ),
        ListTile(
          title: Text("Data di nascita"),
          subtitle: Text(DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(session.user.birthDate)),
        ),
        ListTile(
          title: Text("Codice Fiscale"),
          subtitle: Text(session.user.fiscalNumber),
        ),
      ],
    );
  }
}