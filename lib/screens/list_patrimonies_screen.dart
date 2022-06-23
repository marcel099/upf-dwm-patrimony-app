import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patrimony_app/entities/patrimony.dart';
import 'package:patrimony_app/screens/manage_patrimony_screen.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';

class ListPatrimoniesScreen extends StatelessWidget {
  ListPatrimoniesScreen({Key? key}) : super(key: key);

  final formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro Patrimônio'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ManagePatrimonyScreen()));
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
          child: Consumer<PatrimonyService>(builder: (_, patrimonyService, __) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Patrimônios cadastrados",
                      style: TextStyle(fontSize: 14)),
                  patrimonyService.patrimonies.isEmpty
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
                                Text("Nenhum patrimônio cadastrado",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    )),
                              ])))
                      : ListView.builder(
                          itemCount: patrimonyService.patrimonies.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final Patrimony patrimony =
                                patrimonyService.patrimonies[index];
                            // final itemKey = patrimony.id.toString();

                            return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) =>
                                    patrimonyService.delete(patrimony.id),
                                background: Container(color: Colors.red),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManagePatrimonyScreen(
                                                  patrimony: patrimony,
                                                )));
                                  },
                                  child: Card(
                                      child: ListTile(
                                    title: Text(patrimony.name),
                                    subtitle: Text(patrimony.description,
                                        maxLines: 2),
                                    trailing: Text(
                                        "Preço: ${formatCurrency.format(patrimony.price)}"),
                                    isThreeLine: true,
                                  )),
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
