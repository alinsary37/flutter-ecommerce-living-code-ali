import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/database_controller.dart';
import 'package:flutter_ecommerce/models/deliver_methods.dart';
import 'package:flutter_ecommerce/models/shipping_address.dart';
import 'package:flutter_ecommerce/utilities/assets.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/widgets/checkout/delivery_methodItemItem.dart';
import 'package:flutter_ecommerce/views/widgets/checkout/shipping_address_component.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../widgets/checkout/checkout_order_deralis.dart';
import '../../widgets/checkout/payment_componenent.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              StreamBuilder<List<ShippingAddress>>(
                stream: database.getShippingAddresses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final shippingAddress = snapshot.data;
                    if (shippingAddress == null || shippingAddress.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Text('No Data Available!'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRouts.addShippingAddress, arguments: database);
                              },
                              child: const Text('Add shipping address'),
                            )
                          ],
                        ),
                      );
                    }
                    if (shippingAddress.isNotEmpty) {
                      return ShippingAddressComponent();
                    }
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
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.redAccent,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const PaymentComponent(),
              const SizedBox(
                height: 16.0,
              ),
              StreamBuilder<List<DeliveryMethod>>(
                stream: database.deliveryMethodStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final deliverBy = snapshot.data;
                    if (deliverBy == null || deliverBy.isEmpty) {
                      return const Center(child: Text('No Data Available!'));
                    }
                    if (deliverBy.isNotEmpty) {
                      return SizedBox(
                        height: size.height * 0.12,
                        child: ListView.builder(
                          itemCount: deliverBy.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DeliveryMethodItem(
                                deliveryMethod: deliverBy[i]),
                          ),
                        ),
                      );
                    }
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
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Delivery method',
                style: Theme.of(context).textTheme.headline6,
              ),
              const CheckoutOrderDetails(),
              const SizedBox(
                height: 64.0,
              ),
              MainButton(
                onPressed: () {},
                text: 'Submit Order',
                hasCircularBorder: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
