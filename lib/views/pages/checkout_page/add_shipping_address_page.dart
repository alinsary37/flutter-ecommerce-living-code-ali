import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/database_controller.dart';
import 'package:flutter_ecommerce/models/shipping_address.dart';
import 'package:flutter_ecommerce/views/widgets/main_dialog.dart';
import 'package:provider/provider.dart';

import '../../../utilities/constant.dart';
import '../../widgets/main_button.dart';

class AddShippingAddressPage extends StatefulWidget {
  ShippingAddress? shippingAddress;
  AddShippingAddressPage({super.key, this.shippingAddress});

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  ShippingAddress? shippingAddress;

  @override
  void initState() {
    shippingAddress = widget.shippingAddress;
    if (shippingAddress  != null){
      _fullNameController.text = shippingAddress!.fullName;
      _addressController.text = shippingAddress!.address;
      _cityController.text = shippingAddress!.city;
      _stateController.text = shippingAddress!.state;
      _zipCodeController.text = shippingAddress!.zipCode;
      _countryController.text = shippingAddress!.country;
    }
    super.initState();
  }
  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
    }
  Future<void> saveAddress(Database database) async {
    try {
      if (_formKey.currentState!.validate()) {
        final address = ShippingAddress(
          id:shippingAddress != null ? shippingAddress!.id : documentIdFromLocalData(),
          fullName: _fullNameController.text.trim(),
          country: _countryController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          state: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
        );
        await database.savingAddress(address);
        if (!mounted) return;
        Navigator.of(context).pop();
      }
    } catch (e) {
      MainDialog(
          context: context,
          title: 'Error Saving Address',
          content: e.toString())
          .showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adding Shipping Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const  InputDecoration(
                      labelText: 'Full Name',
                      fillColor: Colors.white,
                      filled: true),

                  controller: _fullNameController,
                  validator: (value) =>
                      value!.isNotEmpty ? null : 'please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    fillColor: Colors.white,
                    filled: true,
                  ),

                  validator: (value) =>
                      value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    fillColor: Colors.white,
                    filled: true,
                  ),

                  validator: (value) =>
                      value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(

                  decoration: const InputDecoration(
                    labelText: 'State/Province',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  initialValue: shippingAddress?.state,
                  validator: (value) =>
                      value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(

                  decoration: const InputDecoration(
                    labelText: 'Zip Code',
                    fillColor: Colors.white,
                    filled: true,
                  ),

                  validator: (value) =>
                      value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    fillColor: Colors.white,
                    filled: true,
                  ),

                  validator: (value) =>
                      value!.isNotEmpty ? null : 'Please enter your name',
                ),
                const SizedBox(height: 32.0),
                MainButton(
                  text: 'Save Address',
                  onPressed: () => saveAddress(database),
                  hasCircularBorder: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
