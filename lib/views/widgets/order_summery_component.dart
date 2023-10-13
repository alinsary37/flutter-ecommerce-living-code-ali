import 'package:flutter/material.dart';

class OrderSummeryComponent extends StatelessWidget {
  final String title;
  final String value;
  const OrderSummeryComponent({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style:
          Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
