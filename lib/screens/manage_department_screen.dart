import 'package:flutter/material.dart';
import 'package:patrimony_app/components/input_form.dart';
import 'package:patrimony_app/entities/department.dart';
import 'package:patrimony_app/services/department_service.dart';
import 'package:provider/provider.dart';

class ManageDepartmentScreen extends StatefulWidget {
  Department? _department;
  bool isCreating = true;

  ManageDepartmentScreen({Key? key, Department? department}) : super(key: key) {
    if (department != null) {
      isCreating = false;
    }

    _department = department ?? Department();
  }

  @override
  State<ManageDepartmentScreen> createState() => _ManageDepartmentScreenState();
}

class _ManageDepartmentScreenState extends State<ManageDepartmentScreen> {
  late TextEditingController nameController =
      TextEditingController(text: widget._department?.name);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<DepartmentService>(builder: (_, departmentService, __) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
                "${widget.isCreating ? 'Cadastro' : 'Edição'} Departamento"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();

                    widget._department?.name = nameController.value.text;

                    if (widget.isCreating) {
                      departmentService.create(widget._department!);
                    } else {
                      departmentService.update(widget._department!);
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
                        hintText: 'Informe o nome do departamento',
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
