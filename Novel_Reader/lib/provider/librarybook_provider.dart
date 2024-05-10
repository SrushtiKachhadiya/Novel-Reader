import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryBookProvider extends ChangeNotifier {
  // int? _selectedBookIndex; // Nullable to represent no selection initially
  //
  // int? get selectedBookIndex => _selectedBookIndex;
  //
  // Future<void> loadSelectedBook() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _selectedBookIndex = prefs.getInt('selected_book_index');
  //   notifyListeners();
  // }
  //
  // Future<void> selectBook(int index) async {
  //   _selectedBookIndex = index;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('selected_book_index', index);
  //   notifyListeners();
  // }
  //
  // Future<void> clearSelectedBook() async {
  //   _selectedBookIndex = null;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('selected_book_index');
  //   notifyListeners();
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
