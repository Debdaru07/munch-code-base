import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food_model.dart';
import '../view_model/search_food_view_model.dart';

class FoodDeliveryListing extends StatefulWidget {
  const FoodDeliveryListing({super.key});

  @override
  State<FoodDeliveryListing> createState() => _FoodDeliveryListingState();
}

class _FoodDeliveryListingState extends State<FoodDeliveryListing> {
  TextEditingController controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return  Consumer<FoodViewModel>(
      builder: (context, viewModel, child) {
        final foodList = viewModel.filteredFoodList.isNotEmpty ? viewModel.filteredFoodList : viewModel.foodItems;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.yellow[200],
            title: TextField(
            controller: controller,
            onChanged: (val) => viewModel.searchFood(controller.text),
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey ),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,color: Colors.grey,),
            ),
          ),),
          body: foodList.isEmpty? const Center(child: Text('No items found')): viewType(viewModel, foodList),
          floatingActionButton: Consumer<FoodViewModel>(
            builder: (context, viewModel, child) {
              return FloatingActionButton(
                onPressed: () => viewModel.toggleViewType(),
                backgroundColor: Colors.orange,
                tooltip: viewModel.viewType == ViewType.grid ? "Switch to List View" : "Switch to Grid View",
                child: Icon(viewModel.viewType == ViewType.grid ? Icons.view_list : Icons.grid_view,color: Colors.white,),
              );
            },
          ),
        );
      } 
    );
  }

  Widget viewType(FoodViewModel viewModel, List<Food> foodList) => viewModel.viewType == ViewType.grid ? gridView(foodList) : listView(foodList);

  Widget listViewCard(Food food) => ListTile(
    leading: Image.asset(
      food.thumNailAssetPath,
      width: 50,
      height: 50,
    ),
    title: Text(food.name),
    subtitle: Text('${food.category} - ${food.businessName} - ${food.foodType} - ${food.ratings}⭐'),
  );

  Widget listView(List<Food> foodList) => ListView.builder(
    itemCount: foodList.length,
    itemBuilder: (context, index) {
      final food = foodList[index];
      return listViewCard(food);
    }
  );

  Widget gridView(List<Food> foodList) => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.7,
    ),
    itemCount: foodList.length,
    itemBuilder: (context, index) {
      final food = foodList[index];

      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageGridViewThumbnail(food.thumNailAssetPath),
            otherBodyContentGridView(food)
          ],
        ),
      );
    },
  );

  Widget imageGridViewThumbnail(String assetPath) => ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
    child: Image.asset(
      assetPath,
      width: double.infinity,
      height: 80,
      fit: BoxFit.cover,
    ),
  );

  Widget otherBodyContentGridView(Food food) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(food.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis,),
        const SizedBox(height: 3),
        Text('${food.category} - ${food.businessName}',style: TextStyle(fontSize: 10, color: Colors.grey[700]),maxLines: 2, overflow: TextOverflow.ellipsis,),
        const SizedBox(height: 3),
        Text('${food.foodType} - ${food.ratings}⭐', style: TextStyle(fontSize: 10, color: Colors.orange[800]),),
      ],
    ),
  );
}