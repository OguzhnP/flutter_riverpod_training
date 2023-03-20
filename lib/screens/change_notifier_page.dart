import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:mvvm_architecture/models/product_model.dart';
import 'package:mvvm_architecture/providers.dart';

class ChangeNotifierProviderScreen extends ConsumerWidget {
  const ChangeNotifierProviderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('ChangeNotifier Provider'),
        trailing: Stack(children: [
          //Shopping cart icon with a badge
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Show a dialog with the cart contents
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Cart'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Show the cart contents
                        ...cartNotifier.cart.map((item) => Text(item.title)),
                        const SizedBox(height: 16),
                        // Sum the total price of the cart
                        Text(
                          'Total: \$${cartNotifier.cart.fold<double>(0, (sum, item) => sum + item.price)}',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Clear the cart
                          ref.read(cartNotifierProvider.notifier).clearCart();
                          Grock.snackBar(
                              title: "Congrats",
                              description: "The cart is empty, now",
                              position: SnackbarPosition.bottom,
                              leading: const Icon(CupertinoIcons.check_mark));
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          //Badge
          Positioned(
            right: 0,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                cartNotifier.cart.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ),
      body: Column(
        children: [
          // A list of products and a button to add to cart
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Add the product to the cart
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addProduct(product);

                      Grock.snackBar(
                          title: "Congrats",
                          description: "Has been added the cart",
                          position: SnackbarPosition.bottom,
                          leading: const Icon(CupertinoIcons.check_mark));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
