import 'package:flutter/material.dart';

class FavoriteBookProvider extends ChangeNotifier {
  List<int> _selectedBook = [];
  List get selectedBook => _selectedBook;

  void addBook( value){
    _selectedBook.add(value);
    notifyListeners();
  }

  void removeBook( value){
    _selectedBook.remove(value);
    notifyListeners();
  }
}
