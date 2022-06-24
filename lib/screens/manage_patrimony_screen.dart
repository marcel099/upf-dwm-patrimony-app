import 'package:flutter/material.dart';
import 'package:patrimony_app/components/input_form.dart';
import 'package:patrimony_app/entities/patrimony.dart';
// import 'package:patrimony_app/services/department_service.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';
// import 'package:select_form_field/select_form_field.dart';
// import 'package:uuid/uuid.dart';

class ManagePatrimonyScreen extends StatefulWidget {
  Patrimony? _patrimony;
  bool isCreating = true;

  ManagePatrimonyScreen({Key? key, Patrimony? patrimony}) : super(key: key) {
    if (patrimony != null) {
      isCreating = false;
    }

    _patrimony = patrimony ?? Patrimony();
  }

  @override
  State<ManagePatrimonyScreen> createState() => _ManagePatrimonyScreenState();
}

class _ManagePatrimonyScreenState extends State<ManagePatrimonyScreen> {
  late TextEditingController nameController =
      TextEditingController(text: widget._patrimony?.name);
  late TextEditingController priceController = TextEditingController(
      text: widget.isCreating ? "" : widget._patrimony?.price.toString());
  late TextEditingController descriptionController =
      TextEditingController(text: widget._patrimony?.description);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // dynamic _departmentId = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<PatrimonyService>(builder: (_, patrimonyService, __) {
      return Scaffold(
        appBar: AppBar(
            title:
                Text("${widget.isCreating ? 'Cadastro' : 'Edição'} Patrimônio"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();

                    widget._patrimony?.name = nameController.value.text;
                    widget._patrimony?.price =
                        double.parse(priceController.value.text);
                    widget._patrimony?.description =
                        descriptionController.value.text;

                    if (widget.isCreating) {
                      patrimonyService.create(widget._patrimony!);
                    } else {
                      patrimonyService.update(widget._patrimony!);
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
                        hintText: 'Informe o nome do patrimônio',
                        autofocus: true,
                        validator: (value) {
                          if (value == "") {
                            return "Informe um nome";
                          }
                          return null;
                        },
                        onSaved: (value) => value,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Consumer<DepartmentService>(
                      //     builder: (_, departmentService, __) {
                      //   return Row(
                      //     children: [
                      //       Expanded(
                      //         child: SelectFormField(
                      //           type: SelectFormFieldType.dropdown,
                      //           labelText: 'Selecione o departamento',
                      //           initialValue: widget.patrimony.name != ''
                      //               ? widget.patrimony.departmentId.toString()
                      //               : null,
                      //           items: departmentService.departments
                      //               .map((department) => {
                      //                     'value': department.id.toString(),
                      //                     'label': department.name.toString()
                      //                   })
                      //               .toList(),
                      //           validator: (value) {
                      //             // if (value!.isEmpty) {
                      //             //   return 'Informe o departamento';
                      //             // }
                      //             return null;
                      //           },
                      //           onSaved: (value) => _departmentId = value!,
                      //         ),
                      //       )
                      //     ],
                      //   );
                      // }),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      InputFormApp(
                        controller: priceController,
                        labelText: 'Preço',
                        hintText: 'Informe o preço do patrimônio',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == "") {
                            return "Informe um preço";
                          }

                          if (double.tryParse(value!) == null) {
                            return "O preço deve ser um número";
                          }

                          return null;
                        },
                        onSaved: (value) => double.parse(value!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputFormApp(
                        controller: descriptionController,
                        labelText: 'Descrição',
                        hintText: 'Informe a descrição do patrimônio',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == "") {
                            return "Informe uma descrição";
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
