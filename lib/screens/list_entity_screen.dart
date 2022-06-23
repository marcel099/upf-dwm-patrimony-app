import 'package:flutter/material.dart';

class ListEntityScreen extends StatelessWidget {
  String title;
  Widget listItemWidget;
  int entityListDataLength;
  Widget manageEntityScreen;
  Widget Function(BuildContext, int) entityItemBuilder;

  ListEntityScreen(
      {Key? key,
      required this.title,
      required this.listItemWidget,
      required this.entityListDataLength,
      required this.manageEntityScreen,
      required this.entityItemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro ${title}"),
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
            Text("${title}s cadastrados", style: TextStyle(fontSize: 14)),
            ListView.builder(
              itemCount: entityListDataLength,
              shrinkWrap: true,
              itemBuilder: entityItemBuilder,
            ),
          ]),
        ),
      ),
    );
  }
}
