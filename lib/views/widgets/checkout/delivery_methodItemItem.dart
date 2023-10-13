import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/deliver_methods.dart';

class DeliveryMethodItem extends StatelessWidget {
  final DeliveryMethod  deliveryMethod;
  const DeliveryMethodItem({super.key,required this.deliveryMethod});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              deliveryMethod.imgUrl,
              fit: BoxFit.cover,
              height: 30,
            ),
           const SizedBox(height: 6.0,),
            Text(deliveryMethod.days, style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
