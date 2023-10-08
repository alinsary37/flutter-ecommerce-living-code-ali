import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/assets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ecommerce/utilities/router.dart';

import '../../services/product.dart';

class ListItemHome extends StatefulWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  State<ListItemHome> createState() => _ListItemHomeState();
}

class _ListItemHomeState extends State<ListItemHome> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // الغاية من روت نيفيكيتر علمود يطلع من bottom bar
        Navigator.of(context, rootNavigator: true)
            .pushNamed(AppRouts.productDetailsRoute, arguments: widget.product);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.product.imgUrl,
                  height: 240,
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
                        '${widget.product.discountValue}%',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.43,
                  bottom: 0.10,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: 25.0,
                        rating: widget.product.rate?.toDouble() ?? 4.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      Text('(100)',style: Theme.of(context).textTheme.titleSmall,)
                    ],
                  ),
                  Text(
                    widget.product.category,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${widget.product.price}\$',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
