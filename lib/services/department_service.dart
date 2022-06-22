import 'package:patrimony_app/entities/department.dart';
import 'package:flutter/material.dart';

class DepartmentService extends ChangeNotifier {
  final List<Department> _departments = [];
  List<Department> get departments => _departments;

  DepartmentService();

  void create(Department newDepartment) {
    _departments.add(newDepartment);

    notifyListeners();
  }

  int _findIndexInList(int id) {
    final int foundIndex =
        _departments.indexWhere(((department) => department.id == id));

    return foundIndex;
  }

  void update(Department updatedDepartment) {
    final int foundIndex = _findIndexInList(updatedDepartment.id);

    _departments[foundIndex] = updatedDepartment;

    notifyListeners();
  }

  void delete(int id) {
    final int foundIndex = _findIndexInList(id);

    _departments.removeAt(foundIndex);
  }
}
