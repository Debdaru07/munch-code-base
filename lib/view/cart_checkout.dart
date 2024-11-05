import 'package:flutter/material.dart';

import '../model/food_model.dart';

class CartCheckout extends StatefulWidget {
  final List<Food> cartItems;
  const CartCheckout({super.key, required this.cartItems});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Checkout'), backgroundColor: Colors.yellow,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.13,
            //   child: ListView.builder(
            //     itemCount: widget.cartItems.length, 
            //     itemBuilder: (context, index) {
            //       final item = widget.cartItems[index];
            //       return ListTile(
            //         title: Text(item.name), 
            //         trailing: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             IconButton(
            //               onPressed: () { },
            //               icon: const Icon(Icons.remove),
            //             ),
            //             Expanded(
            //               child: ConstrainedBox(
            //                 constraints: const BoxConstraints( maxHeight: 100.0,),
            //                 child: Text(widget.cartItems.length.toString()),
            //               ),
            //             ),
            //             IconButton(
            //               onPressed: () {},
            //               icon: const Icon(Icons.add),
            //             ),
            //             Text('\$${item.price * int.parse(widget.cartItems.length.toString())}'),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // _buildOrderSummary(widget.cartItems),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter promo code',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Payment Method'),
            const ListTile(
              title: Text('Credit Card'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            const ListTile(
              title: Text('PayPal'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Proceed to Payment'),
            ),
            const SizedBox(height: 16.0),
            const Text('Delivery Address'),
            const Text('123 Main St, Springfield'),
            const Text('Need Help? Contact Support'),
            const Text('Terms and Conditions'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(List<Food> items) {
    double total = 0;
    for (final item in items) {
      total += double.parse(item.price) * double.parse(widget.cartItems.length.toString());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((item) => Text('${item.name} \$${item.price * int.parse(widget.cartItems.length.toString())}')),
        const SizedBox(height: 8.0),
        const Text('Total Amount'),
        Text('\$${total.toStringAsFixed(2)}'),
      ],
    );
  }

}