import 'package:flutter/material.dart';
import '../model/food_model.dart';

enum ViewType { list, grid }

class FoodViewModel extends ChangeNotifier {

  List<Food> foodItems = [
    // Burgers
    Food(name: "Classic Cheeseburger", category: "Burger", businessName: "Burger Palace", foodType: "Non-Veg", ratings: "4.5", thumNailAssetPath: "assets/images/burger1.jpg"),
    Food(name: "Veggie Burger", category: "Burger", businessName: "Green Bites", foodType: "Veg", ratings: "4.2", thumNailAssetPath: "assets/images/burger1.jpg"),
    Food(name: "Spicy Bean Burger", category: "Burger", businessName: "Spicy Bites", foodType: "Veg", ratings: "4.1", thumNailAssetPath: "assets/images/burger1.jpg"),

    // Juices
    Food(name: "Fresh Orange Juice", category: "Juice", businessName: "Juice Bar", foodType: "Veg", ratings: "4.8", thumNailAssetPath: "assets/images/juice.jpg"),
    Food(name: "Mixed Berry Smoothie", category: "Juice", businessName: "Smoothie Spot", foodType: "Veg", ratings: "4.6", thumNailAssetPath: "assets/images/juice.jpg"),
    Food(name: "Green Detox Juice", category: "Juice", businessName: "Health Haven", foodType: "Veg", ratings: "4.9", thumNailAssetPath: "assets/images/juice.jpg"),

    // Pizzas
    Food(name: "Pepperoni Pizza", category: "Pizza", businessName: "Pizzeria Italia", foodType: "Non-Veg", ratings: "4.7", thumNailAssetPath: "assets/images/pizza.jpg"),
    Food(name: "Margherita Pizza", category: "Pizza", businessName: "Pizza Corner", foodType: "Veg", ratings: "4.4", thumNailAssetPath: "assets/images/pizza.jpg"),
    Food(name: "BBQ Chicken Pizza", category: "Pizza", businessName: "Pizza Express", foodType: "Non-Veg", ratings: "4.6", thumNailAssetPath: "assets/images/pizza.jpg"),

    // Sandwiches
    Food(name: "Grilled Chicken Sandwich", category: "Sandwich", businessName: "Sandwich Hub", foodType: "Non-Veg", ratings: "4.3", thumNailAssetPath: "assets/images/sandwich.jpg"),
    Food(name: "Caprese Sandwich", category: "Sandwich", businessName: "Deli Fresh", foodType: "Veg", ratings: "4.5", thumNailAssetPath: "assets/images/sandwich.jpg"),
    Food(name: "Turkey Club Sandwich", category: "Sandwich", businessName: "Club Sandwich Co.", foodType: "Non-Veg", ratings: "4.3", thumNailAssetPath: "assets/images/sandwich.jpg"),
  ];

  List<Food> _filteredFoodList = [];
  List<Food> get filteredFoodList => _filteredFoodList;

  setFoodItems(List<Food> value) {
    _filteredFoodList = value;
  }

  void searchFood(String query) {
    List<Food> searchItems = [];
    searchItems = foodItems.where((food) {
      return food.name.toLowerCase().contains(query.toLowerCase()) ||
          food.category.toLowerCase().contains(query.toLowerCase()) ||
          food.businessName.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setFoodItems(searchItems);
    notifyListeners();
  }
  
  ViewType _viewType = ViewType.grid;
  ViewType get viewType => _viewType;
  void toggleViewType() {
    _viewType = _viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    notifyListeners();
  }

}