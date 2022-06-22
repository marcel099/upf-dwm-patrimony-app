import 'package:flutter/material.dart';

class ManageDepartmentsScreen extends StatelessWidget {
  const ManageDepartmentsScreen({Key? key}) : super(key: key);

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
