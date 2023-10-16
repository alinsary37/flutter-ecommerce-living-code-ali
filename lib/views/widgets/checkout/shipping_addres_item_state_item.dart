import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/database_controller.dart';
import 'package:flutter_ecommerce/models/shipping_address.dart';
import 'package:flutter_ecommerce/utilities/args_models/add_shipping_address_args.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:provider/provider.dart';

class ShippingAddressStateItem extends StatefulWidget {
  final ShippingAddress shippingAddress;

  const ShippingAddressStateItem({Key? key, required this.shippingAddress})
      : super(key: key);

  @override
  State<ShippingAddressStateItem> createState() =>
      _ShippingAddressStateItemState();
}

class _ShippingAddressStateItemState extends State<ShippingAddressStateItem> {
  late bool checkedValue;

  @override
  void initState() {
    checkedValue = widget.shippingAddress.isDefault;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
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
                  widget.shippingAddress.fullName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        AppRouts.addShippingAddressRoute,
                        arguments: AddShippingAddressArgs(database: database,shippingAddress: widget.shippingAddress));
                  },
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.redAccent,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.shippingAddress.address,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${widget.shippingAddress.city}, ${widget.shippingAddress.state}, ${widget.shippingAddress.country}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8.0,
            ),
            CheckboxListTile(
                title: const Text("Default shipping address"),
                value:  checkedValue, onChanged: (newValue)async{
              setState(() {
                checkedValue = newValue!;
              });
              final newAddress = widget.shippingAddress.copyWith(isDefault: newValue);
              await database.savingAddress(newAddress);
            }),
          ],
        ),
      ),
    );
  }
}
