import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/services/auth.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainButton(onPressed: (){
            auth.logout();

          }, text: 'Log out')
        ],
      ),
    );
  }
}
