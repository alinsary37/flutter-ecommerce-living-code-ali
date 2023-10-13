import 'package:flutter/material.dart';

import '../../../utilities/assets.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(AppAssets.masterCardIcon,fit: BoxFit.cover,
          height: 50,
          ),
        ),
        const SizedBox(width: 16.0,),
        Text('**** **** **** 1234',)
      ],
    );
  }
}
