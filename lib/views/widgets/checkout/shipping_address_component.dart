import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/shipping_address.dart';

class ShippingAddressComponent extends StatelessWidget {
  final ShippingAddress shippingAddress;
   const ShippingAddressComponent({Key? key, required this.shippingAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tarek Alabd',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
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
            const SizedBox(height: 8.0),
            Text(
              '13 Mossaddak Street',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Dokki, Giza, Egypt',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );

  }
}

