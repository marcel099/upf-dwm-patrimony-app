import 'package:flutter/material.dart';
import 'package:patrimony_app/entities/department.dart';
import 'package:patrimony_app/screens/manage_department_screen.dart';
import 'package:patrimony_app/services/department_service.dart';
import 'package:provider/provider.dart';

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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ManageDepartmentScreen()));
              },
              icon: const Icon(Icons.add),
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child:
              Consumer<DepartmentService>(builder: (_, departmentService, __) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Departamentos cadastrados",
                      style: TextStyle(fontSize: 14)),
                  departmentService.departments.isEmpty
                      ? Center(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                              ),
                              child: Column(children: const [
                                Icon(
                                  Icons.face,
                                  size: 200,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                ),
                                Text("Nenhum departamento cadastrado",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    )),
                              ])))
                      : ListView.builder(
                          itemCount: departmentService.departments.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final Department department =
                                departmentService.departments[index];
                            // final itemKey = department.id.toString();

                            return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) =>
                                    departmentService.delete(department.id!),
                                background: Container(color: Colors.red),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageDepartmentScreen(
                                                  department: department,
                                                )));
                                  },
                                  child: Card(
                                      child: ListTile(
                                          title: Text(department.name))),
                                ));
                          },
                        ),
                ]);
          }),
        ),
      ),
    );
  }
}
