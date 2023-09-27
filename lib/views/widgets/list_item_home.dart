import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/assets.dart';

import '../../services/product.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                product.imgUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.red),
                    child: Center(
                        child: Text(
                      '${product.discountValue}%',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.grey),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '${product.price}\$',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
          )
        ],
      ),
    );
  }
}
