import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/database_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_list_item.dart';
import '../widgets/main_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder(
      stream: database.myProductsCart(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final cartItem = snapshot.data;
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),
                    Text(
                      'My Cart',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                    ),
                    if (cartItem == null || cartItem.isEmpty)
                      Center(
                        child: Text(
                          'No Data Available!',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    if (cartItem != null && cartItem.isNotEmpty)
                      ListView.builder(
                        itemCount: cartItem.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, int i) => CartListItem(
                          cartItem: cartItem[i],
                        ),
                      ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount:',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '1250\$',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    MainButton(
                      text: 'Checkout',
                      onPressed: () {},
                      hasCircularBorder: true,
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          );
        }
        return SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        );
      },
    );
  }
}
