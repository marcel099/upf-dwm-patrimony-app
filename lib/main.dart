import 'package:flutter/material.dart';
import 'package:patrimony_app/screens/dashboard_screen.dart';
import 'package:patrimony_app/services/department_service.dart';
import 'package:patrimony_app/services/patrimony_service.dart';
import 'package:provider/provider.dart';
import 'package:patrimony_app/services/category_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CategoryService(),
      ),
      ChangeNotifierProvider(
        create: (_) => DepartmentService(),
      ),
      ChangeNotifierProvider(
        create: (_) => PatrimonyService(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Patrimônios',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
