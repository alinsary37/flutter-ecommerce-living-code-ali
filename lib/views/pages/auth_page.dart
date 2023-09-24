import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authType == AuthFormType.login? 'LogIn': 'Register',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 64.0,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter your email' : null,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Enter your Email'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter your password' : null,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Enter your password'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                if (_authType == AuthFormType.login)
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: const Text('Forget your password?'),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MainButton(onPressed: () {}, text:_authType == AuthFormType.login? 'LogIn': 'Register'),
                const SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child:  Text(_authType == AuthFormType.login? 'Don\'t have account? Register':'Have account? LogIn'),
                    onTap: () {
                      setState(() {
                      if ( _authType == AuthFormType.login) {
                        _authType =  AuthFormType.register;
                      } else {
                        _authType = AuthFormType.login;
                      }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      _authType == AuthFormType.login? 'Or Login with': 'Or Register with',
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
