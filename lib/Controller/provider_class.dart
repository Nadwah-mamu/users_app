import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier{
  int selectedIndex=0;
  void indexChange(int index){
    selectedIndex=index;
    notifyListeners();
  }
}