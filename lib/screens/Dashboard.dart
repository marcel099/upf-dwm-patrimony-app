import 'package:flutter/material.dart';
import 'package:patrimony_app/components/DashboardButton.dart';
import 'package:patrimony_app/components/DashboardCard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Patrimônio'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
        ),
        body: Text("Nada"));
  }
}
