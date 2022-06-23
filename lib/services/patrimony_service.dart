import 'package:patrimony_app/entities/patrimony.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PatrimonyService extends ChangeNotifier {
  final List<Patrimony> _patrimonies = [];
  List<Patrimony> get patrimonies => _patrimonies;

  PatrimonyService();

  void create(Patrimony newPatrimony) {
    _patrimonies.add(newPatrimony);

    notifyListeners();
  }

  int _findIndexInList(Uuid id) {
    final int foundIndex =
        _patrimonies.indexWhere(((patrimony) => patrimony.id == id));

    return foundIndex;
  }

  void update(Patrimony updatedPatrimony) {
    final int foundIndex = _findIndexInList(updatedPatrimony.id);

    _patrimonies[foundIndex] = updatedPatrimony;

    notifyListeners();
  }

  void delete(Uuid id) {
    final int foundIndex = _findIndexInList(id);

    _patrimonies.removeAt(foundIndex);
  }
}
