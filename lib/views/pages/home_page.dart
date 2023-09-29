import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/assets.dart';
import 'package:flutter_ecommerce/views/widgets/list_item_home.dart';

import '../../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildHeaderOfList(BuildContext context,
      // {} فائدته علمود انطي اسم للمتغيرات
      {required String title,
      required VoidCallback? onTap,
      required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey,
              ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(
                AppAssets.topBannerHomePageAssets,
                height: size.height * 0.3,
                width: double.infinity,
              ),
              // معنى opacity هي عتامة
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: 'Sale',
                    onTap: () {},
                    description: 'Super Summer Sale!'),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: e),
                            ))
                        .toList(),
                  ),
                ),
                _buildHeaderOfList(
                  context,
                  title: 'New',
                  onTap: () {},
                  description: 'Super Summer Product',
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: e),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
