import 'package:flutter/material.dart';
import '../model/food_model.dart';

class FoodViewModel extends ChangeNotifier {
  List<Food> _foodList = [
  ];

  List<Food> get filteredFoodList => _filteredFoodList;
  List<Food> _filteredFoodList = [];

  void searchFood(String query) {
    _filteredFoodList = _foodList.where((food) {
      return food.name.toLowerCase().contains(query.toLowerCase()) ||
          food.category.toLowerCase().contains(query.toLowerCase()) ||
          food.businessName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    notifyListeners();
  }
}