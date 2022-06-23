import 'package:flutter/material.dart';

class ListPatrimoniesScreen extends StatelessWidget {
  const ListPatrimoniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Patrimônio'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
