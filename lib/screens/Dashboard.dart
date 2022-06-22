import 'package:flutter/material.dart';
import 'package:patrimony_app/components/DashboardButton.dart';
import 'package:patrimony_app/components/DashboardCard.dart';
import 'package:patrimony_app/services/category_service.dart';
import 'package:patrimony_app/services/department_service.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';

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
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 30,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Dashboard", style: TextStyle(fontSize: 22)),
              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
              ),
              Consumer<DepartmentService>(builder: (_, departmentService, __) {
                return DashboardCard(
                  singularTitle: "departamento",
                  pluralTitle: 'departamentos',
                  amount: departmentService.departments.length,
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Consumer<CategoryService>(builder: (_, categoryService, __) {
                return DashboardCard(
                  singularTitle: "categoria",
                  pluralTitle: 'categorias',
                  amount: categoryService.categories.length,
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Consumer<PatrimonyService>(builder: (_, patrimonyService, __) {
                return DashboardCard(
                  singularTitle: "patrimônio",
                  pluralTitle: 'patrimônios',
                  amount: patrimonyService.patrimonies.length,
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Text("Cadastros", style: TextStyle(fontSize: 22)),
              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
              ),
              DashboardButton(
                title: "Departamento",
                onPressedFunc: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              DashboardButton(
                title: "Categoria",
                onPressedFunc: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              DashboardButton(
                title: "Patrimônio",
                onPressedFunc: () {},
              ),
            ])),
      ),
    );
  }
}
