import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/services/auth.dart';
// import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/pages/auth_page.dart';
import 'package:provider/provider.dart';

import 'bottom_navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.active){
           final user = snapshot.data;
           if (user == null){
             return ChangeNotifierProvider<AuthController>(
                 create: (_) => AuthController(auth: auth),
                 child: const AuthPage());
           }
           return const  BottomNavBar();
         }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
