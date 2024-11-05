import 'package:flutter/material.dart';
import '../model/food_model.dart';

class CartCheckout extends StatefulWidget {
  final List<Food> cartItems;
  const CartCheckout({super.key, required this.cartItems});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  Map<String, List<Food>> items = {};

  @override
  void initState() {
    items = groupCartItemsByName(widget.cartItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1, // Minimum height
                  maxHeight: MediaQuery.of(context).size.height * 0.22, // Maximum height
                ),
                child: ListView.builder(
                itemCount: items.keys.toList().length,
                itemBuilder: (context, index) {
                  String foodName = items.keys.toList()[index];
                  List<Food> foods = items[foodName]!;
                  return _buildCartItem(foodName, double.tryParse(foods[0].price) ?? 0, foods.length);
                }
              )),
            ),
            const SizedBox(height: 20),
            _buildOrderSummary(items,context),
            const SizedBox(height: 20),
            _buildPromoCodeInput(),
            const SizedBox(height: 20),
            _buildPaymentMethodSection(),
            const Spacer(),
            _buildDeliveryAddress(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                ),
                child: const Text('Proceed to Payment',style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, double price, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$$price', style: const TextStyle(color: Colors.red)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  // Decrease quantity logic
                },
              ),
              Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  // Increase quantity logic
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(Map<String, List<Food>> items,context) {
    double totalAmount = 0.0;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.08,
                maxHeight: MediaQuery.of(context).size.height * 0.12,
              ),
              child: ListView.builder(
                itemCount: items.keys.toList().length,
                itemBuilder: (context, index) {
                  String foodName = items.keys.toList()[index];
                  List<Food> foods = items[foodName]!;
                  totalAmount += double.tryParse(foods[0].price) ?? 0;
                  return _buildOrderSummaryItem(foodName, double.tryParse(foods[0].price) ?? 0,);
                }
              ),
            ),
          ),
          const Divider(),
          _buildOrderSummaryItem('Total Amount', totalAmount, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryItem(String name, double price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCodeInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter promo code',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          value: 'Credit Card',
          onChanged: (value) {
            // Handle payment method change
          },
          items: ['Credit Card', 'PayPal'].map((method) {
            return DropdownMenuItem(
              value: method,
              child: Text(method),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '123 Main St, Springfield',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: const Text('Need Help? Contact Support', style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.normal)),
              ),
              InkWell(
                onTap: () {},
                child: const Text('Terms and Conditions', style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

Map<String, List<Food>> groupCartItemsByName(List<Food> cartItems) {
  Map<String, List<Food>> groupedItems = {};

  for (var item in cartItems) {
    if (groupedItems.containsKey(item.name)) {
      groupedItems[item.name]!.add(item);
    } else {
      groupedItems[item.name] = [item];
    }
  }

  return groupedItems;
}