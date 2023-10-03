import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/services/auth.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';
import 'package:flutter_ecommerce/utilities/router.dart';
import 'package:flutter_ecommerce/views/widgets/main_button.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit (AuthController model) async {
    try{
      await model.submit();
      if(!mounted) return;
      Navigator.pushNamed(context, AppRouts.landingPageRote);
    }catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          content: Text(
            e.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'))
          ],
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return  Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.authFormType == AuthFormType.login ? 'LogIn' : 'Register',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                        val!.isEmpty ? 'Please Enter your email' : null,
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        onChanged: model.updateEmail,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            labelText: 'Email', hintText: 'Enter your Email'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                        val!.isEmpty ? 'Please Enter your password' : null,
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        onChanged: model.updatePassword,
                        decoration: const InputDecoration(
                            labelText: 'Password', hintText: 'Enter your password'),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      if (model.authFormType == AuthFormType.login)
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
                      MainButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(model);
                            }
                          },
                          text:
                          model.authFormType == AuthFormType.login ? 'LogIn' : 'Register'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text(model.authFormType == AuthFormType.login
                              ? 'Don\'t have account? Register'
                              : 'Have account? LogIn'),
                          onTap: () {
                            _formKey.currentState!.reset();
                            model.toggleFormType();
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.14,),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            model.authFormType == AuthFormType.login
                                ? 'Or Login with'
                                : 'Or Register with',
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
          ),
        );
      },
    );
  }
}
