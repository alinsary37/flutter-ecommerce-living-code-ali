import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/widgets/order_summery_component.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrderSummeryComponent(title: 'Order', value: '1250\$'),

        OrderSummeryComponent(title: 'Delivery', value: '15\$'),
        SizedBox(height: 8.0,),
        OrderSummeryComponent(title: 'Summery', value: '140\$'),
      ],
    );
  }
}
