import 'package:patrimony_app/entities/patrimony.dart';
import 'package:flutter/material.dart';

class PatrimonyService extends ChangeNotifier {
  final List<Patrimony> _patrimonies = [];
  List<Patrimony> get patrimonies => _patrimonies;

  PatrimonyService();

  void create(Patrimony newPatrimony) {
    _patrimonies.add(newPatrimony);

    notifyListeners();
  }

  int _findIndexInList(int id) {
    final int foundIndex =
        _patrimonies.indexWhere(((patrimony) => patrimony.id == id));

    return foundIndex;
  }

  void update(Patrimony updatedPatrimony) {
    final int foundIndex = _findIndexInList(updatedPatrimony.id);

    _patrimonies[foundIndex] = updatedPatrimony;

    notifyListeners();
  }

  void delete(int id) {
    final int foundIndex = _findIndexInList(id);

    _patrimonies.removeAt(foundIndex);
  }
}
