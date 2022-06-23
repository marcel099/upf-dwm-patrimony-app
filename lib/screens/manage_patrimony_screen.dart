import 'package:flutter/material.dart';
import 'package:patrimony_app/components/input_form.dart';
import 'package:patrimony_app/entities/patrimony.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';

class ManagePatrimonyScreen extends StatefulWidget {
  Patrimony patrimony;

  ManagePatrimonyScreen({Key? key, this.patrimony = const Patrimony()})
      : super(key: key);

  @override
  State<ManagePatrimonyScreen> createState() => _ManagePatrimonyScreenState();
}

class _ManagePatrimonyScreenState extends State<ManagePatrimonyScreen> {
  late TextEditingController nameController =
      TextEditingController(text: widget.patrimony.name);
  late TextEditingController priceController = TextEditingController(
      text:
          widget.patrimony.price == 0 ? "" : widget.patrimony.price.toString());
  late TextEditingController descriptionController =
      TextEditingController(text: widget.patrimony.description);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PatrimonyService>(builder: (_, patrimonyService, __) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
                "${widget.patrimony.name == '' ? 'Cadastro' : 'Edição'} Patrimônio"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();

                    Patrimony newPatrimony = Patrimony(
                        name: nameController.value.text,
                        price: double.parse(priceController.value.text),
                        description: descriptionController.value.text);

                    if (widget.patrimony.name == '') {
                      patrimonyService.create(newPatrimony);
                    } else {
                      patrimonyService.update(newPatrimony);
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
