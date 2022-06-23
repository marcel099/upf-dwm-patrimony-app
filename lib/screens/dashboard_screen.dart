import 'package:flutter/material.dart';
import 'package:patrimony_app/components/dashboard_button.dart';
import 'package:patrimony_app/components/dashboard_card.dart';
import 'package:patrimony_app/screens/list_categories_screen.dart';
import 'package:patrimony_app/screens/list_departments_screen.dart';
import 'package:patrimony_app/screens/list_patrimonies_screen.dart';
import 'package:patrimony_app/services/category_service.dart';
import 'package:patrimony_app/services/department_service.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
              const Text("Dashboard", style: TextStyle(fontSize: 22)),
              const Divider(
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
              const Text("Cadastros", style: TextStyle(fontSize: 22)),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
              ),
              DashboardButton(
                title: "Departamento",
                onPressedFunc: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListDepartmentsScreen()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DashboardButton(
                title: "Categoria",
                onPressedFunc: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ListCategoriesScreen()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DashboardButton(
                title: "Patrimônio",
                onPressedFunc: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPatrimoniesScreen()));
                },
              ),
            ])),
      ),
    );
  }
}
