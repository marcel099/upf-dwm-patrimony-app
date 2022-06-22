import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  DashboardCard({
    Key? key,
    required this.singularTitle,
    required this.pluralTitle,
  }) : super(key: key);

  String singularTitle;
  String pluralTitle;

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
            child: const DecoratedBox(
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.pluralTitle, style: TextStyle(fontSize: 18)),
                Text("0", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("${widget.pluralTitle} cadastrados", style: TextStyle(fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
