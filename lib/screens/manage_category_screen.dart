import 'package:flutter/material.dart';
import 'package:patrimony_app/components/input_form.dart';
import 'package:patrimony_app/entities/category.dart';
import 'package:patrimony_app/services/category_service.dart';
import 'package:provider/provider.dart';

class ManageCategoryScreen extends StatefulWidget {
  Category? _category;
  bool isCreating = true;

  ManageCategoryScreen({Key? key, Category? category}) : super(key: key) {
    if (category != null) {
      isCreating = false;
    }

    _category = category ?? Category();
  }

  @override
  State<ManageCategoryScreen> createState() => _ManageCategoryScreenState();
}

class _ManageCategoryScreenState extends State<ManageCategoryScreen> {
  late TextEditingController nameController =
      TextEditingController(text: widget._category?.name);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryService>(builder: (_, categoryService, __) {
      return Scaffold(
        appBar: AppBar(
            title:
                Text("${widget.isCreating ? 'Cadastro' : 'Edição'} Categoria"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();

                    widget._category?.name = nameController.value.text;

                    if (widget.isCreating) {
                      categoryService.create(widget._category!);
                    } else {
                      categoryService.update(widget._category!);
                    }

                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(Icons.check_circle),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.cancel),
              ),
            ]),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      InputFormApp(
                        controller: nameController,
                        labelText: 'Nome',
                        hintText: 'Informe o nome da categoria',
                        autofocus: true,
                        validator: (value) {
                          if (value == "") {
                            return "Informe um nome";
                          }
                          return null;
                        },
                        onSaved: (value) => value,
                      ),
                    ],
                  ))),
        ),
      );
    });
  }
}
