import 'package:flutter/material.dart';

import '../../model/food_model.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('data'),),
    );
  }
}