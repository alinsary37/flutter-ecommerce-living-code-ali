import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/shipping_address.dart';
import 'package:flutter_ecommerce/views/widgets/checkout/shipping_address_component.dart';
import 'package:provider/provider.dart';

import '../../../controllers/database_controller.dart';

class ShippingAddressesPage extends StatefulWidget {
  const ShippingAddressesPage({super.key});

  @override
  State<ShippingAddressesPage> createState() => _ShippingAddressesPageState();
}

class _ShippingAddressesPageState extends State<ShippingAddressesPage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping Addresses',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<ShippingAddress>>(
          stream: database.getShippingAddresses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final shippingAddres = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: shippingAddres!.map((shippingAddres) => ShippingAddressComponent(shippingAddress: shippingAddres)).toList()),
              );
            }
            return const Center(
              child: Text('No Data Available!'),
            );
          },
        ),
      ),
    );
  }
}
