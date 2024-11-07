import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: cart.isEmpty
          ? const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_rounded,
                    size: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your Cart is Empty",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cart[index];
                return ListTile(
                  title: Text(
                    cartItem["title"] as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text("Size: ${cartItem["size"].toString()}"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem["imageUrl"] as String),
                    radius: 30,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Delete Product"),
                            titleTextStyle: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            content: const Text(
                              "Are you sure you want to delete the product?",
                              style: TextStyle(fontSize: 20),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                                onPressed: () {
                                  Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 28,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
