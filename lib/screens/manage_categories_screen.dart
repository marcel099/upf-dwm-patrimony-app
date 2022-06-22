import 'package:flutter/material.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Categoria'),
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
