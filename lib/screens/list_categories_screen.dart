import 'package:flutter/material.dart';
import 'package:patrimony_app/entities/category.dart';
import 'package:patrimony_app/screens/manage_category_screen.dart';
import 'package:patrimony_app/services/category_service.dart';
import 'package:provider/provider.dart';

class ListCategoriesScreen extends StatelessWidget {
  const ListCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro Categoria'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ManageCategoryScreen()));
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
          child: Consumer<CategoryService>(builder: (_, categoryService, __) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Categorias cadastradas",
                      style: TextStyle(fontSize: 14)),
                  categoryService.categories.isEmpty
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
                                Text("Nenhuma categoria cadastrada",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    )),
                              ])))
                      : ListView.builder(
                          itemCount: categoryService.categories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final Category category =
                                categoryService.categories[index];
                            // final itemKey = category.id.toString();

                            return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) =>
                                    categoryService.delete(category.id),
                                background: Container(color: Colors.red),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageCategoryScreen(
                                                  category: category,
                                                )));
                                  },
                                  child: Card(
                                      child:
                                          ListTile(title: Text(category.name))),
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
