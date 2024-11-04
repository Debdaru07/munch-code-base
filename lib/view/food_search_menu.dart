import 'package:flutter/material.dart';

class FoodDeliveryListing extends StatefulWidget {
  const FoodDeliveryListing({super.key});

  @override
  State<FoodDeliveryListing> createState() => _FoodDeliveryListingState();
}

class _FoodDeliveryListingState extends State<FoodDeliveryListing> {
  TextEditingController controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: TextField(
        controller: controller,
        onChanged: (val) {},
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey ),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Colors.grey,),
        ),
      ),),
      body: const Center(child: Text("What's on your mind ... ")),
    );
  }
}