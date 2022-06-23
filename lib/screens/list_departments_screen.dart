import 'package:flutter/material.dart';

class ListDepartmentsScreen extends StatelessWidget {
  const ListDepartmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Departamento'),
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
